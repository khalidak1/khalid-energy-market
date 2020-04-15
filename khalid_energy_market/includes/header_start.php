<?php session_start();
    include 'pdo_class_data.php';
    include 'connection.php';
    include 'administrator/function.php';
    $pdo_auth = authenticate();
    $pdo = new PDO($dsn, $user, $pass, $opt); 
    $query = $_SERVER['PHP_SELF'];
    $path = pathinfo( $query );
    $what_you_want = $path['basename'];
   	// echo $what_you_want;
   	if($what_you_want!="kyc.php"){
   		if($pdo_auth['kyc_approved']=="Pending"){
		      header('Location:kyc.php?choice=error&value=Please Submit Your KYC Details, Once They Are Approved You will be able to Navigate');
		      exit();
		    }
   	}
   

     $result = $pdo->exec("UPDATE `users` SET `tutorial_taken`='Yes' WHERE `id`=".$pdo_auth['id']."");  
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">

    <!-- App Favicon -->
   <link rel="apple-touch-icon" sizes="57x57" href="khn.png">
    <link rel="apple-touch-icon" sizes="60x60" href="khn.png">
    <link rel="apple-touch-icon" sizes="72x72" href="khn.png">
    <link rel="apple-touch-icon" sizes="76x76" href="khn.png">
    <link rel="apple-touch-icon" sizes="114x114" href="khn.png">
    <link rel="apple-touch-icon" sizes="120x120" href="khn.png">
    <link rel="apple-touch-icon" sizes="144x144" href="khn.png">
    <link rel="apple-touch-icon" sizes="152x152" href="khn.png">
    <link rel="apple-touch-icon" sizes="180x180" href="khn.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="khn.png">
    <link rel="icon" type="image/png" sizes="32x32" href="khn.png">
    <link rel="icon" type="image/png" sizes="96x96" href="khn.png">
    <link rel="icon" type="image/png" sizes="16x16" href="khn.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="khn.png">
    <meta name="theme-color" content="#ffffff">

    <!-- App title -->
    <title><?php include 'title.php'; ?></title>


    <!-- Switchery css -->
    <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" />

    

