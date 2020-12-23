function [avgValue] = avgBright(src, upper, bottom)
global min_y max_y
upper = int32(round(upper));
bottom = int32(round(bottom));
wid = max_y - min_y + 1;
sumValue = 0;
sumPix = 0;
%[upper, bottom] = findContours(bsrc);
for i = 1 : wid
    sumValue = sumValue + sum(src(upper(i) : bottom(i), min_y + i - 1));
    sumPix = sumPix + (bottom(i) - upper(i) + 1);
end
avgValue = sumValue / sumPix;
