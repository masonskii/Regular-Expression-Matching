is_match(S, P) ->
    M = length(S),
    N = length(P),
    DP = lists:duplicate(M+1, lists:duplicate(N+1, false)),
    DP[M+1][N+1] = true,

    DoMatch = fun(I, J) ->
        FirstMatch = I =< M andalso ((nth(I,S) =:= nth(J,P)) or (nth(J,P) =:= $.) ),
        case (J+1) =< N andalso (nth(J+1,P) =:= $*) of
            true ->
                DP[I][J] = DP[I][J+2] orelse (FirstMatch andalso DP[I+1][J]);
                true ->
                DP[I][J] = FirstMatch andalso DP[I+1][J+1]
        end
    end,
    [DoMatch(I,J)
        || I <- lists:seq(M,0,-1),
           J <- lists:seq(N-1,0,-1)],
    DP.
