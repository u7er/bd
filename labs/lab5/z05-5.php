<?php
	if (empty($_GET['lang']))
    	exit('Language: not defined ($_GET is empty)');

	$lang = $_GET['lang'];

	echo 'Language: ';
	if ($lang == "ru")
		echo 'Russian';
	elseif ($lang == "en")
		echo 'English';
	elseif ($lang == "fr")
		echo 'France';
	elseif ($lang == "de")
		echo 'Deutsch';
	else
		echo 'Incorrect value';
?>