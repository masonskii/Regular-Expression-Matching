fn is_match(s: String, p: String) -> bool {
    let s_chars: Vec<char> = s.chars().collect();
    let p_chars: Vec<char> = p.chars().collect();
    let m = s.len();
    let n = p.len();
    
    let mut dp = vec![vec![false; n+1]; m+1];
    dp[m][n] = true;
    
    for i in (0..=m).rev() {
        for j in (0..n).rev() {
            let first_match = i < m && (s_chars[i] == p_chars[j] || p_chars[j] == '.');
            if j+1 < n && p_chars[j+1] == '*' {
                dp[i][j] = dp[i][j+2] || (first_match && dp[i+1][j]);
            } else {
                dp[i][j] = first_match && dp[i+1][j+1];
            }
        }
    }
    
    dp[0][0]
}
