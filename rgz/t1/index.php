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
		<title>Таблица <?php echo '"p5212"'; ?></title>
	</head>
	<body>
		<form action = "index.php" method = "POST">
			<?php
				if(empty($_POST['idreq'])) {
					echo '<table cellpadding="5" border = "1" align="center"><caption>Выберите опцию для вывода</caption>';
					echo '<tr align="center"><td>Вывести список регионов, начинающихся с букв,не попадающих в диапазон, задаваемый с помощью параметров.</td>';
					echo '<td><input name="idreq" type="radio" value="task1req"></td></tr>';
					echo '<tr align="center"><td>Вывести первую по алфавиту столицу для каждого округа кроме округа, задаваемого с помощью параметра.</td>'; 					
					echo '<td><input name="idreq" type="radio" value="task2req"></td></tr>';
					echo '<tr align="center"><td>Вывести столицы регионов, округа которых отличны от округа того региона, который указан в параметре.</td>'; 				
					echo '<td><input name="idreq" type="radio" value="task3req"></td></tr>';
					echo '</table>';
					echo '<p align="center"><input type = "submit" name = "doaction" value = "Выбрать"><br></p>';
				}
				elseif (!empty($_POST['idreq']) && empty($_POST['request_value'])) {
					$input_id = mysql_real_escape_string($_POST['idreq']);
					if ($input_id != "task3req") {
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
						case "task1req":
							$val1 = substr($mysql_value, 0, 2);
							$val2 = substr($mysql_value, 3, 4);
							$sql_query = "SELECT `Регион` FROM `p5212` WHERE `Регион` NOT between '$val1%' AND '$val2%'";
							break;
						case "task2req":
							$sql_query = "SELECT MIN(`Столица`) FROM `p5212` WHERE `Округ` <> '$val1' GROUP BY `Округ`";
								//$sql_query = "SELECT `Фирма` FROM `p5212` ORDER BY `Назв.` " . $mysql_value ." LIMIT 1";
							break;
						case "task3req":
							$sql_query = "
								SELECT `Столица` FROM `p5212` WHERE `Округ` <> (SELECT `Округ` FROM `p5212` WHERE `Регион` = '$val1')
							";
						
							//$sql_query = "SELECT DISTINCT first.`Тип` FROM `p5212` first, `p5212` second 
							//WHERE first.`Фирма` = second.`Фирма` AND first.`Назв.` NOT LIKE '%$mysql_value	%' ";
							break;
					}
					$result = mysql_query($sql_query, $db_handle);
					if(!$result)
						   die('Could not show records from table `p5212`: ' . mysql_error());
						   
					
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