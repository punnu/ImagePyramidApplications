function P = image_pyramid_a(I,level)
    P = {};
    sig = 1.6;
    siz = [5 5];
    gaus_filter = fspecial('gaussian', siz, sig);
    P{1} = imfilter(I,gaus_filter,'conv');
    for i=2:1:level
        I_prev = imfilter(P{i-1},gaus_filter,'conv');
        [M N] = size(P{i-1});
        temp = I_prev(1:2:M,:);
        P{i} = temp(:,1:2:N);
    end
    P = get_laplacian(P,level);
end

function P = get_laplacian(P_in,level)
    P = P_in;
    for i=1:1:(level-1)
        [M N] = size(P{i});
        temp = imresize(impyramid(P{i+1},'expand'),[M N]);
        P{i} = P{i} - temp;
    end
end
