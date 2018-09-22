<!DOCTYPE HTML>
<html lang="ru">
	<head>
		<meta charset="utf-8">
		<title>HTML-форма: сформированная таблица</title>
	</head>
	<body>
		<table border = "1" align="center">
			<tr>
				<?php
					if (empty($_POST['align']) || empty($_POST['valign']))
    					echo '<td width = "100" height = "100" align = "center" valign = "middle">Текст</td>';
    				else
						echo '<td width = "100" height = "100" align = "' . $_POST['align'] . '" valign = "' . $_POST['valign'] . '">Текст</td>';
				?>
			</tr>
		</table>
		<a href = "z08-1a.htm">Назад!</a> 
	</body>
</html>