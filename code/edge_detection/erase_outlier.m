function [u_x] = erase_outlier(u_idx, win_width, u_x)

idx = ceil(win_width/2);
for i = (u_idx - idx) : -1 : 2;
    u_dif = sum(u_x(i + idx +1 : i + win_width)) - sum(u_x(i+1 : i + idx-1));
    u_predict = u_x(i) + u_dif/(idx*(idx-1));
    if(abs(u_x(i-1) - u_predict) > 5)
        u_x(i-1) = u_predict;
    end
end
for i = (u_idx + int32(win_width/2)) : 1 : length(u_x) - 1
    u_dif = sum(u_x(i - win_width + 1 : i - idx)) - sum(u_x(i - idx+2 : i));
    u_predict = u_x(i) + u_dif/(idx*(idx-1));
    if(abs(u_x(i+1) - u_predict) > 5)
        u_x(i+1) = u_predict;
    end
end