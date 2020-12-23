function [u_edge_x, u_edge_y, b_edge_x, b_edge_y] = find_contours(edge_img)

[h, w] = size(edge_img);
mid = floor(h / 2);
thre = 150;
dst_img = zeros(h, w);

for i = 1 : w
    % ÉÏ±ßÔµ
    y = find(edge_img(1 : mid, i) > thre);
    [len, ~] = size(y);
    if(len > 0)
        dst_img(y(len), i) = 255;
    else
        max_value = max(edge_img(1 : mid, i));
        y = find(edge_img(1 : mid, i) == max_value);
        [len, ~] = size(y);
        dst_img(y(len), i) = 255;
    end
    
    % ÏÂ±ßÔµ
    y = find(edge_img(mid : end, i) > thre);
    [len, ~] = size(y);
    if(len > 0)
        dst_img(mid + y(1), i) = 255;
    else
        max_value = max(edge_img(mid : end, i));
        y = find(edge_img(mid : end, i) == max_value);
        %[len, ~] = size(y);
        dst_img(mid + y(1),i) = 255;
    end
    
    [u_edge_x, u_edge_y] = find(dst_img(1 : mid, :) == 255);
    [b_edge_x, b_edge_y] = find(dst_img(mid : end, :) == 255);
    b_edge_x = b_edge_x + mid;
end