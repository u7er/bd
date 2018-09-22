<?php


print "<table border = '1' cellpadding='0'>\n";

for($y = 1;$y <= 30;$y++){
    print "<tr>\n";
    for($x = 1;$x <= 30;$x++) {
        $sum = $y * $x;
        if($sum%7 == 0){
            $color = "white";
        }elseif ($sum%7 == 1) {
            $color = "aqua";
        }elseif ($sum%7 == 2) {
            $color = "blue";
        }elseif ($sum%7 == 3) {
            $color = "yellow";
        }elseif ($sum%7 == 4) {
            $color = "purple";
        }elseif ($sum%7 == 5) {
            $color = "red";
        }else {
            $color = "lime";
        }
        print "\t<td width='14' height='15' bgcolor=$color>";
        print "<font size='1'>&nbsp</font>";
        print "\t</td>";
    }
    print "</tr>";
}
print "</table>";



?>