<?php
	require('config.php');

	$db_handle = mysql_connect(DB_HOST, DB_USER, DB_PASS);
	if (!$db_handle)
	    die('Unable to connect to MySQL: ' . mysql_error());
	
	//echo 'Connected to MySQL successfully<br>';

	$db_selected = mysql_select_db(DB_NAME, $db_handle);
	if (!$db_selected)
		die ('Could not select DB: "' . DB_NAME . '": ' . mysql_error());
	mysql_set_charset('utf8');
?>

<!DOCTYPE HTML>
<html lang="ru">
	<head>
		<meta charset="utf-8">
		<title>Таблица <?php echo '"p5214"'; ?></title>
	</head>
	<body>
		<form action = "index.php" method = "POST">
			<?php
				if(empty($_POST['idreq'])) {
					echo '<table cellpadding="5" border = "1" align="center"><caption>Выберите опцию для вывода</caption>';
					echo '<tr align="center"><td>Список ОС, начинающихся с введенной буквы</td>';
					echo '<td><input name="idreq" type="radio" value="oschar"></td></tr>';
					echo '<tr align="center"><td>Список фирм, которые разрабатывают ОС первого или последнего по алфавиту типа</td>';
					echo '<td><input name="idreq" type="radio" value="firmfirstlast"></td></tr>';
					echo '<tr align="center"><td>Типы ОС, разрабатываемые теми же фирмами, которые разрабатывают ОС, не содержащие указанную букву</td>';
					echo '<td><input name="idreq" type="radio" value="osnothavingchar"></td></tr>';
					echo '</table>';
					echo '<p align="center"><input type = "submit" name = "doaction" value = "Выбрать"><br></p>';
				}
				elseif (!empty($_POST['idreq']) && empty($_POST['request_value'])) {
					$input_id = mysql_real_escape_string($_POST['idreq']);
					if ($input_id != "firmfirstlast") {
					echo <<< HTML
						<p align="center">
							<label>Значение: </label>
							<input type = "text" name = "request_value">
							<input type = "hidden" name = "idreq" value = "$input_id">
						</p>
						<p align="center"><input type = "submit" name = "doaction" value = "Выбрать"><br></p>
HTML;
					}
					else {
						echo <<< HTML
						<p align="center">
							<table cellpadding="5" border = "1" align="center"><caption>Выберите опцию вывода: </caption>;
							<tr align="center"><td>Первую по алфавиту</td>;
							<td><input name="request_value" type="radio" value="ASC"></td></tr>;
							<tr align="center"><td>Последнюю по алфавиту</td>;
							<td><input name="request_value" type="radio" value="DESC"></td></tr>;
							</table>;
							<input type = "hidden" name = "idreq" value = "$input_id">
						</p>
						<p align="center"><input type = "submit" name = "doaction" value = "Выбрать"><br></p>
HTML;
					}
				}
				elseif (!empty($_POST['idreq']) && !empty($_POST['request_value'])) {
					$mysql_value = mysql_real_escape_string($_POST['request_value']);
					switch ($_POST['idreq']) {
						case "oschar":
							$sql_query = "SELECT `Назв.` FROM `p5214` WHERE `Назв.` LIKE '$mysql_value%'";
							break;
						case "firmfirstlast";
							$sql_query = "SELECT `Фирма` FROM `p5214` ORDER BY `Назв.` " . $mysql_value ." LIMIT 1";
							break;
						case "osnothavingchar";
							$sql_query = "SELECT DISTINCT first.`Тип` FROM `p5214` first, `p5214` second 
							WHERE first.`Фирма` = second.`Фирма` AND first.`Назв.` NOT LIKE '%$mysql_value	%' ";
							break;
					}
					$result = mysql_query($sql_query, $db_handle);
					if(!$result)
						   die('Could not show records from table `p5214`: ' . mysql_error());
						   
					
					if (mysql_num_rows($result) > 0) {
						echo '<table cellpadding="5" border = "2" align="center"><caption>Результат работы:</caption>';
				    	while ($row = mysql_fetch_assoc($result)) {
							echo '<tr>';
				        	foreach($row as $value) 
								echo '<td align="center">' . $value . '</td>';
							echo '</tr>';
						}
						echo '</table>';
					}
					else
						echo '<p align="center">База данных вернула пустой запрос</p>';
					echo '<p align="center"><a href = "index.php">Назад</a></p>';
					mysql_close($db_handle);
				}
			?>
		</form>
	</body>
</html>