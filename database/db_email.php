<?php
		
		$headers = "MIME-Version: 1.0" . "\r\n";
		$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

		$to = "tayabraza@gmail.com";
		$subject = "A member has been $type in Team $team_id - Total members are $total";
		$message = "Dear Admin,". "<br><br>" . "The details of the $type member from Team $team_id on the Teams dashboard are as follows:" . "<br><br><br>";
		$headers .= "From: info@tayabraza.com" . "\r\n";

		foreach ($form_data as $key => $value) {

			$message .= "$key: $value<br><br>";

		}

		$message .= "<br>Regards,<br><br>Teams";

		mail( $to, $subject, $message, $headers, "-finfo@tayabraza.com" );   
		

?>