<?php
	require('config.php');

	$db_handle = mysql_connect(DB_HOST, DB_USER, DB_PASS);
	if (!$db_handle)
	    die('Unable to connect to MySQL: ' . mysql_error());
	
	echo 'Connected to MySQL successfully<br>';

	$db_selected = mysql_select_db(DB_NAME, $db_handle);
	if (!$db_selected)
	    die ('Could not select DB: "' . DB_NAME . '": ' . mysql_error());
?>

<!DOCTYPE HTML>
<html lang="ru">
	<head>
		<meta charset="utf-8">
		<title>Таблица <?php echo '"notebook_br' . BR_NUM . '"'; ?></title>
	</head>
	<body>
		<form action = "z09-3.php" method = "POST">
			<?php
				if(empty($_POST['id'])) {
					echo '<table cellpadding="5" border = "1" align="center"><caption>Таблица "notebook_br' . BR_NUM . '"</caption>';
					
					$sql_query = 'SHOW COLUMNS FROM `notebook_br' . BR_NUM . '`';
					$result = mysql_query($sql_query, $db_handle);
					if(!$result)
       					die('Could not show columns from table `notebook_br' . BR_NUM . '`: ' . mysql_error());

					echo '<tr>';
					if (mysql_num_rows($result) > 0)
				    	while ($row = mysql_fetch_assoc($result))
				        	echo '<td align="center"><b>' . $row['Field'] . '</b></td>';
				    echo '<td align="center"><b>Изменить</b></td>';
					echo '</tr>';

					$sql_query = 'SELECT * FROM `notebook_br' . BR_NUM . '`';
					$result = mysql_query($sql_query, $db_handle);
					if(!$result)
       					die('Could not show records from table `notebook_br' . BR_NUM . '`: ' . mysql_error());

					if (mysql_num_rows($result) > 0)
				    	while ($row = mysql_fetch_assoc($result)) {
							echo '<tr>';
				        	foreach($row as $value)
								echo '<td align="center">' . $value . '</td>';
				        	echo '<td align="center"><input name="id" type="radio" value="' . $row['id'] . '"></td></tr>';
				    	}

					echo '</table>';
				}
				elseif (!empty($_POST['id']) && empty($_POST['field_name']) && empty($_POST['field_value'])) {
					$user_id = mysql_real_escape_string($_POST['id']);

					$sql_query = 'SELECT * FROM `notebook_br' . BR_NUM . '` WHERE `id` = ' . $user_id . ';';
					$result = mysql_query($sql_query, $db_handle);
					if(!$result)
       					die('Could not show record (id:' . $user_id . ') from table `notebook_br' . BR_NUM . '`: ' . mysql_error());

					if (mysql_num_rows($result) > 0) {
				    	$row = mysql_fetch_assoc($result);

				    	echo <<< HTML
						<p align="center">
							<label>Поле: </label>
							<select name = "field_name">
HTML;

				    	array_shift($row);
				    	foreach($row as $key => $value)
				        	echo '<option value = "' . $key . '" > ' . $value . '</option>';

				        echo <<< HTML
				        	</select>
						</p>
						<p align="center">
							<label>Значение: </label>
							<input type = "text" name = "field_value">
							<input type = "hidden" name = "id" value = "$user_id">
						</p>
HTML;

					}
				}
				elseif (!empty($_POST['id']) && !empty($_POST['field_name']) && !empty($_POST['field_value'])) {
					$user_id = mysql_real_escape_string($_POST['id']);
					$field_name = mysql_real_escape_string($_POST['field_name']);
					$field_value = mysql_real_escape_string($_POST['field_value']);

					if ($field_name == 'birthday')
						$field_value = date('Y-m-d', strtotime(str_replace('-', '/', $_POST['date'])));

					$sql_query = "UPDATE `notebook_br" . BR_NUM . "` SET `$field_name` = '$field_value' WHERE `id` = '$user_id';";
					$result = mysql_query($sql_query, $db_handle);
		    		if(!$result)
		       			die('Could not update record: ' . mysql_error());

		       		echo <<< HTML
		       		<p>Record (id: $user_id) updated successfully</p>
					<p align="center"><a href = "z09-3.php">Назад</a></p>
HTML;
				}

				mysql_close($db_handle);
			?>
			<p align="center"><input type = "submit" name = "doaction" value = "Изменить"><br></p>
		</form>
	</body>
</html>