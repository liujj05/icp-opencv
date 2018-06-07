% ²âÊÔ´úÂë
clearvars
test_new = [1:2:9; 4:3:16];

theta = rand()*2*pi;
R = [cos(theta), sin(theta); -sin(theta), cos(theta)];
t = [25*rand(); 25*rand()];

test_old = R*test_new + t;

test_old = test_old';
test_new = test_new';

mean_new = mean(test_new);
mean_old = mean(test_old);

AXY = test_new - mean_new;
BXY = test_old - mean_old;

H = AXY' * BXY;
[U,S,V] = svd(H);
R_res = V*[1,0;0,det(V*U')]*U';
t_res = mean_old' - R * mean_new';
