<?php
	if (empty($_POST))
		exit();

	$cor_ans = array(//мапа правильных ответов
		'prado_1' => '6', 
		'reichstag_2' => '9',
		'scala_3' => '4', 
		'bronze_horseman_4' => '1',
		'western_wall_5' => '3',
		'tretyakov_gallery_6' => '2',
		'triumphal_arch_7' => '5',
		'statue_of_liberty_8' => '8',
		'tower_9' => '7'
	);

	$user_score = 0;//результат
	
	foreach($_POST as $key => $value)
		if($value == $cor_ans[$key])
			$user_score++;

	echo '<h1>Пользователь, ' . $_POST['name'] . ' вы ';
	switch($user_score) {
		case 2: echo 'очень плохо знаете географию.';
				break;
		case 3: echo 'плохо знаете географию.';
				break;
		case 4: echo 'терпимо знаете географию.';
				break;	
		case 5: echo 'удовлетворительно знаете географию.';
				break;
		case 6: echo 'хорошо знаете географию.';
				break;
		case 7: echo 'очень хорошо знаете географию.';
				break;
		case 8: echo 'отлично знаете географию.';
				break;
		case 9: echo 'великолепно знаете географию.';
				break;
		default: echo 'вообще не знаете географию.';
				break;
	}
	echo ' Ваш результат: ' . $user_score . ' из ' . count($cor_ans) . ' вопросов.';
	echo '<br><a href = "z08-3a.htm">Назад</a>';
?>