<?php
	$i = 0;
	$color = 'silver';

	echo '<table cellpadding="5" border = "1" align="center"><caption>Таблица Пифагора (10 x 10)</caption>';
	while($i < 10) {
		$j = 0;

		echo '<tr>';
		while($j < 10) {
			if($i == $j)
				echo '<td align="center" bgcolor = "' . $color . '">' . ($i + 1) * ($j + 1) . '</td>';
			else
				echo '<td align="center">' . ($i + 1) * ($j + 1) . '</td>';

			$j++;
		}

		$i++;
		echo '</tr>';
	}
	echo '</table>';
?>