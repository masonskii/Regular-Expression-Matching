#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool isMatch(const char *s, const char *p) {
    int m = strlen(s), n = strlen(p);

    bool **dp = malloc((m + 1) * sizeof(bool *));
    for (int i = 0; i <= m; i++) {
        dp[i] = calloc(n + 1, sizeof(bool));
    }
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
    bool result = dp[0][0];

    for (int i = 0; i <= m; i++) {
        free(dp[i]);
    }
    free(dp);

    return result;
}

int main() {
    const char *s = "aaaaaaaaaaaaaaaaaaa";
    const char *p = "a*a*a*a*a*a*a*a*a*b";
    printf("%s\n", isMatch(s, p) ? "true" : "false"); // Output: false
    return 0;
}