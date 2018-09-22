<?php

for ($n = 0;$n <= 30;$n++) {
    $treug[] = $n*($n+1)/2;
    $kvd[] = $n*$n;
}

print "<table border = '1' cellpadding='5'>\n";

for($y = 1;$y <= 30;$y++){
    print "<tr>\n";
    for($x = 1;$x <= 30;$x++) {
        $sum = $y * $x;
        if(array_search($sum,$treug)) {
            if (array_search($sum, $kvd)) {
                $color = "red";
            } else {
                $color = "green";
            }
        }elseif(array_search($sum,$kvd)) {
            $color = "blue";
        }else {
            $color = "white";
        }
        print "\t<td bgcolor=$color>";
        print "<font size='1'>$sum</font>";
        print "\t</td>";
    }
    print "</tr>";
}
print "</table>";

foreach ($treug as $t) {
    print "$t  ";
}

?>