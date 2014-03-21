%% loads all images and save them to a mat file

count = 72;
Images = cell(count, 1);

%% load images and save them in a cell matrix
for i=1:1:count,    
        I = imread([pwd, '\images\', num2str(i), '.png']);
        I128 = imresize(I, [256 256]);
        Images{i, 1} = I128;
        figure();
        imshow(I128);
end;

save Images.mat Images;