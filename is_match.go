package main

import "fmt"

func isMatch(s string, p string) bool {
	m, n := len(s), len(p)
	dp := make([][]bool, m+1)
	for i := range dp {
		dp[i] = make([]bool, n+1)
	}
	dp[m][n] = true

	for i := m; i >= 0; i-- {
		for j := n - 1; j >= 0; j-- {
			firstMatch := i < m && (s[i] == p[j] || p[j] == '.')
			if j+1 < n && p[j+1] == '*' {
				dp[i][j] = dp[i][j+2] || (firstMatch && dp[i+1][j])
			} else {
				dp[i][j] = firstMatch && dp[i+1][j+1]
			}
		}
	}
	return dp[0][0]
}

func main() {
	s := "aaaaaaaaaaaaaaaaaaa"
	p := "a*a*a*a*a*a*a*a*a*b"
	fmt.Println(isMatch(s, p)) // Output: false
}
