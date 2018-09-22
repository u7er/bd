<?php
	const cNUM_E = M_E;
	define("dNUM_E", M_E);

	echo 'Number (const) e: ' . cNUM_E . '<br/>';
	echo 'Number (define) e: ' . cNUM_E . '<br/><br/>';

	$num_e1 = cNUM_E;
	echo 'Var $num_e1 = (' . gettype($num_e1) .') '. $num_e1 . '<br/>';

	$num_e1 = cNUM_E;
	settype($num_e1, "string");
	echo 'Var $num_e1 = (' . gettype($num_e1) .') '. $num_e1 . '<br/>';

	$num_e1 = cNUM_E;
	settype($num_e1, "integer");
	echo 'Var $num_e1 = (' . gettype($num_e1) .') '. $num_e1 . '<br/>';

	$num_e1 = cNUM_E;
	settype($num_e1, "boolean");
	echo 'Var $num_e1 = (' . gettype($num_e1) .') '. $num_e1 . '<br/>';
?>