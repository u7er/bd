<?php
	echo '<table cellpadding = "0" border = "1" align="center"><caption>Таблица Пифагора (30x30)</caption>';
	for($i = 0; $i < 30; $i++)	 {
		echo '<tr>';
		for($j = 0; $j < 30; $j++)	
			switch((($i+1) * ($j+1)) % 7) {
				case 0:
					echo '<td height = "15" width = "14" bgcolor = "white"><font size="1">&nbsp;</font></td>';
					break;
				case 1:
					echo '<td height = "15" width = "14" bgcolor = "aqua"><font size="1">&nbsp;</font></td>';
					break;
				case 2:
					echo '<td height = "15" width = "14" bgcolor = "blue"><font size="1">&nbsp;</font></td>';
					break;
				case 3:
					echo '<td height = "15" width = "14" bgcolor = "yellow"><font size="1">&nbsp;</font></td>';
					break;
				case 4:
					echo '<td height = "15" width = "14" bgcolor = "purple"><font size="1">&nbsp;</font></td>';
					break;
				case 5:
					echo '<td height = "15" width = "14" bgcolor = "red"><font size="1">&nbsp;</font></td>';
					break;
				case 6:
					echo '<td height = "15" width = "14" bgcolor = "lime"><font size="1">&nbsp;</font></td>';
					break;
			}

		echo '</tr>';
	}
	echo '</table>';
?>