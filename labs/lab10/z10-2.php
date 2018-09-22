<!DOCTYPE HTML>
<html lang="ru">
	<head>
		<meta charset="utf-8">
		<title>Таблица "<?php if(!empty($_GET['structure'])) echo $_GET['structure']; elseif (!empty($_GET['content'])) echo $_GET['content']; ?>"</title>
		<?php
			include("z10-3.inc");
			include("z10-4.inc");
			include("z10-5.inc");
			include("z10-6.inc");
		?>
	</body>
</html>