<!DOCTYPE HTML>
<html lang="ru">
	<head>
		<meta charset="utf-8">
		<title>HTML-форма: формирование таблицы</title>
	</head>
	<body>
		<table border = "1" align="center">
			<tr>
				<?php
					if (empty($_POST['align']) || empty($_POST['valign']))
			    		echo '<td width = "100" height = "100" align = "left" valign = "top">Текст</td>';
			    	else
						echo '<td width = "100" height = "100" align = "' . $_POST['align'] . '" valign = "' . $_POST['valign'] . '">Текст</td>';
				?>
			</tr>
		</table><br>

		<form action = "z08-2.php" method = "POST" style="width: 300px; margin: 0 auto;">
			<fieldset>
				<legend>&nbsp;Формирование тиблицы:&nbsp;</legend>
				<p>Выберите горизонтальное расположение:</p>
				<p>
					<label><input type = "radio" name = "align" value = "left" > Слева<br></label>
					<label><input type = "radio" name = "align" value = "center" checked> По центру<br></label>
					<label><input type = "radio" name = "align" value = "right"> Справа<br></label>
				</p>
				<p>Выберите вертикальное расположение:</p>
				<p>
					<label><input type = "checkbox" name = "valign" value = "top" checked> Сверху <br></label>
					<label><input type = "checkbox" name = "valign" value = "middle"> Посередине <br></label>
					<label><input type = "checkbox" name = "valign" value = "bottom"> Внизу <br></label>
				</p>
				<p><input type = "submit" name = "doaction" value = "Отправить" style="width:290px; height:25px;"><br></p>
			</fieldset>
		</form>
	</body>
</html>