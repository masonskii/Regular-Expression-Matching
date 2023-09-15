#include <iostream>
#include <string>
#include <vector>

bool isMatch(const std::string& s, const std::string& p) {
    int m = s.size(), n = p.size();

    std::vector<std::vector<bool>> dp(m + 1, std::vector<bool>(n + 1, false));
    dp[m][n] = true;

    for (int i = m; i >= 0; --i) {
        for (int j = n - 1; j >= 0; --j) {
            bool first_match = i < m && (s[i] == p[j] || p[j] == '.');
            if (j + 1 < n && p[j + 1] == '*') {
                dp[i][j] = dp[i][j + 2] || (first_match && dp[i + 1][j]);
            } else {
                dp[i][j] = first_match && dp[i + 1][j + 1];
            }
        }
    }
    return dp[0][0];
}

int main() {
    std::string s = "aaaaaaaaaaaaaaaaaaa";
    std::string p = "a*a*a*a*a*a*a*a*a*b";
    std::cout << std::boolalpha << isMatch(s, p) << std::endl; // Output: false
    return 0;
}