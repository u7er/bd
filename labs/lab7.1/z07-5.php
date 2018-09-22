<?php
	function output($cust) {
		foreach($cust as $key => $value)
			echo $key . ' => ' . $value . '</br>';
	}

	$cust = array(
		'cnum' => '2001', 
		'cname' => 'Hoffman',
		'city' => 'London', 
		'snum' => '1001',
		'rating' => '100'
	);

	echo 'Array $cust[]: <br>';
	output($cust);

	echo '<br>Sort by value array $cust[]: <br>';
	asort($cust);
	output($cust);

	echo '<br>Sort by key array $cust[]: <br>';
	ksort($cust);
	output($cust);

	echo '<br>Sort array $cust[]: <br>';
	sort($cust);
	output($cust);
?>