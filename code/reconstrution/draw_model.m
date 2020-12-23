function [x_3D, y_3D, z_3D] = draw_model( z_arr, X )

% global en_show;
en_show = 1;

N = size(z_arr, 2);
tmp_x = []; 
tmp_y = []; 
tmp_z = [];

for i = 1:1:N
    x = X(:, i);
    alpha = atan(2*x(2)/(x(1)-1)) / 2;
    if alpha > pi / 4
        alpha = pi/2 - alpha;
    else if alpha<-pi/4
            alpha = -pi/2 - alpha;
        end
    end
    
    % 求解椭圆中心点坐标
    x0 = (x(1)*x(3) - x(2)*x(4)) / (-x(2)^2 + x(1));
    y0 = (x(4)-x(2)*x(3)) / (-x(2)^2 + x(1));
    x0 = x0 / 2; 
    y0 = y0 / 2;
    
    % 椭圆中心坐标
    tmp_x = [tmp_x, x0];
    tmp_y = [tmp_y, -y0];
    tmp_z = [tmp_z, z_arr(i)];
    
    aa = cos(alpha)*(cos(alpha) - x(2)*sin(alpha)) - sin(alpha)*(x(2)*cos(alpha) - x(1)*sin(alpha));
    bb = cos(alpha)*(x(1)*cos(alpha) + x(2)*sin(alpha)) + sin(alpha)*(sin(alpha) + x(2)*cos(alpha));
    ff = x(5) + y0*(x(1)*y0 - x(4) + x(2)*x0) + x0*(x0 - x(3) + x(2)*y0) - y0*(x(2)*cos(alpha) - x(1)*sin(alpha)) - x0*(cos(alpha) - x(2)*sin(alpha)) - y0*(x(1)*cos(alpha) + x(2)*sin(alpha)) - x0*(sin(alpha) + x(2)*cos(alpha));
    
    rx = sqrt(-ff/aa);
    ry = sqrt(-ff/bb);
    
    t = 0:2*pi/200:(2*pi-pi/100);
    x_normal = rx*cos(t);
    y_normal = ry*sin(t);
    
    T = [cos(alpha), sin(alpha), -x0; -sin(alpha), cos(alpha), -y0; 0, 0, 1];
    coor_real(:, :, i) = T*[x_normal; y_normal; ones(1, size(x_normal, 2))];
end

x_3D = coor_real(1,:,:);
x_3D = reshape(x_3D, size(x_3D, 2), size(x_3D, 3));
y_3D = coor_real(2,:,:);
y_3D = reshape(y_3D, size(y_3D, 2), size(y_3D, 3));
z_3D = [ones(1, 200)]' * z_arr;

if en_show
    figure();
    mesh(x_3D, y_3D, z_3D);
end

end

