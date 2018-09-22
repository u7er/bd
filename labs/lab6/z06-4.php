<?php
	$days = array('Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье');
	$colors = array('black', 'gray', 'pink', 'blue', 'yellow', 'orange', 'red');
	$size = range(7, 1);

	function week_days($days, $colors) {
		global $size;
		
		for ($i = 0; $i < 7; $i++)
	    	echo "<font color='$colors[$i]' size='$size[$i]'>$days[$i]<br/>";
	}

	week_days($days, $colors);
?>
