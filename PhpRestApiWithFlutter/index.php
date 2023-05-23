<?php
include "connect.php";
$stmt = $con -> prepare("INSERT INTO `users`( `username`, `email`) VALUES ('mutaz','mutaz_abuzer@gmail.com')");
//$stmt = $con -> prepare("SELECT email FROM users where email='basema@gmail.com'");
$stmt ->execute();
// $users=$stmt ->fetch(PDO::FETCH_ASSOC);
$COUNT =$stmt->rowCount();
// if($COUNT==1){print_r(json_encode($users));}
// else{echo "<h1>There is no users<h1/>";}
if($COUNT >0)
{echo "<h1>sucsess</h1>";}

else{echo "<h1>faild<h1/>";}