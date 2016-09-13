<?php

	/* For Session Control - Don't remove this */
	$user->allow_access(3);	
	/* End Session Control */
		
	$personals = $personal->Enumerate('lastname_paterno ASC');
	$smarty->assign('personals', $personals);
	$smarty->assign('mnuMain','catalogos');
	$smarty->assign('mnuSubmain','personal');	


	if($_POST)
	{
		if($_POST["type"] == 'saveEditPersonal')
		{

			$personal->setPositionId($_POST['positionId']);
			$personal->setPersonalId($_POST['id']);
			$personal->setName($_POST['name']);
			$personal->setLastnamePaterno($_POST['lastname_paterno']);
			$personal->setLastnameMaterno($_POST['lastname_materno']);
			$personal->setStateId($_POST['stateId']);
			$personal->setUserName($_POST['username']);
			$personal->setPasswd($_POST['passwd']);
			$personal->setDescription($_POST['description']);

			$_POST['list_roles'] = implode(',', $_POST['role_from']);
			$personal->setRolesId($_POST['list_roles']);

			$personal->setCurp($_POST['curp']);
			$personal->setRfc($_POST['rfc']);
			$personal->setSexo($_POST['sexo']);
			$personal->setFechaNacimiento($_POST['fecha_nacimiento']);
			$personal->setFechaSep($_POST['fecha_sep']);
			$personal->setFechaDgta($_POST['fecha_dgta']);
			$personal->setClavesPresupuestales($_POST['claves_presupuestales']);
			$personal->setCategoria($_POST['categoria']);
			$personal->setPerfil($_POST['perfil']);

			$personal->setCorreo($_POST['correo']);
			$personal->setCelular($_POST['celular']);

			if($_FILES)
			{
				$_POST['foto'] = $personal->UpdateFoto($_POST['id']);
				$personal->setFoto($_POST['foto']);
			}

			$personal->Update();
		}
	}

?>