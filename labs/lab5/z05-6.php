<?php
	if (empty($_GET['lang']))
    	exit('Language: not defined ($_GET is empty)');
    
    $lang = $_GET['lang'];

    echo 'Language: ';
	switch($lang) {
		case 'ru':
			echo 'Russian';
			break;
		case 'en':
			echo 'English';
			break;
		case 'fr':
			echo 'France';
			break;
		case 'de':
			echo 'Deutsch';
			break;
		default:
			echo 'Incorrect value';
			break;
	}
?>