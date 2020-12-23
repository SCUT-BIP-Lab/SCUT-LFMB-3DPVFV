function err = evluate_optimization( x )

global coor_c1 coor_c2 coor_c3;
global k1 k2 k3 k4 k5 k6 bias1 bias2 bias3 bias4 bias5 bias6;
b = x(1); c = x(2); d = x(3); e = x(4); f = x(5);
xc = coor_c1(1); yc = coor_c1(2);
k1_temp =  -(2*((4*f*c^2 - 2*c*d*e + b*d^2 + e^2 - 4*b*f)*(xc^2 + 2*c*xc*yc + d*xc + b*yc^2 + e*yc + f))^(1/2) + 4*c*f - d*e - 2*e*xc + 4*c^2*xc*yc - 2*b*d*yc + 2*c*d*xc + 2*c*e*yc - 4*b*xc*yc)/(- 4*c^2*xc^2 - 4*c*e*xc - e^2 + 4*b*xc^2 + 4*b*d*xc + 4*b*f);
tmp = -(d + e*k1_temp + 2*c*(yc - k1_temp*xc) + 2*b*k1_temp*(yc - k1_temp*xc))/(2*b*k1_temp^2 + 4*c*k1_temp + 2);
p_contact(1,1) = { [ tmp, k1_temp*(tmp-xc) + yc ] }; % 求切点
k2_temp = (2*((4*f*c^2 - 2*c*d*e + b*d^2 + e^2 - 4*b*f)*(xc^2 + 2*c*xc*yc + d*xc + b*yc^2 + e*yc + f))^(1/2) - 4*c*f + d*e + 2*e*xc - 4*c^2*xc*yc + 2*b*d*yc - 2*c*d*xc - 2*c*e*yc + 4*b*xc*yc)/(- 4*c^2*xc^2 - 4*c*e*xc - e^2 + 4*b*xc^2 + 4*b*d*xc + 4*b*f);
tmp = -(d + e*k2_temp + 2*c*(yc - k2_temp*xc) + 2*b*k2_temp*(yc - k2_temp*xc))/(2*b*k2_temp^2 + 4*c*k2_temp + 2);
p_contact(1,2) = { [ tmp, k2_temp*(tmp-xc) + yc ] }; % 求切点

xc = coor_c2(1); yc = coor_c2(2);
k3_temp =  -(2*((4*f*c^2 - 2*c*d*e + b*d^2 + e^2 - 4*b*f)*(xc^2 + 2*c*xc*yc + d*xc + b*yc^2 + e*yc + f))^(1/2) + 4*c*f - d*e - 2*e*xc + 4*c^2*xc*yc - 2*b*d*yc + 2*c*d*xc + 2*c*e*yc - 4*b*xc*yc)/(- 4*c^2*xc^2 - 4*c*e*xc - e^2 + 4*b*xc^2 + 4*b*d*xc + 4*b*f);
tmp = -(d + e*k3_temp + 2*c*(yc - k3_temp*xc) + 2*b*k3_temp*(yc - k3_temp*xc))/(2*b*k3_temp^2 + 4*c*k3_temp + 2);
p_contact(2,1) = { [ tmp, k3_temp*(tmp-xc) + yc ] }; % 求切点
k4_temp = (2*((4*f*c^2 - 2*c*d*e + b*d^2 + e^2 - 4*b*f)*(xc^2 + 2*c*xc*yc + d*xc + b*yc^2 + e*yc + f))^(1/2) - 4*c*f + d*e + 2*e*xc - 4*c^2*xc*yc + 2*b*d*yc - 2*c*d*xc - 2*c*e*yc + 4*b*xc*yc)/(- 4*c^2*xc^2 - 4*c*e*xc - e^2 + 4*b*xc^2 + 4*b*d*xc + 4*b*f);
tmp = -(d + e*k4_temp + 2*c*(yc - k4_temp*xc) + 2*b*k4_temp*(yc - k4_temp*xc))/(2*b*k4_temp^2 + 4*c*k4_temp + 2);
p_contact(2,2) = { [ tmp, k4_temp*(tmp-xc) + yc ] }; % 求切点

