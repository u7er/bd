<?php
	if(!empty($_GET['structure'])) {
		foreach($_GET['structure'] as $table_name) {
			vid_structure($table_name);
		}
	}

	if(!empty($_GET['content'])) {
		foreach($_GET['content'] as $table_name) {
			vid_content($table_name);
		}
	}

	if(empty($_GET['structure']) && empty($_GET['content']))
		echo '<p align="center"><a href = "z10-1.php">Возврат к выбору таблицы</a></p>';

    function vid_structure($table_name) {
    	global $db_handle;

    	echo <<< HTML
    	<table cellpadding="5" border = "1" align="center"><caption><h4>Структура таблицы "$table_name"</h4></caption>
			<tr>
				<th align="center">Field</th>
				<th align="center">Type</th>
				<th align="center">Null</th>
				<th align="center">Key</th>
				<th align="center">Default</th>
				<th align="center">Extra</th>
			</tr>
HTML;

		$sql_query = 'SHOW COLUMNS FROM `' . $table_name . '`';
		$result = mysql_query($sql_query, $db_handle);
		if(!$result)
			die('Could not show columns from table `' . $table_name . '`: ' . mysql_error());

		if (mysql_num_rows($result) > 0)
			while ($row = mysql_fetch_assoc($result)) {
				echo '<tr>';
				foreach($row as $value)
					echo '<td align="center">' . $value . '</td>';
				echo '</tr>';
			}
		echo '</table><br>';
    }

	function vid_content($table_name) {
		global $db_handle;

		$rus_headers = array(
			'cust' => array(
	        	'cnum' => 'Номер покупателя',
				'cname' => 'Имя покупателя',
				'city' => 'Город',
				'rating' => 'Рейтинг',
				'snum' => 'Номер продовца'
	        ),

	        'sal' => array(
	        	'snum' => 'Номер продовца',
				'sname' => 'Имя продовца',
				'city' => 'Город',
				'rating' => 'Рейтинг',
				'comm' => 'Комиссионные'
	        ),

	        'ord' => array(
	        	'onum' => 'Номер заказа',
	        	'odate' => 'Дата',
				'cnum' => 'Номер покупателя',
				'snum' => 'Номер продовца',
				'amt' => 'Количество'
	        )
		);

		echo '<table cellpadding="5" border = "1" align="center"><caption><h4>Контент из таблицы "' . $table_name . '"</h4></caption>';

		$sql_query = 'SHOW COLUMNS FROM `' . $table_name . '`';
		$result = mysql_query($sql_query, $db_handle);
		if(!$result)
			die('Could not show columns from table `' . $table_name . '`: ' . mysql_error());

		echo '<tr>';
		if (mysql_num_rows($result) > 0)
			while ($row = mysql_fetch_assoc($result))
				echo '<th align="center">' . $rus_headers[$table_name][$row['Field']] . '<br>' . $row['Field'] . '</th>';
		echo '</tr>';

		$sql_query = 'SELECT * FROM `' . $table_name . '`';
			$result = mysql_query($sql_query, $db_handle);
			if(!$result)
				die('Could not show records from table `' . $table_name . '`: ' . mysql_error());

			if (mysql_num_rows($result) > 0)
		    	while ($row = mysql_fetch_assoc($result)) {
					echo '<tr>';
		        	foreach($row as $value)
						echo '<td align="center">' . $value . '</td>';
		        	echo '</tr>';
		    	}
	}
?>