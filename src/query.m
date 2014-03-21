%% actual function query

function [] = query(index)
    load Images;clc;
    
    %% read and resize
    image = imread(['images\test\1 (', index, ').png']);
    image = imresize(image, [256 256]);
    
    %% process
    C = process(image);
    
    %% find min
    Scores = score(C);
    [~, Index] = sort(Scores, 'descend');
    minIndex = Index(end,1);
    
    %% plot
    subplot(1,2,1, 'align');
    imshow(Images{minIndex, 1});
    subplot(1,2,2, 'align');
    imshow(image);
end