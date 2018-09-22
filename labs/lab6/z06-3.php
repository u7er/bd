<?php
	if (empty($_GET['lang']))
    	exit('Language: not defined ($_GET is empty)');

	function ru($color) {
	    echo '<font color="' . $color . '">Здравствуйте!</font>';
	}

	function en($color) {
	    echo '<font color="' . $color . '">Hello!</font>';
	}

	function fr($color) {
	    echo '<font color="' . $color . '">Bonjour!</font>';
	}

	function de($color) {
	    echo '<font color="' . $color . '">Guten Tag!</font>';
	}

    $lang = $_GET['lang'];
    $color = $_GET['color'];

    echo 'Language: ';
	switch($lang){
		case 'ru':
			ru($color);
			break;
		case 'en':
			en($color);
			break;
		case 'fr':
			fr($color);
			break;
		case 'de':
			de($color);
			break;
		default:
			echo 'Incorrect value';
			break;
	}
?>