%%
clear;
close all;
clc;

%% Setting the path of dataset
addpath('./', './preprocess', './reconstrution', './edge_detection', './maptexture');
% folder = './data/session1/src';
folder = './examples/';
% loading camera parameters
set_cam_param; 

global en_show;  % visualize the procedure of 3D reconstruction for debugging
en_show = 0;  % 1 - enable the visualization; 0 - disable the visualization.
global fig_src;
fig_src = 1;
global fig_debug;
fig_debug = 1;
global fig_3d;
fig_3d = 4;
global interval_ellipse;
interval_ellipse = 0.5;
global min_y max_y;
min_y = 91;
max_y = 490;

% sample id
sub = 1;  % subject id
t = 1;  % time id
% image name
img_name = sprintf('%d-%d.bmp', sub, t);
disp(img_name);

%% reading images
[flag, img_1, img_2, img_3] = load_triple_imgs(folder, img_name);
figure();
subplot(221); imshow(img_1);
subplot(222); imshow(img_2);
subplot(223); imshow(img_3);

%% image preprocessing
win_width = 9;  % 9 slidering window width
gau_2d = fspecial('gaussian', [5, 5], 2); 

% gaussian filtering
tic;
disp('guassian filtering');
img_1 = uint8(conv2(double(img_1), gau_2d, 'same'));
img_2 = uint8(conv2(double(img_2), gau_2d, 'same'));
img_3 = uint8(conv2(double(img_3), gau_2d, 'same'));
toc;

% image rectifying
tic;
disp('image rectifying');
img_1 = img_rectify(img_1, H1);
img_2 = img_rectify(img_2, H2);
img_3 = img_rectify(img_3, H3);
toc;

% edge extraction
tic;
disp('edge extraction');
edge_arr = find_all_edges(img_1, img_2, img_3);
toc;

% brightness normalization
[img_1, img_2, img_3] = adjust_brightness(img_1, img_2, img_3, edge_arr, 128);
figure();
subplot(221);  imshow(img_1);
subplot(222);  imshow(img_2);
subplot(223);  imshow(img_3);

tic;
disp('3D Reconstruction');
[~, z_arr, X] = finger_reconstruct(edge_arr);
% [~, z_arr, X] = finger_reconstruct_2(edge_arr);
toc;

% show 3D model
[x_3D, y_3D, z_3D] = draw_model( z_arr, X );

tic;
disp('Texture mapping');
[coor_3D, vein_texture] = map_texture(z_arr, X, img_1, img_2, img_3, edge_arr);
toc;

draw_3DFM_texture( coor_3D, vein_texture );

%% unfolding
% % 展开成纹理图与深度图
% tic;
% disp('展开成纹理图/深度图');
% [texture_map, depth_map] = extract_maps( coor_3D, vein_texture );
% toc;
% figure();
% subplot(121);  imshow(texture_map);  title('texture map');
% subplot(122);  imshow(depth_map, []);    title('depth map');


% [coor_3D, dst_matrix] = map_texture_new(z_arr, X, img_1, img_2, img_3, edge_arr);
% [m, n] = size(dst_matrix);
% texture_map = zeros(m, n/2);
% depth_map = zeros(m, n/2);
% for i = 1:n/2
%     texture_map(:, i) = dst_matrix(:, 2*i-1);
%     depth_map(:, i) = dst_matrix(:, 2*i);
% end
% texture_map = mat2gray(texture_map);
% figure();
% subplot(121);  imshow(texture_map);  title('texture map');
% subplot(122);  imshow(depth_map, []);    title('depth map');