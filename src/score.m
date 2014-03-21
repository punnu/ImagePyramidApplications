%% used by query
function out = score(C)
    weight = 2000;
    load DB;    
    [r, ~] = size(DB);    
    Scores = zeros(r, 1);
    for i=1:1:r,
        I = DB{i, 1};
        
        %% initial difference
        Scores(i, 1) = Scores(i, 1) + abs(I(1, 1)- C(1, 1));
        [rows, ~] = size(I);
        for j=2:1:rows,
            if(C(j, 1) ~= 0),
                if(C(j, 1) == I(j, 1)),                    
                    %% high frequecy components matching
                    Scores(i, 1) = Scores(i, 1) - weight;
                end;
            end;
        end;
    end;
    out = Scores;
end