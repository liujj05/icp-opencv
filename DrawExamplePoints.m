% Step 1

clearvars
close all
% 画出Example中的两个二维点云

% 尽量做到与原example_simple.cpp中的变量名称一一对应

num_pts = 200;
norm = 200;
a = 0:1:(num_pts-1);
a = a*2*pi/num_pts;

xx = norm/2*cos(a);
yy = norm*sin(a);

x = xx *   cos(pi/4)  + yy * sin(pi/4) + 250;
y = xx * (-sin(pi/4)) + yy * cos(pi/4) + 250;

ref_points = [x;y];
ref_points = ref_points';
figure
hold on
plot(x,y,'ob');
axis equal

num_pts = num_pts/5;
a = 0:1:(num_pts-1);
a = a*2*pi/num_pts;

xx = norm/1.9 * cos(a);
yy = norm/1.1 * sin(a);

x = xx *   cos(-pi/8)  + yy * sin(-pi/8) + 150;
y = xx * (-sin(-pi/8)) + yy * cos(-pi/8) + 250;

new_points = [x;y];
new_points = new_points';
plot(x,y,'xr');
axis equal