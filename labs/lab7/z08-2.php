<!DOCTYPE HTML>
<html>
	<head>
		<title> Формирование таблицы </title> 
	</head>
<body>
	<table border = "1" align="center">
		<tr>
			<?php
				if (empty ($_POST['align']) || empty($_POST['valign']))
					echo '<td width = "100" height = "100" align = "left" valign = "top">Текст</td>';
				else
					echo '<td width = "100" height = "100" align = "' . $_POST['align'] . '" valign = "' . $_POST['valign'] . '">Текст</td>';
				
			?>
		</tr>
	</table>
	<form action = "z08-2.php" method = "POST" style="width: 300px; margin: 0 auto;">
		<b>Выберите горизонтальное расположение:</b>
		<p>
			<input type="radio" name="align" value="left" checked>слева<br>
			<input type="radio" name="align" value="center">по центру<br>
			<input type="radio" name="align" value="right">справа<br>
			
		</p>
		<b>Выберите горизонтальное расположение:</b>
		<p>
			<input type="checkbox" name="valign" value="top" checked>сверху<br>
			<input type="checkbox" name="valign" value="middle">посередине<br>
			<input type="checkbox" name="valign" value="bottom">внизу<br>			
		</p>
		<b><input type="submit" value="Выполнить"></b>
</p>
</form>
</body> </html>