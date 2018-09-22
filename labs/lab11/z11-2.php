<?php
	require('config.php');
	date_default_timezone_set('Asia/Novosibirsk');

	$nb_fn = 'notebook_br'.BR_NUM.'.txt';
	if (!file_exists($nb_fn))
	    die('File "' . $nb_fn . '" is not exists<br>');

	echo 'File "' . $nb_fn . '" is exists<br><br>';

	$file_array = file($nb_fn);
	if (!$file_array)
		die('Could not read from file "' . $nb_fn);

	$mod_time = fileatime($nb_fn);
?>

<!DOCTYPE HTML>
<html lang="ru">
	<head>
		<meta charset="utf-8">
		<title>Таблица <?php echo '"notebook_br'.BR_NUM.'"'; ?></title>
	</head>
	<body>
		<?php
			echo '<table cellpadding="10" border = "1" align="center"><caption>Моя записная книга</caption>';
			foreach ($file_array as $line) {
				$record = rtrim($line, " | \r\n");
				$record = preg_replace("/(\S+@\S+)/", '<a href="mailto:${1}">${1}</a>', $record);
				$record = str_replace(' | ', '</td><td align="center">', $record);

				echo '<tr><td align="center">' . $record . '</td></tr>';
			}
			echo '</table>';
			echo '<p align="center"><i>Дата последней записи: ' . date('D d M Y h:i:s', $mod_time) . '</i></p>';
		?>
	</body>
</html>