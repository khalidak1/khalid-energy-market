<?php  include 'connection.php';
  include 'add_notification_user.php';
  include 'administrator/function.php';
  $pdo = new PDO($dsn, $user, $pass, $opt);
  //print_r($_REQUEST);
  extract($_REQUEST);

  try {
      $stmt = $pdo->prepare('SELECT * FROM `users` WHERE `email`="'.$email.'"  ORDER BY date DESC ');
  } catch(PDOException $ex) {
      echo "An Error occured!"; 
      print_r($ex->getMessage());
  }
  
	if (empty($_POST["email"])) {
	    $emailErr = "Email is required";
	  } else {
	    $email = ($_POST["email"]);
	    // check if e-mail address is well-formed
	    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
	     header('Location:sign_in.php?choice=error&value=Incorrect Email, Please Enter Valid Email Address');
	    }
	  }


  $stmt->execute();
  $user = $stmt->fetchAll();
  $count = count($user);  
  if($count>0){
    header('Location:register.php?choice=error&value=A User with Either Same Email or Same Transaction Address Already Exist');
    exit();
  }


  //Generate address and Associate with this account 
  if(empty($_REQUEST['tx_address'])){
     $stmt = $pdo->prepare('SELECT * FROM `tx_addresses` WHERE `status`="Pending" LIMIT 1');
     $stmt->execute();
     $fata = $stmt->fetch();  
     //print_r($fata);

      $table = "tx_addresses";
      $result = $pdo->exec("UPDATE $table SET `status`='Used', `email`='".$email."'  WHERE id=".$fata['id']);
      $tx_address = $fata['tx_address'];
  }



  // add Member to the List
  if(isset($_REQUEST['add_user'])){

  	  $secret = "";
      //print_r($_REQUEST);
      $table = "users";
      $name = explode("@", $email);
      $uniq = uniqid();

      $key_list = "`name`, `email`, `tx_address`, `verified`, `password`,`activation_code`";
      $value_list = "'".$name[0]."',";
      $value_list.="'".$email."',";
      $value_list.="'".$tx_address."',";
      $value_list.="'Yes',";
      $value_list.="'".$_REQUEST['password']."',";
      $value_list.="'".$uniq."'";
      $result = $pdo->exec("INSERT INTO `$table` ($key_list) VALUES ($value_list)");
     //echo "INSERT INTO `$table` ($key_list) VALUES ($value_list)";
      add_notification("A New User Created", "admin");
    
    header('Location:index.php?choice=success&value=Registeration Complete&passcode='.base64_encode($email));
    //echo $message;
     exit();
    }
?>