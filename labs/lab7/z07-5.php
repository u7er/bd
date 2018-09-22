<?php

$cust = array('cnum' => 2001,
              'cname' => "Hoffman",
              'city' => "London",
              'snum' => 1001,
              'rating' => 100);
foreach ($cust as $key=>$value) {
    print "$key => $value"."<br>";
}

print "<br>Отсортировано по значениям:<br>";
asort($cust);
foreach ($cust as $key=>$value) {
    print "$key => $value"."<br>";
}

print "<br>Отсортировано по ключам:<br>";

ksort($cust);
foreach ($cust as $key=>$value) {
    print "$key => $value"."<br>";
}

print "<br>Отсортировано через sort:<br>";
sort($cust);
foreach ($cust as $key=>$value) {
    print "$key => $value"."<br>";
}

?>