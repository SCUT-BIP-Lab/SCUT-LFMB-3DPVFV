function [pt] = find_pts(arr, win_width)
tmp = size(arr);
flag = 0;
start_idx = int32(tmp(1)/2) - int32(win_width/2);
if start_idx < 0
    error('Input arguments');
end
while flag == 0
    end_idx = start_idx + win_width;
    test_pts = arr(start_idx : end_idx);
    flag = isuseful(test_pts);
    if flag == 0
        new_idx = start_idx - win_width/2;
        if new_idx < 0
            %pt = 0;
            break;
        end
        start_idx = new_idx;
    end
end

if flag == 0
    start_idx = tmp(1)/2;
end
while flag == 0
    end_idx = start_idx + win_width;
    if(end_idx > tmp(1))
        pt = 0;
        break;
    end
    test_pts = arr(start_idx : end_idx);
    flag = isuseful(test_pts);
    if flag == 0
        start_idx = start_idx + win_width/2;
    end
end
if flag == 1
    pt = start_idx + win_width/2;
end

