function P = get_pyramid(X, level)
    % gives laplacian pyramid
    P = {};
    P{1} = X;
    for i=2:1:level
        P{i} = impyramid(P{i-1},'reduce');
    end
    for i=1:1:(level-1)
        [M N X] = size(P{i});
        temp = imresize(impyramid(P{i+1},'expand'),[M N]);
        P{i} = P{i} - temp;
    end
end