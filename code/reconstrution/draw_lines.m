function draw_lines( params )

x = -20:0.1:20;

y1 = params.k1*x + params.bias1;
y2 = params.k2*x + params.bias2;
y3 = params.k3*x + params.bias3;
y4 = params.k4*x + params.bias4;
y5 = params.k5*x + params.bias5;
y6 = params.k6*x + params.bias6;

plot(x, y1, x, y2, x, y3, x, y4, x, y5, x, y6);

end

