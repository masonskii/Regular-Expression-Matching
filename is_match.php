function isMatch(string $s, string $p): bool {
    $m = strlen($s);
    $n = strlen($p);
    $dp = array();
    for ($i = 0; $i <= $m; $i++) {
        for ($j = 0; $j <= $n; $j++) {
            $dp[$i][$j] = false;
        }
    }
    $dp[$m][$n] = true;

    for ($i = $m; $i >= 0; $i--) {
        for ($j = $n - 1; $j >= 0; $j--) {
            $first_match = $i < $m && ($s[$i] == $p[$j] || $p[$j] == ".");
            if ($j + 1 < $n && $p[$j + 1] == "*") {
                $dp[$i][$j] = $dp[$i][$j + 2] || ($first_match && $dp[$i + 1][$j]);
            } else {
                $dp[$i][$j] = $first_match && $dp[$i + 1][$j + 1];
            }
        }
    }
    return $dp[0][0];
}

$s = "aaaaaaaaaaaaaaaaaaa";
$p = "a*a*a*a*a*a*a*a*a*b";
echo isMatch($s, $p) ? "true" : "false"; // Output: false
