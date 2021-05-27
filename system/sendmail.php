<?php
require __DIR__.'/plugin/mail/src/PHPMailer.php';
require __DIR__.'/plugin/mail/src/SMTP.php';
require __DIR__.'/plugin/mail/src/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

function sendMail($from, $to, $subject, $body) {
    $mail = new PHPMailer();
    $mail->CharSet = "UTF-8";
    try {
        //Server settings
        $mail->SMTPDebug = 0;                               // Enable verbose debug output
        $mail->isSMTP();                                    // Send using SMTP
        $mail->Host       = 'smtp.gmail.com';               // Set the SMTP server to send through
        $mail->SMTPAuth   = true;                           // Enable SMTP authentication
        $mail->SMTPSecure = 'tls';                          // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
        $mail->Port       = 587;                            // TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above
        $mail->Username   = $from['username'];      // SMTP username
        $mail->Password   = $from['password'];      // SMTP password

        //Recipients
        $mail->setFrom($from['username']);
        $mail->addAddress($to);                          // Add a recipient
        $mail->isHTML(true);                                // Set email format to HTML

        $mail->Subject = $subject;
        $mail->Body = $body;

        $mail->send();
        $mail->smtpClose();

        $res_status = "done";
        $res_error = "";
    } catch (Exception $e) {
        $res_error = "$mail->ErrorInfo";
        $res_status = "failed";
    }
}

function getbodyEmail($data, $template) {
    extract($data);
    ob_start();
    require('module/mail/template/' . $template . '.tpl');
    $output = ob_get_contents();
    ob_end_clean();
    return $output;
};