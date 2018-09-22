<?php
	if(!empty($_POST['site']))
		header("Location: $_POST[site]");

	$list_sites = array(
		'Yandex' => 'https://www.yandex.ru', 
		'Google' => 'https://www.google.ru', 
		'Rambler' => 'https://www.rambler.ru',
		'Yahoo' => 'https://www.yahoo.com/'
	);
?>

<!DOCTYPE HTML>
<html lang="ru">
	<head>
		<meta charset="utf-8">
		<title>Переадресация</title>
	</head>
	<body>
		<form action = "z08-5.php" method = "POST" style="width: 280px; margin: 0 auto;">
			<fieldset>
				<legend>&nbsp;Выберите ПС:&nbsp;</legend>

				<label>Поисковые системы:</label>
				<select name="site">
					<?php 
						foreach($list_sites as $name => $site)
							echo '<option value=' . $site . '>' . $name . '</option>';
					?>
				</select>
				<p align="center"><input type = "submit" name = "doaction" value = "Перейти" style="width:100px; height:20px;"></p>
			</fieldset>
		</form>
	</body>
</html>