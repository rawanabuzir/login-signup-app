<?php
include "../connect.php";
// $username =htmlspecialchars(strip_tags($_POST['username']));
// $email =htmlspecialchars(strip_tags($_POST['email']));
// $password =htmlspecialchars(strip_tags($_POST['password']));

$email =filterRequest("email");
$password =filterRequest("password");
$stmt=$con->prepare("
SELECT * FROM users WHERE `password`=? AND email=?
");
$stmt->execute(array($password,$email  ));
$COUNT=$stmt->rowCount();
if($COUNT>0)
{echo json_encode(array("status"=>"success"));}
else{echo json_encode(array("status"=>"faild"));}