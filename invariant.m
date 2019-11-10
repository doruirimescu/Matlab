function pi = invariant( P )
%Calculates the invariant distribution "pi" of the
%transition matrix P of a Markov Chain
    pi = ( inv( P' + 1 - eye( length( P ) ) ) * ones( 1, length( P ) )' )';
end