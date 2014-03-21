%% used by part2

function out = process(image)
    N = 60;
    [r, c, d] = size(image);
    C = zeros(r*c, d);
    
    %% apply decomposition
    for i=1:1:d,
        [C(:,i), ~] = wavedec2(image(:,:,i), 8, 'haar');
    end;
    Copy = C;
    Copy(1,:) = [0,0,0];
    Copy = abs(Copy);
    maxIndex = zeros(N, d);
    
    %% find top N indices
    for i=1:1:d,
        [~, Index] = sort(Copy(:,i),'descend');
        maxIndex(:,i) = Index(1:N, 1);
    end;
    
    %% zero out rest values
    for i=1:1:d,
        temp = zeros(r*c, 1);
        temp(1,1) = 1;
        for j=1:1:N,
            index = maxIndex(j,i);
            temp(index, 1) = 1;
        end;
        C(:,i) = C(:,i).*temp;
    end;
    
    %% normalisation and truncation
    for i=1:1:d,
        for j=2:1:r*c,
            if(C(j,i) > 0)
                C(j,i) = 1;
            elseif (C(j,i) < 0)
                C(j,i) = -1;
            end;
        end;
    end;
    out = C;
end