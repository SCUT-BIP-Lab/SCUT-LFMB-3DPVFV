% 输入图像为uint8类型，单通道
function [ux, bx]  = edge_detect(img, min_x, max_x, img_idx)
% global en_show
% global fig_src;
gau_win_width = 9;  % 取奇数 % 9 slidering window width
gau_1d = fspecial('gaussian', [1 gau_win_width], 5); % 边缘线滤波模板
sub_img = img(:, min_x - floor(gau_win_width / 2) : max_x + floor(gau_win_width / 2));  % 边缘提取宽度为9.，所以这里先左右扩大4

[h,w] = size(sub_img);

edge_operator = [-1, -1, -1, -1, -1, -1, -1, -1, -1;...
                0,  0,  0,  0,  0,  0,  0,  0,  0;...
                1,  1,  1,  1,  1,  1,  1,  1,  1];

edge_img = zeros(h, w);
edge_img(1 : h/2, :) = conv2(im2double(sub_img(1 : h/2, :)), -edge_operator, 'same');
edge_img(h/2 : end, :) = conv2(im2double(sub_img(h/2 : end, :)), edge_operator, 'same');

SE = strel('rectangle',[3,9]);
edge_img = imdilate(edge_img, SE, 'same');
edge_img = imerode(edge_img, SE, 'same');

edge_img = im2uint8(edge_img);

% if en_show
%     figure(fig_src);
%     subplot(2, 2, img_idx); imshow(sub_img);
% end
[ux, ~, bx, ~] = find_contours(edge_img);

% check
u_idx = find_pts(ux, gau_win_width);
b_idx = find_pts(bx, gau_win_width);
if u_idx == 0 || b_idx == 0
    disp(strcat(img_name, 'failed'));
else
    ux = erase_outlier(u_idx, gau_win_width, ux);
    bx = erase_outlier(b_idx, gau_win_width, bx);
end
ux = conv(ux, gau_1d, 'valid');
bx = conv(bx, gau_1d, 'valid');

% tmp_ux = int32(round(ux));
% tmp_bx = int32(round(bx));
% for col = 1 : size(ux, 1)
%     img(tmp_ux(col) - 1 : tmp_ux(col) + 1, min_x + col) = 255;
%     img(tmp_bx(col) - 1 : tmp_bx(col) + 1, min_x + col) = 255;
%     if en_show
%         figure(fig_src); 
%         subplot(2, 2, img_idx); plot(min_x + col, tmp_ux(col), 'o'); plot(min_x + col, tmp_bx(col), 'o');
%         hold on;
%     end
% end
