<?php
	// create table
	require('config.php');
	
	$db_handle = mysql_connect(DB_HOST, DB_USER, DB_PASS);
	if (!$db_handle)
	    die('Unable to connect to MySQL: ' . mysql_error());
	echo 'Connected to MySQL successfully<br>';
	
	mysql_set_charset('utf8');
	$sql_query = 'CREATE DATABASE IF NOT EXISTS `' 
		. DB_NAME . '` CHARACTER SET utf8 COLLATE utf8_general_ci;';
    $ret_val = mysql_query($sql_query, $db_handle);
    if(!$ret_val)
       die('Could not create database `' . DB_NAME . '`: ' . mysql_error());
	echo 'Database `' . DB_NAME . '` created successfully<br>';
	
	$db_selected = mysql_select_db(DB_NAME, $db_handle);
	if (!$db_selected)
	    die ('Could not select DB "' . DB_NAME . '": ' . mysql_error());
	$sql_query = 
		'CREATE TABLE IF NOT EXISTS
			`p5212`(
				`N` INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
				`Округ` VARCHAR(50),
				`Регион` VARCHAR(50),
				`Столица` VARCHAR(50)
			);';

    $ret_val = mysql_query($sql_query, $db_handle);
    if(!$ret_val)
       die('Could not create table p5214: ' . mysql_error());

    echo 'Table p5212 created successfully<br>';
	
	// fill with data from base.txt
	$nb_fn = 'base.txt';
	if (!file_exists($nb_fn))
	    die('File "' . $nb_fn . '" is not exists<br>');
	echo 'File "' . $nb_fn . '" is exists<br><br>';
	$file_array = file($nb_fn);
	if (!$file_array)
		die('Could not read from file "' . $nb_fn);
	
	$table_args = array_shift($file_array);
	$table_args = preg_split('/ +/', $table_args);
	$table_args = array_map('rtrim', $table_args);
	$sql_query = "REPLACE INTO `p5212` (`$table_args[0]`, `$table_args[1]`, 
		`$table_args[2]`, `$table_args[3]`) VALUES" . "\r\n";
	
	foreach ($file_array as $line) {
		$list_input = preg_split('/ +/', $line);
		$list_input = array_map('trim', $list_input);
		$sql_query .= "('$list_input[0]', '$list_input[1]', '$list_input[2]', 
			'$list_input[3]'), ";
	}
	$sql_query = substr($sql_query, 0, -3);
	$sql_query .= ");";
	
	$ret_val = mysql_query($sql_query, $db_handle);
    if(!$ret_val)
       die('Could not create records in table `p5212`: ' . mysql_error());
    
	mysql_close($db_handle);
	
	
	/* dump bd to file
	$nb_fn = 'notebook_br.txt';
	if (file_exists($nb_fn))
	    echo 'File "' . $nb_fn . '" is exists<br>';

	$file_handle = fopen($nb_fn, "w");
	if (!$file_handle)
		die('Could not create file "' . $nb_fn . '": ' . mysql_error());

	echo 'File "' . $nb_fn . '" was opened successfully<br>';

	$sql_query = 'SHOW COLUMNS FROM p5214';
	$result = mysql_query($sql_query, $db_handle);
	if(!$result)
		die('Could not show columns from table p5214: ' . mysql_error());

	if (mysql_num_rows($result) > 0)
		while ($row = mysql_fetch_assoc($result))
	    	fwrite($file_handle, $row['Field'] . " ");
	fwrite($file_handle, "\r\n");

	$sql_query = 'SELECT * FROM p5214';
	$result = mysql_query($sql_query, $db_handle);
	if(!$result)
		die('Could not show records from table p5214: ' . mysql_error());

	if (mysql_num_rows($result) > 0)
		while ($row = mysql_fetch_assoc($result)) {
	    	foreach($row as $key => $value) {
				fwrite($file_handle, $value . " ");
	    	}
			fwrite($file_handle, "\r\n");
		}
    
	fclose($file_handle);
	*/
?>