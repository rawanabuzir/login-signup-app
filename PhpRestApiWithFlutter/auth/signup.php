<?php
include "../connect.php";
// $username =htmlspecialchars(strip_tags($_POST['username']));
// $email =htmlspecialchars(strip_tags($_POST['email']));
// $password =htmlspecialchars(strip_tags($_POST['password']));
$username =filterRequest("username");
$email =filterRequest("email");
$password =filterRequest("password");
$stmt=$con->prepare("
INSERT INTO `users`( `username`, `email`, `password`) VALUES (?,?,?)
");
$stmt->execute(array($username ,$email ,$password ));
$COUNT=$stmt->rowCount();
if($COUNT>0)
{echo json_encode(array("status"=>"success"));}
else{echo json_encode(array("status"=>"faild"));}