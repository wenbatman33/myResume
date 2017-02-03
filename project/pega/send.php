<?PHP

$theSubject	= $_REQUEST['theSubject'];
$theName 	= $_REQUEST['theName'];
$theEmail 	= $_REQUEST['theEmail'];
$theMessage 	= $_REQUEST['theMessage'];

$to = "info@pegadesign.com";

$message = "Name: " . $theName;
$message .= "\nEmail: " . $theEmail;
$message .= "\n\nMessage: " . $theMessage;
$headers = "From: $theEmail";
$headers .= "\nReply-To: $theEmail";

$sentOk = mail($to, $theSubject, $message, $headers);

echo "sentOk=".$sentOk;

?>
