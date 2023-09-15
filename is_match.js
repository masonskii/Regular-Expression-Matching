function isMatch(s, p) {
    const m = s.length,
        n = p.length;
    const dp = Array.from({ length: m + 1 }, () => new Array(n + 1).fill(false));
    dp[m][n] = true;

    for (let i = m; i >= 0; i--) {
        for (let j = n - 1; j >= 0; j--) {
            const firstMatch = i < m && (s[i] === p[j] || p[j] === '.');
            if (j + 1 < n && p[j + 1] === '*') {
                dp[i][j] = dp[i][j + 2] || (firstMatch && dp[i + 1][j]);
            } else {
                dp[i][j] = firstMatch && dp[i + 1][j + 1];
            }
        }
    }
    return dp[0][0];
}

const s = "aaaaaaaaaaaaaaaaaaa";
const p = "a*a*a*a*a*a*a*a*a*b";
console.log(isMatch(s, p)); // Output: false