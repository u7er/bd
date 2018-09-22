<?php

$colors = array("white","aqua","blue","yellow","purple","red","lime");
for ($k = 4;$k < 8;$k++) {
    print "K = ".$k;
    print "<table border = '1' cellpadding='0'>\n";
    for ($y = 1; $y <= 30; $y++) {
        print "<tr>\n";
        for ($x = 1; $x <= 30; $x++) {
            $sum = $y * $x;
            print "\t<td width='14' height='15' bgcolor=".$colors[($sum % $k)].">";
            print "<font size='1'>&nbsp</font>";
            print "\t</td>";
        }
        print "</tr>";
    }
    print "</table>";
}
?>