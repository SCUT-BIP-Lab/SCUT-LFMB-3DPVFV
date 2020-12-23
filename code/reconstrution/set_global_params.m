function set_global_params( param )

% param是一个cell，里面按照顺序保存了21个struct

% 后面的编号表示第几个边缘
global k1 bias1 k2 bias2 k3 bias3 k4 bias4 k5 bias5 k6 bias6;
global init_center_x init_center_y init_radius;

k1 = [];  bias1 = [];  k2 = [];  bias2 = [];  k3 = [];  bias3 = [];
k4 = [];  bias4 = [];  k5 = [];  bias5 = [];  k6 = [];  bias6 = [];
init_center_x = [];  init_center_y = [];  init_radius = [];
for i = 1:size(param, 2)
    k1 = [k1, param{i}.k1];  bias1 = [bias1, param{i}.bias1];
    k2 = [k2, param{i}.k2];  bias2 = [bias2, param{i}.bias2];
    k3 = [k3, param{i}.k3];  bias3 = [bias3, param{i}.bias3];
    k4 = [k4, param{i}.k4];  bias4 = [bias4, param{i}.bias4];
    k5 = [k5, param{i}.k5];  bias5 = [bias5, param{i}.bias5];
    k6 = [k6, param{i}.k6];  bias6 = [bias6, param{i}.bias6];
    
    init_center_x = [init_center_x, param{i}.init_center_x];
    init_center_y = [init_center_y, param{i}.init_center_y];
    init_radius = [init_radius, param{i}.init_radius];
end


end

