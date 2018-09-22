<?php
	require('config.php');

	$db_handle = mysql_connect(DB_HOST, DB_USER, DB_PASS);
	if (!$db_handle)
	    die('Unable to connect to MySQL: ' . mysql_error());
	
	echo 'Connected to MySQL successfully<br>';

	$sql_query = 'CREATE DATABASE IF NOT EXISTS `' . DB_NAME . '` CHARACTER SET utf8 COLLATE utf8_general_ci;';

    $ret_val = mysql_query($sql_query, $db_handle);
    if(!$ret_val)
       die('Could not create database `' . DB_NAME . '`: ' . mysql_error());

    echo 'Database `' . DB_NAME . '` created successfully<br>';

	$db_selected = mysql_select_db(DB_NAME, $db_handle);
	if (!$db_selected)
	    die ('Could not select DB `' . DB_NAME . '`: ' . mysql_error());

	$sql_query = 
		'CREATE TABLE IF NOT EXISTS
			`cust`(
				`cnum` INT(4) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
				`cname` VARCHAR(10) NOT NULL,
				`city` VARCHAR(10) NOT NULL,
				`rating` INT(6) NOT NULL,
				`snum` INT(5)
			);';

    $ret_val = mysql_query($sql_query, $db_handle);
    if(!$ret_val)
       die('Could not create table `cust`: ' . mysql_error());

    echo 'Table `cust` created successfully<br>';

    $sql_query = 
    	"REPLACE INTO `cust` (`cnum`, `cname`, `city`, `rating`, `snum`) VALUES 
    		('2001', 'Hoffman', 'London', '100', '1001'),
    		('2002', 'Giovanni', 'Rome', '200', '1002'),
    		('2003', 'Liu', 'San Jose', '200', '1003'),
    		('2004', 'Grass', 'Berlin', '300', '1004'),
    		('2005', 'Clemens', 'London', '100', '1005'),
    		('2006', 'Cisneros', 'San Jose', '300', '1006'),
    		('2007', 'Pereira', 'Rome', '100', '1007');";

    $ret_val = mysql_query($sql_query, $db_handle);
    if(!$ret_val)
       die('Could not create records in table `cust`: ' . mysql_error());

    echo 'New records table `cust` created successfully<br>';

    $sql_query = 
		'CREATE TABLE IF NOT EXISTS
			`sal`(
				`snum` INT(4) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
				`sname` VARCHAR(10) NOT NULL,
				`city` VARCHAR(10) NOT NULL,
				`rating` INT(6) NOT NULL,
				`comm` INT(6) NOT NULL
			);';

    $ret_val = mysql_query($sql_query, $db_handle);
    if(!$ret_val)
       die('Could not create table `sal`: ' . mysql_error());

    echo 'Table `sal` created successfully<br>';

    $sql_query = 
		'CREATE TABLE IF NOT EXISTS
			`ord`(
				`onum` INT(4) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
				`odate` DATE NOT NULL,
				`cnum` INT(4) UNSIGNED NOT NULL,
				`snum` INT(4) UNSIGNED NOT NULL,
				`amt` INT(6) UNSIGNED NOT NULL
			);';

    $ret_val = mysql_query($sql_query, $db_handle);
    if(!$ret_val)
       die('Could not create table `ord`: ' . mysql_error());

    echo 'Table `ord` created successfully<br><br>';

	mysql_close($db_handle);
?>

<!DOCTYPE HTML>
<html lang="ru">
	<head>
		<meta charset="utf-8">
		<title><?php echo 'HTML-форма: БД "' . DB_NAME . '"'; ?></title>
	</head>
	<body>
		<form action = "z10-2.php" method = "GET" style="width: 700px; margin: 0 auto;">
			<fieldset>
				<legend>&nbsp;Вывод данных&nbsp;</legend>
				<table border="1" align="center">
					<caption>Отобразить данные</caption>
					<tr>
						<th rowspan="2" align="center">Таблицы</th>
						<th colspan="2" align="center">Отобразить</th>
					</tr>
					<tr>
						<td align="center">структуру</td>
						<td align="center">содержимое</td>
					</tr>
					<tr>
						<td align="center">Продавцы (sal)</td>
						<td align="center"><input type = "checkbox" name = "structure[]" value = "sal"></td>
						<td align="center"><input type = "checkbox" name = "content[]" value = "sal"></td>
					</tr>
					<tr>
						<td align="center">Покупатели (cust)</td>
						<td align="center"><input type = "checkbox" name = "structure[]" value = "cust"></td>
						<td align="center"><input type = "checkbox" name = "content[]" value = "cust"></td>
					</tr>
					<tr>
						<td align="center">Заказы (ord)</td>
						<td align="center"><input type = "checkbox" name = "structure[]" value = "ord"></td>
						<td align="center"><input type = "checkbox" name = "content[]" value = "ord"></td>
					</tr>
				</table>
				<p align="center"><input type = "submit" name = "doaction" value = "Вывести" style="width:300px; height:25px;"><br></p>
			</fieldset>
		</form>
	</body>
</html>