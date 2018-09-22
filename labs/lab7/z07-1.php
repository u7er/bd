<?php

for ($n = 1;$n <= 10;$n++) {
    $treug[] = $n*($n+1)/2;
    $kvd[] = $n*$n;
}

foreach ($treug as $t) {
    print "$t  ";
}
print "<br>";

foreach ($kvd as $k) {
    print "$k  ";
}
print "<br>";

$res = array_merge($treug,$kvd);

foreach ($res as $r) {
    print "$r  ";
}

print "<br>";

sort($res);
foreach ($res as $r) {
    print "$r  ";
}

print "<br>";

array_shift($res);

foreach ($res as $r) {
    print "$r  ";
}

print "<br>";

$res1 = array_unique($res);
foreach ($res1 as $r1) {
    print "$r1  ";
}

?>