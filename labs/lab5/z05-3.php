<?php
	$breakfast = 'gamburger';
	$breakfast2 = &$breakfast;

	echo '[BEFORE]<br>';
	echo 'breakfast = "' . $breakfast . '"<br/>'; 
	echo 'breakfast2 = "' . $breakfast2 .'"<br/>';

	$breakfast = 'tea';
	
	echo "<br/>[AFTER]<br>";
	echo 'breakfast = "' . $breakfast . '"<br/>'; 
	echo 'breakfast2 = "' . $breakfast2 . '"';
?>