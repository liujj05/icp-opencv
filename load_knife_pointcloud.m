clearvars
% 载入刀具图片并处理成二维点云

load('C:\Users\jiajun\Documents\MyNutCloud\008-LaserKnife\001-demo\背光源刀具mat数据(人工旋转_反色)\im_pair_canny.mat');

% 密集点云
[idx1_x, idx1_y] = find(im1_canny == 1);
[idx2_x, idx2_y] = find(im2_canny == 1);

% 稀疏点云
sample_step_ref = 5;
sample_step_new = 10;
spars_idx1_x = idx1_x(1:sample_step_ref:end);
spars_idx1_y = idx1_y(1:sample_step_ref:end);
spars_idx2_x = idx2_x(1:sample_step_new:end);
spars_idx2_y = idx2_y(1:sample_step_new:end);

ref_points = [spars_idx1_x, spars_idx1_y];
new_points = [spars_idx2_x, spars_idx2_y];
