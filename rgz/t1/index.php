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
		<style>
			.simple-little-table {
			font-family:Arial, Helvetica, sans-serif;
			color:#666;
			font-size:12px;
			text-shadow: 1px 1px 0px #fff;
			background:#eaebec;
			margin:20px auto 0;
			border:#ccc 1px solid;
			border-collapse:separate;

			-moz-border-radius:3px;
			-webkit-border-radius:3px;
			border-radius:3px;

			-moz-box-shadow: 0 1px 2px #d1d1d1;
			-webkit-box-shadow: 0 1px 2px #d1d1d1;
			box-shadow: 0 1px 2px #d1d1d1;
		}

		.simple-little-table th {
			font-weight:bold;
			padding:21px 25px 22px 25px;
			border-top:1px solid #fafafa;
			border-bottom:1px solid #e0e0e0;

			background: #ededed;
			background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
			background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
		}
		.simple-little-table th:first-child{
			text-align: left;
			padding-left:20px;
		}
		.simple-little-table tr:first-child th:first-child{
			-moz-border-radius-topleft:3px;
			-webkit-border-top-left-radius:3px;
			border-top-left-radius:3px;
		}
		.simple-little-table tr:first-child th:last-child{
			-moz-border-radius-topright:3px;
			-webkit-border-top-right-radius:3px;
			border-top-right-radius:3px;
		}
		.simple-little-table tr{
			text-align: center;
			padding-left:20px;
		}
		.simple-little-table tr td:first-child{
			text-align: left;
			padding-left:20px;
			border-left: 0;
		}
		.simple-little-table tr td {
			padding:18px;
			border-top: 1px solid #ffffff;
			border-bottom:1px solid #e0e0e0;
			border-left: 1px solid #e0e0e0;

			background: #fafafa;
			background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
			background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
		}
		.simple-little-table tr:nth-child(even) td{
			background: #f6f6f6;
			background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
			background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
		}
		.simple-little-table tr:last-child td{
			border-bottom:0;
		}
		.simple-little-table tr:last-child td:first-child{
			-moz-border-radius-bottomleft:3px;
			-webkit-border-bottom-left-radius:3px;
			border-bottom-left-radius:3px;
		}
		.simple-little-table tr:last-child td:last-child{
			-moz-border-radius-bottomright:3px;
			-webkit-border-bottom-right-radius:3px;
			border-bottom-right-radius:3px;
		}
		.simple-little-table tr:hover td{
			background: #f2f2f2;
			background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
			background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);
		}

		.simple-little-table a:link {
			color: #666;
			font-weight: bold;
			text-decoration:none;
		}
		.simple-little-table a:visited {
			color: #999999;
			font-weight:bold;
			text-decoration:none;
		}
		.simple-little-table a:active,
		.simple-little-table a:hover {
			color: #bd5a35;
			text-decoration:underline;
		}
				
		.radio {
			display: none;
		}
		.radio-custom {
			width: 20px;
			height: 20px;
			border: 2px solid #ccc;
			border-radius: 3px;
			position: relative;
		}
		.radio-custom,
		.label {
			display: inline-block;
			vertical-align: middle;
		}
		.radio:checked + .radio-custom::before {
			content: "";
			display: block;
			position: absolute;
			top: 2px;
			right: 2px;
			bottom: 2px;
			left: 2px;
			background: #413548;
			border-radius: 2px;
		}
		.radio-custom,
		.radio:checked + .radio-custom::before {
			border-radius: 50%;
		}
		input {
	
	font-size: 13px;
	padding: 6px 0 4px 10px;
	border: 1px solid #cecece;
	background: #F6F6f6;
	border-radius: 8px;
}
		</style>
	</head>
	<body>
		<form action = "index.php" method = "POST">
			<?php
				if(empty($_POST['idreq'])) {
					echo '<h2 align="center">Выберите опцию для вывода</h2>';
					echo '<table class="simple-little-table" cellspacing="0" cellpadding="5" border = "0" align="center">';
					echo '<tr align="center"><td>Вывести список регионов, начинающихся с букв,не попадающих в диапазон, задаваемый с помощью параметров.</td>';
					echo '<td><input name="idreq" type="radio" value="task1req"></td></tr>';
					echo '<tr align="center"><td>Вывести первую по алфавиту столицу для каждого округа кроме округа, задаваемого с помощью параметра.</td>'; 					
					echo '<td><input name="idreq" type="radio" value="task2req"></td></tr>';
					echo '<tr align="center"><td>Вывести столицы регионов, округа которых отличны от округа того региона, который указан в параметре.</td>'; 				
					echo '<td><input name="idreq" type="radio" value="task3req"></td></tr>';
					echo '</table>';
					echo '<p align="center"><input type = "submit" style="cursor: pointer; font-size:12px;  text-decoration: none; padding:4px 18px; color:#ffffff; background-color:#575757; border-radius:8px; border: 2px solid #4a4a4a;" name = "doaction" value = "Выбрать"><br></p>';
				}
				elseif (!empty($_POST['idreq']) && empty($_POST['request_value'])) {
					$input_id = mysql_real_escape_string($_POST['idreq']);
					//if ($input_id != "task3req") {
					echo <<< HTML
						<p align="center">
							
							<input  placeholder="Значение" type = "text" name = "request_value" autofocus>
							<input type = "hidden" name = "idreq" value = "$input_id">
						</p>
						<p align="center"><input type = "submit" style="cursor: pointer; font-size:12px;  text-decoration: none; padding:4px 18px; color:#ffffff; background-color:#575757; border-radius:8px; border: 2px solid #4a4a4a;" name = "doaction" value = "Выбрать"><br></p>
HTML;
					//}
				}
				elseif (!empty($_POST['idreq']) && !empty($_POST['request_value'])) {
					$mysql_value = mysql_real_escape_string($_POST['request_value']);
					switch ($_POST['idreq']) {
						case "task1req":
							if(preg_match("/^[А-Я]-[А-Я]/", $mysql_value) == NULL){
								print "Value not valid<br />";
								break;
							}
							$val1 = substr($mysql_value, 0, 2);
							$val2 = substr($mysql_value, 3, 4);
							$sql_query = "SELECT `Регион` FROM `p5212` WHERE `Регион` NOT between '$val1%' AND '$val2%'";
							break;
						case "task2req":
							$sql_query = "SELECT MIN(`Столица`) FROM `p5212` WHERE `Округ` <> '$mysql_value' GROUP BY `Округ`";
							break;
						case "task3req":
							$sql_query = "
								SELECT `Столица` FROM `p5212` WHERE `Округ` <> (SELECT `Округ` FROM `p5212` WHERE `Регион` = '$mysql_value')
							";
							break;
					}
					$result = mysql_query($sql_query, $db_handle);
					if(!$result){
						die('Could not show records from table `p5212`: ' . mysql_error());
					}
					
					if (mysql_num_rows($result) > 0) {
						echo '<h2 align="center">Результат работы</h2>';
						echo '<table class="simple-little-table" cellspacing="0" cellpadding="5" border = "2" align="center">';
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
