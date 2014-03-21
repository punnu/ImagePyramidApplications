clear all;
clc;

level = 2;
quant=4;

I = imread('../images/2.jpg');
if (size(I,3)>1)
    I = rgb2gray(I);
end
figure, imshow(I);

size_old = entropy(uint16(I))*size(I,1)*size(I,2);

I = int16(I);
P = image_pyramid_a(I,level);
size_new = 0;

for i=1:1:level
    X = P{i};
    X = X/quant;
    X = X*quant;
    P{i} = X;
    X = X - min(min(X));
    size_new = size_new + size(P{i},1)*size(P{i},2)*entropy(uint16(X));
end
compression = size_old/size_new
I_new = get_image(P,level);
figure,imshow(uint8(I_new));
imwrite(I_new,'res.jpg');
%final_size = entropy(double(I_new))
