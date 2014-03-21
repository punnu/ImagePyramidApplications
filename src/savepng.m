for i=1:1:63,
    filepath =  ['images\10 (', num2str(i), ').jpg'];
    im = imread(filepath);
    imwrite(im, [num2str(i+9), '.png']);
end;