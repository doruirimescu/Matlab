
function y = round_d ( x, d )
% Round round_d(x,y) rounds x to d decimal places

    y = round( x * 10^d ) / 10^d;
end