xc = coor_c3(1); yc = coor_c3(2);
k5_temp =  -(2*((4*f*c^2 - 2*c*d*e + b*d^2 + e^2 - 4*b*f)*(xc^2 + 2*c*xc*yc + d*xc + b*yc^2 + e*yc + f))^(1/2) + 4*c*f - d*e - 2*e*xc + 4*c^2*xc*yc - 2*b*d*yc + 2*c*d*xc + 2*c*e*yc - 4*b*xc*yc)/(- 4*c^2*xc^2 - 4*c*e*xc - e^2 + 4*b*xc^2 + 4*b*d*xc + 4*b*f);
tmp = -(d + e*k5_temp + 2*c*(yc - k5_temp*xc) + 2*b*k5_temp*(yc - k5_temp*xc))/(2*b*k5_temp^2 + 4*c*k5_temp + 2);
p_contact(3,1) = { [ tmp, k5_temp*(tmp-xc) + yc ] }; % 求切点
k6_temp = (2*((4*f*c^2 - 2*c*d*e + b*d^2 + e^2 - 4*b*f)*(xc^2 + 2*c*xc*yc + d*xc + b*yc^2 + e*yc + f))^(1/2) - 4*c*f + d*e + 2*e*xc - 4*c^2*xc*yc + 2*b*d*yc - 2*c*d*xc - 2*c*e*yc + 4*b*xc*yc)/(- 4*c^2*xc^2 - 4*c*e*xc - e^2 + 4*b*xc^2 + 4*b*d*xc + 4*b*f);
tmp = -(d + e*k6_temp + 2*c*(yc - k6_temp*xc) + 2*b*k6_temp*(yc - k6_temp*xc))/(2*b*k6_temp^2 + 4*c*k6_temp + 2);
p_contact(3,2) = { [ tmp, k6_temp*(tmp-xc) + yc ] }; % 求切点

% 计算切点到约束线的距离
p = p_contact{1, 1};  x0 = p(1);  y0 = p(2);
d1 = (k1 * x0 - y0 + bias1) / sqrt(k1^2 + 1);
% disp(p);
% disp(k1);
% disp(bias1);
% disp(d1);
d1 = abs(d1);

p = p_contact{1, 2};  x0 = p(1);  y0 = p(2);
d2 = (k2 * x0 - y0 + bias2) / sqrt(k2^2 + 1);
% disp(p);
% disp(k2);
% disp(bias2);
% disp(d2);
d2 = abs(d2);

p = p_contact{2, 1};  x0 = p(1);  y0 = p(2);
d3 = (k3 * x0 - y0 + bias3) / sqrt(k3^2 + 1);
% disp(p);
% disp(k3);
% disp(bias3);
% disp(d3);
d3 = abs(d3);

p = p_contact{2, 2};  x0 = p(1);  y0 = p(2);
d4 = (k4 * x0 - y0 + bias4) / sqrt(k4^2 + 1);
% disp(p);
% disp(k4);
% disp(bias4);
% disp(d4);
d4 = abs(d4);

p = p_contact{3, 1};  x0 = p(1);  y0 = p(2);
d5 = (k5 * x0 - y0 + bias5) / sqrt(k5^2 + 1);
% disp(p);
% disp(k5);
% disp(bias5);
% disp(d5);
d5 = abs(d5);

p = p_contact{3, 2};  x0 = p(1);  y0 = p(2);
d6 = (k6 * x0 - y0 + bias6) / sqrt(k6^2 + 1);
% disp(p);
% disp(k6);
% disp(bias6);
% disp(d6);
d6 = abs(d6);

err = d1 + d2 + d3 + d4 + d5 + d6;


end

