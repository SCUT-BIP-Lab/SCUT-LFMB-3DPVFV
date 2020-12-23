function flag = isuseful(test_x)
thre = 6;
tmp = size(test_x);
flag = 1;
dx = test_x(2:tmp(1)) - test_x(1:tmp(1)-1);
if sum(abs(dx) - thre) > 0
    flag = 0;
end