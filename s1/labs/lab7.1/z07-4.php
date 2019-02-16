<?php
	$colors = array('white', 'aqua', 'blue', 'yellow', 'purple', 'red', 'lime');

	for ($k = 4; $k <= 7; $k++) {
		echo '<table cellpadding = "0" border = "1" align="center"><caption>Таблица Пифагора (30x30), k = ' . $k . ' </caption>';
		for($i = 0; $i < 30; $i++)	 {
			echo '<tr>';
			for($j = 0; $j < 30; $j++)	
				echo '<td height = "15" width = "14" bgcolor = "' . $colors[(($j + 1) * ($i + 1)) % $k] . '"><font size="1">&nbsp;</font></td>';

			echo '</tr>';
		}
		echo '</table><br>';
	}
?>