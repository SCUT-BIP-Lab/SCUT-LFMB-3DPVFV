function dst = img_rectify(src, H)
[rows, cols] = size(src);
x = [];
y = [];
for r = 1:rows
    x = [x, ones(1, cols) * r];
    y = [y, 1:cols];
end
z = ones(1, rows * cols);
coor = inv(H) * [y; x; z];
coor = round(coor);
dst = uint8(zeros(rows, cols));
for r = 1:rows
    for c = 1:cols
%         if coor(1, (r-1) * cols + c)>0 && coor(2, (r-1) * cols + c)>0 && coor(1, (r-1) * cols + c) <= 640 && coor(2, (r-1) * cols + c) <= 480
%             dst(coor(2, (r-1) * cols + c), coor(1, (r-1) * cols + c) ) = src(r, c);
%         end
         if coor(1, (r-1) * cols + c)>0 && coor(2, (r-1) * cols + c)>0 && coor(1, (r-1) * cols + c) <= 640 && coor(2, (r-1) * cols + c) <= 480
            dst(r,c) = src(coor(2, (r-1)*cols+c), coor(1, (r-1)*cols + c));
        end
    end
end
% figure(5);
% imshow(src);
% figure(6);
% imshow(dst);
