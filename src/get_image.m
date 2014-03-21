function I = get_image(P,level)
    for i = level-1:-1:1
        temp = impyramid(P{i+1},'expand');
        [M N X] = size(P{i});
        P{i} = P{i} + imresize(temp,[M N]);
    end
    I = uint8(P{1});
end