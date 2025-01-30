clear; clc;
%% Problem 1.a
X = ['a','b','c'];
Y = ['1','2','3'];

PX = [ 0.3, 0.5, 0.2];
PYX = [0.6, 0.1, 0.1 ; ...
       0.3, 0.5, 0.1 ; ...
       0.1, 0.4, 0.8 ];

for( y = 1:length(Y))
    px = PX;
    pyx = PYX(y,:);
    for( j = 1:length(X) )
        pxj = px(j);
        pyxj = pyx(j);
        result = (pyxj*pxj)./sum(px.*pyx);
        fprintf("P(%c|%c) = %f\n", X(j), Y(y), result)
    end
end

%% Problem 1.b
for( x = 1:length(X))
    px = PX(x);
    for( y = 1:length(Y) )
        pyx = PYX(y,x);
        result = px.*pyx;
        fprintf("P(%c,%c) = %f\n", X(x), Y(y), result)
    end
end

%% Problem 1.c
for( ii = 1:length(Y))
    px = PX;
    pyx = PYX(ii, :);
    pxi = PX(ii);
    pyxi = PYX(ii,ii);
    p_error(ii) = 1 - ((pyxi*pxi)./sum(px.*pyx));
end
fprintf("Prob_error = %f\n", sum(p_error.*PX));
%%
%% Problem 1.c
for( ii = 1:length(Y))
    px = PX(ii);
    pyx = PYX(ii,ii);
    p_correct(ii) = px.*pyx;
end
fprintf("Prob_error = %f\n", 1 - sum(p_correct));
%% Problem 1.d/e
x = [1,2,3];                                    
C = cell(3, 1);
[C{:}] = ndgrid(x);        
perms = cellfun(@(x){x(:)}, C); 
perms = [perms{:}];                 

for( p_idx = 1:size(perms,1) )
    for( ii = 1:length(Y))
        px = PX(perms(p_idx,ii));
        pyx = PYX(ii,perms(p_idx,ii));
        p_correct(ii) = px.*pyx;
    end
    fprintf("[1,2,3 -> %c,%c,%c] Prob_error = %f\n", X(perms(p_idx,:)), 1 - sum(p_correct));
end
