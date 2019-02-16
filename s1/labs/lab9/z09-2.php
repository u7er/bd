<?php
	if (isset($_POST['dosubmit'])) {
		if (!empty($_POST['name']) && !empty($_POST['email'])) {
			require('config.php');

			$db_handle = mysql_connect(DB_HOST, DB_USER, DB_PASS);
			if (!$db_handle)
			    die('Unable to connect to MySQL: ' . mysql_error());
			
			echo 'Connected to MySQL successfully<br>';

			$db_selected = mysql_select_db(DB_NAME, $db_handle);
			if (!$db_selected)
			    die ('Could not select DB "' . DB_NAME . '": ' . mysql_error());

			/* TODO: подготавливаемые запросы */
			$name = mysql_real_escape_string($_POST['name']);
			$city = mysql_real_escape_string($_POST['city']);
			$address = mysql_real_escape_string($_POST['address']);
			$dob = mysql_real_escape_string($_POST['dob']);
			$email = mysql_real_escape_string($_POST['email']);

			$sql_query = 
				"INSERT INTO `notebook_br" . BR_NUM . "` (`name`, `city`, `address`, `birthday`, `mail`)
				VALUES('$name', '$city', '$address', '$dob', '$email');";

		    $ret_val = mysql_query($sql_query, $db_handle);
		    if(!$ret_val)
		       die('Could not create record: ' . mysql_error());

		    echo 'New record (id: ' . mysql_insert_id() . ') created successfully';

			mysql_close($db_handle);
		}
		else
			echo 'Fields name and e-mail are required<br>';
	}
?>

<!DOCTYPE HTML>
<html lang="ru">
	<head>
		<meta charset="utf-8">
		<title>Записная книжка</title>
	</head>
	<body>
		<form action = "z09-2.php" method = "POST" style="width: 500px; margin: 0 auto;">
			<fieldset>
				<legend>&nbsp;Записная книжка:&nbsp;</legend>
				<p>
					<label>Введите ваше фамилию и имя [*]:</label>
					<input type = "text" name = "name">
				</p>
				<p>
					<label>Введите город:</label>
					<input type = "text" name = "city">
				</p>
				<p>
					<label>Введите адрес:</label>
					<input type = "text" name = "address">
				</p>
				<p>
					<label>Введите дату рождения:</label>
					<input type = "date" name = "dob">
				</p>
				<p>
					<label>Введите e-mail [*]:</label>
					<input type = "text" name = "email">
				</p>
				<p>
					<input type = "submit" name="dosubmit" value = "Отправить" style="width:230px; height:25px;">
					<input type = "reset" value = "Очистить" style="width:230px; height:25px;">
				</p>
			</fieldset>
		</form>
	</body>
</html>