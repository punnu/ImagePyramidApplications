clear all;
clc;

A = imread('../images/img5.jpg');
B = imread('../images/img6.jpg');

A = double(A);
B = double(B);
[M N X] = size(B);
A = imresize(A,[M N]);

n_levels = 5;

P1 = my_image_pyramid(A,n_levels);
P2 = my_image_pyramid(B,n_levels);



P = {};
for i=1:1:n_levels
    I1 = P1{i};
    I2 = P2{i};
    [M N X] = size(P1{i});
    LineOfContact = uint32((N/2)+(5/i));
    temp = zeros(M,N,X);
    for k=1:1:X
        for j=1:1:LineOfContact
            temp(:,j,k) = I1(:,j,k);
        end
        for j=LineOfContact+1:1:N
            temp(:,j,k) = I2(:,j,k);
        end
    end
    P{i} = temp;
end
I = get_image(P,n_levels);
figure,imshow(I);
X = A;
LineOfContact = uint32(size(X,2)/2)+5;
X(:,LineOfContact:end,:) = B(:,LineOfContact:end,:);
figure,imshow(uint8(X));
