<?PHP
$to = "profita_01@profita.asia";



$subject = "HELLO!!!";

$message = "Name: " . $_GET["theName"];
$message .= "\nEmail: " . $_GET["theEmail"];
$message .= "\n\nMessage: " . $_GET["theMessage"];
$headers = "From: $theEmail";
$headers .= "\nReply-To: $theEmail";

$sentOk = mail($to,$subject,$message,$headers);

echo "sentOk=" . $sentOk;
?>
