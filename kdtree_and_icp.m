% Step 2

% 生成 k-d tree
Mdl = KDTreeSearcher(ref_points);

nb_point_new = length(new_points);

input_correlation_new = new_points;
input_correlation_old = zeros(nb_point_new, 2);

iter_num = 30;
figure;
hold off;

for j=1:1:iter_num

    % 绘制当前ref和new
    plot(ref_points(:,1), ref_points(:,2), 'ob');
    hold on;
    plot(input_correlation_new(:,1), input_correlation_new(:,2), 'xr');
    axis equal
    xlim([0,450]);
    ylim([0,450]);
    pause(0.5)

    
    for i=1:1:nb_point_new
        res_index = knnsearch(Mdl, input_correlation_new(i,:));
        input_correlation_old(i,:) = ref_points(res_index, :); 
        plot(input_correlation_old(i,1), input_correlation_old(i,2), '+b');
        plot([input_correlation_old(i,1), input_correlation_new(i,1)], [input_correlation_old(i,2), input_correlation_new(i,2)], '-b');
    end

    hold off;
    pause(0.5)
    
    % 求出旋转R 平移t 分量
    mean_new = mean(input_correlation_new);
    mean_old = mean(input_correlation_old);

    AXY = input_correlation_new - mean_new;
    BXY = input_correlation_old - mean_old;

    H = AXY' * BXY;
    [U,S,V] = svd(H);
    R = V*[1,0;0,det(V*U')]*U';
    t = mean_old' - R * mean_new';

    input_correlation_new = (R*input_correlation_new' + t)';

    

    plot(ref_points(:,1), ref_points(:,2), 'ob');
    hold on;
    plot(input_correlation_new(:,1), input_correlation_new(:,2), 'xr');
    hold off;
    
    axis equal
    xlim([0,450]);
    ylim([0,450]);
    
    pause(0.5);
end