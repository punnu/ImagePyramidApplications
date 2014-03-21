%% loads the saved image file, process them saves the C matrix of each image in a mat file DB
clc;
clear all;
load Images.mat;
format long g;

[count, ~] = size(Images);
DB = cell(count, 1);

%% process each of DB image
for iter = 1:1:count,
    image = Images{iter, 1};    
    DB{iter, 1} = process(image);
end;

save DB.mat DB;