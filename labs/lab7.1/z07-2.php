<?php
	$treug = array();
	$kvd = array();

	for($i = 0; $i < 30; $i++) {
		$treug[] = ($i + 1) * ($i + 2) / 2;
		$kvd[] = pow($i + 1, 2);
	}

	echo '<table border = "1" align="center"><caption>Таблица Пифагора (30x30)</caption>';
	for($i = 0; $i < 30; $i++)	 {
		echo '<tr>';
		for($j = 0; $j < 30; $j++)	
			if(in_array(($j + 1) * ($i + 1), $treug) && in_array(($j + 1) * ($i + 1), $kvd))
				echo '<td align="center" bgcolor = "red">' . ($j + 1) * ($i + 1) . '</td>';

			elseif(in_array(($j + 1) * ($i + 1), $treug))
				echo '<td align="center" bgcolor = "green">' . ($j + 1) * ($i + 1);

			elseif(in_array(($j + 1) * ($i + 1), $kvd))
				echo '<td align="center" bgcolor = "blue">' . ($j + 1) * ($i + 1) . '</td>';

			else
				echo '<td align="center">' . ($j + 1) * ($i + 1) . '</td>';

		echo '</tr>';
	}
	echo '</table><br>';

	echo 'Array of triangular numbers ($treug[]): ';
	foreach ($treug as $t)
    	echo $t . '  ';

	echo '<br>Array of squares numbers ($kvd[]): ';
	foreach ($kvd as $k)
    	echo $k . '  ';
?>