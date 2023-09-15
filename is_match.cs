using System;

namespace IsMatch
{
    class Program
    {
        public static bool IsMatch(string s, string p)
        {
            int m = s.Length, n = p.Length;
            bool[,] dp = new bool[m + 1, n + 1];
            dp[m, n] = true;

            for (int i = m; i >= 0; i--)
            {
                for (int j = n - 1; j >= 0; j--)
                {
                    bool first_match = i < m && (s[i] == p[j] || p[j] == '.');
                    if (j + 1 < n && p[j + 1] == '*')
                    {
                        dp[i, j] = dp[i, j + 2] || (first_match && dp[i + 1, j]);
                    }
                    else
                    {
                        dp[i, j] = first_match && dp[i + 1, j + 1];
                    }
                }
            }
            return dp[0, 0];
        }

        static void Main(string[] args)
        {
            string s = "aaaaaaaaaaaaaaaaaaa";
            string p = "a*a*a*a*a*a*a*a*a*b";
            Console.WriteLine(IsMatch(s, p)); // Output: False
        }
    }
}