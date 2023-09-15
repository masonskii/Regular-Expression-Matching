bool isMatch(String s, String p) {
  int m = s.length, n = p.length;
  List<List<bool>> dp = List.generate(m + 1, (_) => List<bool>.filled(n + 1, false));
  dp[m][n] = true;

  for (int i = m; i >= 0; i--) {
    for (int j = n - 1; j >= 0; j--) {
      bool firstMatch = i < m && (s[i] == p[j] || p[j] == '.');
      if (j + 1 < n && p[j + 1] == '*') {
        dp[i][j] = dp[i][j + 2] || (firstMatch && dp[i + 1][j]);
      } else {
        dp[i][j] = firstMatch && dp[i + 1][j + 1];
      }
    }
  }
  return dp[0][0];
}

void main() {
  String s = "aaaaaaaaaaaaaaaaaaa";
  String p = "a*a*a*a*a*a*a*a*a*b";
  print(isMatch(s, p)); // Output: false
}
