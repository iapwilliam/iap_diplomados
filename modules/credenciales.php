<?php
if($_POST){
    $response = $credentials->dt_credentials_request($_POST); 
    print_r(json_encode($response)); 
    exit;
}