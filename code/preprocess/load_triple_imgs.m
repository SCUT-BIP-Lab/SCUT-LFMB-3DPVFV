function [flag, img_1, img_2, img_3] = load_triple_imgs(folder, img_name)
flag = 1;
file_name1 = fullfile(folder, '1', img_name);
file_name2 = fullfile(folder, '2', img_name);
file_name3 = fullfile(folder, '3', img_name);
if exist(file_name1, 'file') && exist(file_name2, 'file') && exist(file_name3, 'file')
    img_1 = imread(file_name1);
    if(size(img_1, 3) == 3) 
        img_1 = rgb2gray(img_1); 
    end
    img_2 = imread(file_name2);
    if(size(img_2, 3) == 3) 
        img_2 = rgb2gray(img_2); 
    end
    img_3 = imread(file_name3);
    if(size(img_3, 3) == 3) 
        img_3 = rgb2gray(img_3); 
    end
else
    flag = 0;
end