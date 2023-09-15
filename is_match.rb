def is_match(s, p)
    m, n = s.length, p.length
    dp = Array.new(m+1) { Array.new(n+1, false) }
    dp[m][n] = true
  
    (m.downto(0)).each do |i|
      (n-1).downto(0).each do |j|
        first_match = i < m && (s[i] == p[j] || p[j] == ".")
        if j+1 < n && p[j+1] == "*"
          dp[i][j] = dp[i][j+2] || (first_match && dp[i+1][j])
        else
          dp[i][j] = first_match && dp[i+1][j+1]
        end
      end
    end
  
    dp[0][0]
  end