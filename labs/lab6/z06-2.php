<?php
	$color = 'blue';

	echo '<table cellpadding="5" border = "1" align="center"><caption>Таблица сложения</caption>';
	for($i = 0; $i < 10; $i++) {	
		echo '<td align="center">';
		if($i == 0)
			echo '<font color = "red"> + ';
		else
			echo '<font color = "' . $color . '">' . ($i+1);
		echo '</td>';
	}

	for($i = 1; $i < 10; $i++){
		echo '<tr>';
		for($j = 0; $j < 10; $j++) {
			echo '<td align="center">';
			if($j == 0)
				echo '<font color = "' . $color . '">' . ($i + ($j+1)) . '</font>';
			else
				echo (($i+1) + ($j+1));
			echo '</td>';
		}

		echo '</tr>';
	}
	echo '</table>';

?>
