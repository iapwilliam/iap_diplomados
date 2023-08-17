<?php
/* if($_SESSION['User']['type'] != 'student')
    exit; */
/* echo "<pre>";
print_r($_POST);
exit; */
if($_POST)
{
    $estatus = intval($_POST['Estatus']);
    $referencia3d = $_POST['REFERENCIA3D'];
    $pagoId = explode('IAP', $referencia3d);
    $pagoId = intval($pagoId[1]);
    $cobro_tarjeta = $conceptos->getCobroTarjeta($referencia3d);
    $conceptos->setCobroTarjetaId($cobro_tarjeta['id']);
    if($estatus == 200)
    {
        try
        {
            $eci = $_POST['ECI'];
            $xid = $_POST['XID'];
            $cavv = $_POST['CAVV'];
            $conceptos->setPagoId($pagoId);
            $pago = $conceptos->pago();
            $conceptos->setConcepto($pago['concepto_id']);
            $concepto = $conceptos->getConcepto();
            $abonos = 0;
            if ($pago['cobros'] > 0)
                $abonos = $conceptos->monto();
            $monto = $pago['total'] - $abonos;
            $data = [
                'ID_AFILIACION' => ID_AFILIACION,
                'USUARIO' => BN_USUARIO,
                'CLAVE_USR' => BN_CLAVE,
                'CMD_TRANS' => 'VENTA',
                'ID_TERMINAL' => ID_TERMINAL,
                'MONTO' => 2, // $monto
                'MODO' => BN_MODO,
                'NUMERO_TARJETA' => $cobro_tarjeta['numero_tarjeta'],
                'FECHA_EXP' => $cobro_tarjeta['fecha_exp'],
                'CODIGO_SEGURIDAD' => $cobro_tarjeta['codigo_seguridad'],
                'MODO_ENTRADA' => 'MANUAL',
                'ESTATUS_3D' => $estatus,
                'ECI' => $eci,
                'XID' => $xid,
                'CAVV' => $cavv,
                'VERSION_3D' => 2
            ];
            /* echo "<pre>";
            print_r($data);
            exit; */
            $data_string = http_build_query($data);
            // echo $data_string; exit;
            $curl = curl_init();
            if ($curl === false)
                throw new Exception('Failed to initialize');
            curl_setopt($curl, CURLOPT_URL, 'https://via.pagosbanorte.com/payw2');
            curl_setopt($curl, CURLOPT_HEADER, true); 
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, BN_SSL);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            $header = curl_exec($curl);
            if ($header === false)
                throw new Exception(curl_error($curl), curl_errno($curl));
            $header_index_array = explode("\r\n", $header);
            $result = [];
            $status_message = array_shift($header_index_array);
            foreach ($header_index_array as $value) 
            {
                if(false !== ($matches = explode(':', $value, 2)))
                    $result["{$matches[0]}"] = trim($matches[1]);           
            }
            curl_close($curl);
            /* echo "<pre>";
            print_r($result);
            exit; */
            $resultado_payw = $result['RESULTADO_PAYW'];
            $texto = $result['TEXTO'];
            $fecha_req_cte = $result['FECHA_REQ_CTE'];
            $codigo_aut = $result['CODIGO_AUT'];
            $referencia = $result['REFERENCIA'];
            $fecha_rsp_cte = $result['FECHA_RSP_CTE'];
            if($resultado_payw == 'A')
            {
                $fecha_pago = date('Y-m-d');
                $fecha_pago = "'{$fecha_pago}'";
                $montoActual = $conceptos->monto();
                $totaltemporal = $monto + $montoActual;
                if($pago['cobros'] == 0 && $monto == $pago['total'])
                { 
                    //Pago único
                    $descuento = $pago['subtotal'] - $pago['total'];
                    $subtotal = $pago['subtotal']; 
                }
                elseif($totaltemporal != $pago['total'])
                { 
                    //Si es un abono
                    $subtotal = $monto;
                    $descuento = 0;  
                }
                else
                { 
                    //Es el último abono
                    $descuento = $pago['subtotal'] - $pago['total'];
                    $subtotal = $pago['subtotal'] - $montoActual;
                }
                $conceptos->setCosto($subtotal); 
                $conceptos->setDescuento($descuento);
                $conceptos->setMonto($monto);
                $conceptos->setFechaPago($fecha_pago);
                $cobroId = $conceptos->guardar_cobro(); 
                $conceptos->closeCobroTarjeta('Paid', $resultado_payw, $texto, $fecha_req_cte, $codigo_aut, $referencia, $fecha_rsp_cte, $cobroId);
                $cobro_tarjeta = $conceptos->getCobroTarjeta($referencia3d);
                $montoTotalCobrado = $conceptos->monto(); 
                if ($montoTotalCobrado == $pago['total']) 
                {
                    $conceptos->setFechaCobro("'{$pago['fecha_cobro']}'");
                    $conceptos->setFechaLimite("'{$pago['fecha_limite']}'"); 
                    $conceptos->setCosto($pago['subtotal']);
                    $conceptos->setTotal($pago['total']);
                    $conceptos->setDescuento($pago['descuento']);
                    $conceptos->setBeca($pago['beca']);
                    $conceptos->setTolerancia($pago['tolerancia']);
                    $conceptos->setStatus(2);
                    $conceptos->setPeriodo($pago['periodo']);
                    $conceptos->setUserId($pago['alumno_id']);
                    $conceptos->actualizar_pago(); 
                }
                $smarty->assign('success', true);
                $smarty->assign('cobro_tarjeta', $cobro_tarjeta);
            }
            else
            {
                $conceptos->closeCobroTarjeta('Declined', $resultado_payw, $texto, $fecha_req_cte, $codigo_aut, $referencia, $fecha_rsp_cte);
            }
            /**
             * RESULTADO_PAYW
             * A - Aprobada
             * D - Declinada
             * R - Rechazada
             * T - Sin respuesta del autorizador
             * 
             * TEXTO
             * Texto adicional que proporciona mayor explicación sobre el resultado de la transacción
             * 
             * FECHA_REQ_CTE
             * Fecha y hora en que la transacción / comando fue recibida del cliente en horario Payworks. Formato: AAAAMMDD HH:MM:SS.sss
             * 
             * CODIGO_AUT
             * Código de autorización entregado por el autorizador para una transacción aprobada
             * 
             * REFERENCIA
             * Número de referencia asignada a esta transacción por parte de Payworks
             * 
             * ID_AFILIACION
             * El número de afiliación a la que corresponde la transacción respondida
             * 
             * FECHA_RSP_CTE
             * Fecha y hora en que la transacción / comando fue respondido al cliente. Formato: AAAAMMDD HH:MM:SS.sss
             */
        }
        catch(Exception $ex)
        {
            var_dump($ex);
        }
    }
    else
    {
        $conceptos->deleteCobroTarjeta('NoAuth');
        $smarty->assign('success', false);
        $smarty->assign('message', 'El cobro ha sido declinado debido a que la tarjeta no pudo ser autentida mediante 3D Secure 2.0');
    } 
}

/* Variables GET
Array
(
    [page] => procesar-pago
)
Variables POST
Array
(
    [ECI] => 05
    [XID] => 00050100582458000000C3504842267500000000
    [CAVV] => 00050100582458000000C3504842267500000000
    [Estatus] => 200
    [REFERENCIA3D] => IAPDB0000000294
) */