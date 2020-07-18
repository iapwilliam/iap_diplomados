<?php

class SendMail extends Main
{
	private $email;
	public function __construct() {
		//this needs to be true to accept exceptions
		$this->email = new PHPMailer();

		$this->email->IsSMTP();
		$this->email->SMTPAuth = true;
		$this->email->Host       = EMAIL_HOST;
		$this->email->Username   = EMAIL_USERNAME;
		$this->email->Password   = EMAIL_PASSWORD;
		$this->email->Port       = 465;
		$this->email->SMTPSecure = 'ssl';
		$this->email->SMTPDebug = EMAIL_DEBUG;
		$this->email->CharSet = "UTF-8";
		$this->email->Encoding = 'base64';
	}

	public function enviarCorreo($subject, $body, $details_body, $details_subject, $to, $toName, $attachment = array(), $fileName = array(), $from, $fromName)
	{
			$this->email = new PHPMailer(); // defaults to using php "mail()"

			$body = nl2br($this->Util()->handle_mail_patterns($body,$details_body));
			$subject = $this->Util()->handle_mail_patterns($subject,$details_subject);

			$this->email->AddReplyTo($from, $fromName);
			$this->email->SetFrom($from, $fromName);

			$this->email->AddAddress($to, $toName);
			$this->email->Subject    = $subject;
			$this->email->MsgHTML($body);

			foreach($attachment as $key => $attach)
			{
				$this->email->AddAttachment($attach, $fileName[$key]);
			}
			$this->email->Send();
	}

	public function PrepareAttachment($subject, $body, $details_body, $details_subject, $to, $toName, $attachment = array(), $fileName = array(), $from = "enlinea@iapchiapas.edu.mx", $fromName = "Administrador del Sistema")
	{
			$this->email = new PHPMailer(); // defaults to using php "mail()"

			$body = nl2br($this->Util()->handle_mail_patterns($body,$details_body));
			$subject = $this->Util()->handle_mail_patterns($subject,$details_subject);

			$this->email->AddReplyTo($from, $fromName);
			$this->email->SetFrom($from, $fromName);

			$this->email->AddAddress($to, $toName);
			$this->email->Subject    = $subject;
			$this->email->MsgHTML($body);

			foreach($attachment as $key => $attach)
			{
				$this->email->AddAttachment($attach, $fileName[$key]);
			}
			$this->email->Send();
	}


	public function Prepare($subject, $body, $details_body, $details_subject, $to, $toName, $attachment = "", $fileName = "", $from = "enlinea@iapchiapas.edu.mx", $fromName = "Administrador del Sistema")
	{
			$this->email = new PHPMailer(); // defaults to using php "mail()"

			$body = nl2br($this->Util()->handle_mail_patterns($body,$details_body));
			$subject = $this->Util()->handle_mail_patterns($subject,$details_subject);

			$this->email->AddReplyTo($from, $fromName);
			$this->email->SetFrom($from, $fromName);

			$this->email->AddAddress($to, $toName);
			$this->email->Subject    = $subject;
			$this->email->MsgHTML($body);

			if($attachment != "")
			{
				$this->email->AddAttachment($attachment, $fileName);
			}
			$this->email->Send();
	}

	public function PrepareMulti($subject, $body, $details_body, $details_subject, $to, $toName, $attachment = "", $fileName = "", $from = "enlinea@iapchiapas.edu.mx", $fromName = "Administrador del Sistema")
	{
			$this->email = new PHPMailer(); // defaults to using php "mail()"

			$body = nl2br($this->Util()->handle_mail_patterns($body,$details_body));
			$subject = utf8_decode($this->Util()->handle_mail_patterns($subject,$details_subject));

			$this->email->AddReplyTo($from, $fromName);
			$this->email->SetFrom($from, $fromName);

			$ids = explode(",", $to);
			$student = new User;
			foreach($ids as $id)
			{
				$student->setUserId($id);
				$info = $student->InfoUser();
				$info["names"] = $info["names"];
				$info["lastNamePaterno"] = $info["lastNamePaterno"];
				$info["lastNameMaterno"] = $info["lastNameMaterno"];
				$name = utf8_decode($info["names"]." ".$info["lastNamePaterno"]." ".$info["lastNameMaterno"]);
				//$info["email"] = "dlopez@trazzos.com";
				$this->email->AddAddress($info["email"], $name." (".$info["controlNumber"].")");
			}

			$this->email->Subject    = $subject;
			$this->email->MsgHTML($body);

			if($attachment != "")
			{
				$this->email->AddAttachment($attachment, $fileName);
			}
			$this->email->Send();
	}

}


?>
