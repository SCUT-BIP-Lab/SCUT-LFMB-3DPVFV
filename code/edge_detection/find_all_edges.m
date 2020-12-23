function edge_arr = find_all_edges(img_1, img_2, img_3)
global min_y max_y
bias = 3; %3
[ux_1, bx_1] = edge_detect(img_1, min_y, max_y, 1);
ux_1 = ux_1 + bias; bx_1 = bx_1 - bias;
[ux_2, bx_2] = edge_detect(img_2, min_y, max_y, 2);
ux_2 = ux_2 + bias; bx_2 = bx_2 - bias;
[ux_3, bx_3] = edge_detect(img_3, min_y, max_y, 3);
ux_3 = ux_3 + bias; bx_3 = bx_3 - bias;

edge_arr = [ux_1'; bx_1'; ux_2'; bx_2'; ux_3'; bx_3'];