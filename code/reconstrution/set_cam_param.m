% 设置摄像机参数，H1 H2 H3  P1 P2 P3  coor_c1 coor_c2 coor_c3
L = 68;

% C1_M1 = [744.41670   0  279.17077   0;   0   730.22414   243.39453   0; 0 0 1 0];%内
C1_M1 = [730.41670   0  286.57077   0;   0   720.22414   243.39453   0; 0 0 1 0];%内
% C1_M2 = [0 0 1 0; 1 0 0 0; 0 1 0 L; 0 0 0 1];
C1_M2 = [0 0 1 0; -1 0 0 0; 0 1 0 L; 0 0 0 1];

fai_x = pi/60;
Rx = [1, 0, 0, 0; 0, cos(fai_x), sin(fai_x), 0; 0, -sin(fai_x), cos(fai_x), 0; 0, 0, 0, 1];
fai_y = -pi/200;
Ry = [cos(fai_y), 0, -sin(fai_y), 0; 0, 1, 0, 0; sin(fai_y), 0, cos(fai_y), 0; 0, 0, 0, 1];
fai_z = pi/80;
Rz = [cos(fai_z), sin(fai_z), 0, 0; -sin(fai_z), cos(fai_z), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
C1_M2 = Rx*C1_M2;

% C2_M1 = [726.35911   0   640-282.73268   0;  0  715.74161   480-245.84829   0;   0 0 1 0];
C2_M1 = [726.35911   0   332.2673   0;  0  715.74161   234.1517   0;   0 0 1 0];
% C2_M2 = [0 0 -1 0; 0.5   -0.866   0   0; -0.866   -0.5   0 L; 0 0 0 1];
C2_M2 = [0 0 1 0; 0.5   -0.866   0   0; -0.866   -0.5   0 L; 0 0 0 1];
fai_x = -pi/100;
Rx = [1, 0, 0, 0; 0, cos(fai_x), sin(fai_x), 0; 0, -sin(fai_x), cos(fai_x), 0; 0, 0, 0, 1];
fai_y = pi/100;
Ry = [cos(fai_y), 0, -sin(fai_y), 0; 0, 1, 0, 0; sin(fai_y), 0, cos(fai_y), 0; 0, 0, 0, 1];
C2_M2 = Ry*Rx*C2_M2;

% C3_M1 = [722.75252   0  322.54501  0; 0 709.26936  259.79649  0;  0 0 1 0];
C3_M1 = [710.75252   0  325.54501  0; 0 705.26936  262.79649  0;  0 0 1 0];
% C3_M2 = [ 0 0 1 0; -0.5  -0.866  0 0;0.866 -0.5 0 L; 0 0 0 1];
C3_M2 = [ 0 0 1 0; 0.5  0.866  0 0; 0.866 -0.5 0 L; 0 0 0 1];
fai_x = -pi/800;
Rx = [1, 0, 0, 0; 0, cos(fai_x), sin(fai_x), 0; 0, -sin(fai_x), cos(fai_x), 0; 0, 0, 0, 1];
fai_y = pi/75;
Ry = [cos(fai_y), 0, -sin(fai_y), 0; 0, 1, 0, 0; sin(fai_y), 0, cos(fai_y), 0; 0, 0, 0, 1];
C3_M2 = Ry*Rx*C3_M2;

C_M1 = [720, 0, 320; 0, 720, 240; 0, 0, 1];
% C1_M2_ = [0 0 1 0; 1 0 0 0; 0 1 0 L; 0 0 0 1];
% C2_M2_ = [0 0 -1 0; 0.5   -0.866   0   0; -0.866   -0.5   0 L; 0 0 0 1];
% C3_M2_ = [ 0 0 1 0; -0.5  -0.866  0 0; 0.866 -0.5 0 L; 0 0 0 1];
C1_M2_ = [0 0 1 0; -1 0 0 0; 0 1 0 L; 0 0 0 1];
C2_M2_ = [0 0 1 0; 0.5   -0.866   0   0; -0.866   -0.5   0 L; 0 0 0 1];
C3_M2_ = [ 0 0 1 0; 0.5  0.866  0 0; 0.866 -0.5 0 L; 0 0 0 1];

global H1 H2 H3;
H1 = C_M1 * C1_M2_(1:3, 1:3) * C1_M2(1:3, 1:3)' * inv(C1_M1(:,1:3));
H2 = C_M1 * C2_M2_(1:3, 1:3) * C2_M2(1:3, 1:3)' * inv(C2_M1(:,1:3));
H3 = C_M1 * C3_M2_(1:3, 1:3) * C3_M2(1:3, 1:3)' * inv(C3_M1(:,1:3));

global P1 P2 P3;
% P1 = C1_M1*C1_M2;
% P2 = C2_M1*C2_M2;
% P3 = C3_M1*C3_M2;
C_M1 = [C_M1, zeros(3,1)];
P1 = C_M1*C1_M2_;
P2 = C_M1*C2_M2_;
P3 = C_M1*C3_M2_;

global coor_c1 coor_c2 coor_c3;
coor_c1 = [ 0, -68 ];
coor_c2 = [ 58.8897, 34 ];
coor_c3 = [ -58.8897, 34 ];

