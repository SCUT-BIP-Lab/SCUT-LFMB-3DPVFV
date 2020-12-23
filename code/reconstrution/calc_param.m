function params = calc_param(I1_u, I1_b, I2_u, I2_b, I3_u, I3_b)
% global k1 bias1 k2 bias2 k3 bias3 k4 bias4 k5 bias5 k6 bias6 init_center_x init_center_y init_radius
global  coor_c1 coor_c2 coor_c3 en_show fig_debug
% m1_2 = [1, 0, 0; 0, 1, 68; 0, 0, 1];
% m2_2 = [-0.5, 0.866, 0; -0.866, -0.5, 68; 0, 0, 1];
% m3_2 = [-0.5, -0.866, 0; 0.866, -0.5, 68; 0, 0, 1];

m1_2 = [-1, 0, 0; 0, 1, 68; 0, 0, 1];
m2_2 = [0.5, -0.866, 0; -0.866, -0.5, 68; 0, 0, 1];
m3_2 = [0.5, 0.866, 0; 0.866, -0.5, 68; 0, 0, 1];

% x = -20:0.1:20;
P = inv(m1_2) * [I1_u-240; 720; 1];
%x_c = 0; y_c = -68;
x_c = coor_c1(1); y_c = coor_c1(2); %1∫≈…„œÒª˙◊¯±Í
x_u = P(1); y_u = P(2);
params.k1 = (y_u - y_c) / (x_u - x_c);
params.bias1 = y_c - params.k1 * x_c;
% y1 = params.k1*x + params.bias1;
L1 = [params.k1, -1, params.bias1];

P = inv(m1_2) * [I1_b-240; 720; 1];
% x_c = 0; y_c = -68;
x_c = coor_c1(1); y_c = coor_c1(2);
x_u = P(1); y_u = P(2);
params.k2 = (y_u - y_c) / (x_u - x_c);
params.bias2 = y_c - params.k2 * x_c;
% y2 = params.k2*x + params.bias2;
L2 = [params.k2, -1, params.bias2];

P = inv(m2_2) * [I2_u-240; 720; 1];
% x_c = 58.8897; y_c = 34;
x_c = coor_c2(1); y_c = coor_c2(2);
x_u = P(1); y_u = P(2);
params.k3 = (y_u - y_c) / (x_u - x_c);
params.bias3 = y_c - params.k3 * x_c;
% y3 = params.k3*x + params.bias3;
L3 = [params.k3, -1, params.bias3];

P = inv(m2_2) * [I2_b-240; 720; 1];
% x_c = 58.8897; y_c = 34;
x_c = 58.8897; y_c = 34;
x_u = P(1); y_u = P(2);
params.k4 = (y_u - y_c) / (x_u - x_c);
params.bias4 = y_c - params.k4 * x_c;
% y4 = params.k4*x + params.bias4;
L4 = [params.k4, -1, params.bias4];

P = inv(m3_2) * [I3_u-240; 720; 1];
% x_c = -58.8897; y_c = 34;
x_c = coor_c3(1); y_c = coor_c3(2);
x_u = P(1); y_u = P(2);
params.k5 = (y_u - y_c) / (x_u - x_c);
params.bias5 = y_c - params.k5 * x_c;
% y5 = params.k5*x + params.bias5;
L5 = [params.k5, -1, params.bias5];

P = inv(m3_2) * [I3_b-240; 720; 1];
% x_c = -58.8897; y_c = 34;
x_c = coor_c3(1); y_c = coor_c3(2);
x_u = P(1); y_u = P(2);
params.k6 = (y_u - y_c) / (x_u - x_c);
params.bias6 = y_c - params.k6 * x_c;
% y6 = params.k6*x + params.bias6;
L6 = [params.k6, -1, params.bias6];

% plot(x, y1, x, y2, x, y3, x, y4, x, y5, x, y6);
% hold on

poi1 = cross(L1, L4); % poi : point of intersection
poi2 = cross(L1, L6); poi2 = poi2/poi2(3);
poi3 = cross(L3, L6); poi3 = poi3/poi3(3);
poi4 = cross(L2, L3); poi4 = poi4/poi4(3);
poi5 = cross(L2, L5); poi5 = poi5/poi5(3);
poi6 = cross(L4, L5); poi6 = poi6/poi6(3);

% if en_show
%     figure(fig_src); subplot(2,2,4); hold off;
%     plot(poi1(1), poi1(2), 'o'); hold on;
%     plot(poi2(1), poi2(2), 'o'); hold on;
%     plot(poi3(1), poi3(2), 'o'); hold on;
%     plot(poi4(1), poi4(2), 'o'); hold on;
%     plot(poi5(1), poi5(2), 'o'); hold on;
%     plot(poi6(1), poi6(2), 'o'); hold on
% end

diagonal1 = cross(poi1, poi4);
diagonal2 = cross(poi2, poi5);
diagonal3 = cross(poi3, poi6);

p_center_1 = cross(diagonal1, diagonal2);
p_center_2 = cross(diagonal1, diagonal3);
p_center_3 = cross(diagonal2, diagonal3);
p_center_1 = p_center_1 / p_center_1(3);
p_center_2 = p_center_2 / p_center_2(3);
p_center_3 = p_center_3 / p_center_3(3);

% if en_show
%     figure(fig_src); subplot(2,2,4); 
%     hold on; plot(p_center_1(1), p_center_1(2), 'o');
%     hold on; plot(p_center_2(1), p_center_2(2), 'o');
%     hold on; plot(p_center_3(1), p_center_3(2), 'o');
% end

tmp = (p_center_1 + p_center_2 + p_center_3)/3;
params.init_center_x = tmp(1);
params.init_center_y = tmp(2);
% ≈–∂œƒ‹∑Ò π”√Õ÷‘≤ƒ‚∫œ
params.poi_var = sum((p_center_1 -tmp).^2 + (p_center_2 - tmp).^2 + (p_center_3 - tmp).^2);

dist1 = (poi1(1)-params.init_center_x)^2+(poi1(2)-params.init_center_y)^2;
dist2 = (poi2(1)-params.init_center_x)^2+(poi2(2)-params.init_center_y)^2;
dist3 = (poi3(1)-params.init_center_x)^2+(poi3(2)-params.init_center_y)^2;
dist4 = (poi4(1)-params.init_center_x)^2+(poi4(2)-params.init_center_y)^2;
dist5 = (poi5(1)-params.init_center_x)^2+(poi5(2)-params.init_center_y)^2;
dist6 = (poi6(1)-params.init_center_x)^2+(poi6(2)-params.init_center_y)^2;

init_radius = min( [dist1, dist2, dist3, dist4, dist5, dist6] ); 
params.init_radius = init_radius(1) - 5;

