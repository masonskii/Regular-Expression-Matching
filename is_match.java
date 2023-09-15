public class Main {
    public static boolean isMatch(String s, String p) {
        int m = s.length(), n = p.length();
        boolean[][] dp = new boolean[m + 1][n + 1];
        dp[m][n] = true;

        for (int i = m; i >= 0; --i) {
            for (int j = n - 1; j >= 0; --j) {
                boolean first_match = i < m && (s.charAt(i) == p.charAt(j) || p.charAt(j) == '.');
                if (j + 1 < n && p.charAt(j + 1) == '*') {
                    dp[i][j] = dp[i][j + 2] || (first_match && dp[i + 1][j]);
                } else {
                    dp[i][j] = first_match && dp[i + 1][j + 1];
                }
            }
        }
        return dp[0][0];
    }

    public static void main(String[] args) {
        String s = "aaaaaaaaaaaaaaaaaaa";
        String p = "a*a*a*a*a*a*a*a*a*b";
        System.out.println(isMatch(s, p)); // Output: false
    }
}