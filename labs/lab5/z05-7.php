<?php
	if (empty($_GET['lang']))
    	exit('Language: not defined ($_GET is empty)');
    	
	$lang = $_GET['lang'];
	print $lang == 'ru' ? 'Привет':'Hello';
?>