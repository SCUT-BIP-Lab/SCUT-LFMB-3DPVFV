function [dst1, dst2, dst3] = adjust_brightness(src1, src2, src3, edge_arr, setValue)

% %% ÑÚÄ¤
% % À©Õ¹±ß½ç
% extend_len = 15;
% edge_extend_left = edge_arr(:, 1) * ones(1, extend_len);
% edge_extend_right = edge_arr(:, end) * ones(1, extend_len);
% edge_arr_new = [edge_extend_left, edge_arr, edge_extend_right];
% 
% % ÑÚÄ¤Ä£°å
% mask1 = zeros(rows, cols);
% mask2 = mask1;
% mask3 = mask1;
% for col = 1 : size(edge_arr, 2)
%     mask1(edge_arr(1, col) : edge_arr(2, col), col + min_y - extend_len - 1) = 1; 
%     mask2(edge_arr(3, col) : edge_arr(4, col), col + min_y - extend_len - 1) = 1; 
%     mask3(edge_arr(5, col) : edge_arr(6, col), col + min_y - extend_len - 1) = 1; 
% end
% tmp1 = src1 .* mask1; 
% avgValue1 = sum(tmp1(:)) / sum(mask1(:));
% tmp2 = src2 .* mask2; 
% avgValue2 = sum(tmp2(:)) / sum(mask2(:));
% tmp3 = src3 .* mask3; 
% avgValue3 = sum(tmp3(:)) / sum(mask3(:));

avgValue1 = avgBright(src1, edge_arr(1, :), edge_arr(2, :));
avgValue2 = avgBright(src2, edge_arr(3, :), edge_arr(4, :));
avgValue3 = avgBright(src3, edge_arr(5, :), edge_arr(6, :));

src1 = int32(src1) + (setValue - avgValue1);
src1(find(src1 < 0)) = 0; src1(find(src1 > 255)) = 255;
src2 = int32(src2) + (setValue - avgValue2);
src2(find(src2 < 0)) = 0; src2(find(src2 > 255)) = 255;
src3 = int32(src3) + (setValue - avgValue3);
src3(find(src3 < 0)) = 0; src3(find(src3 > 255)) = 255;

% scale = 255 / (max(dst1(:), 255) - min(dst1(:), 0));
% dst1 = uint8((dst1 - min(dst1(:), 0)) * scale);
% 
% scale = 255 / (max(dst2(:), 255) - min(dst2(:), 0));
% dst2 = uint8((dst2 - min(dst2(:), 0)) * scale);
% 
% scale = 255 / (max(dst3(:), 255) - min(dst3(:), 0));
% dst3 = uint8((dst3 - min(dst3(:), 0)) * scale);


% src2 = src2 + (avgValue1 - avgValue2);
% src2(find(src2 > 255)) = 255;
% src3 = src3 + (avgValue1 - avgValue3);
% src3(find(src3 > 255)) = 255;
dst1 = uint8(src1);
dst2 = uint8(src2);
dst3 = uint8(src3);