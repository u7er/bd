<?php
	function output($arr) {
		foreach($arr as $value)
			echo $value . '&nbsp;&nbsp;';
	}

	$treug = array();
	$kvd = array();

	for($i = 0; $i < 10; $i++) {
		$treug[] = ($i + 1) * ($i + 2) / 2;
		$kvd[] = pow($i + 1, 2);
	}

	echo 'Array of triangular numbers ($treug[]): ';
	output($treug);

	echo '<br>Array of squares numbers ($kvd[]): ';
	output($kvd);

	$rez = array_merge($treug, $kvd);
	echo '<br>Merge arrays $treug[] & $kvd[]: ';
	output($rez);

	asort($rez);
	echo '<br>Sort array $res[]: ';
	output($rez);

	unset($rez[0]);
	echo '<br>Array (after unset 0) $res[]: ';
	output($rez);

	$rez1 = array_unique($rez);
	echo '<br>Unique array $res1[]: ';
	output($rez1);
?>