function plot_contour(theta)

u = linspace (-1, 1.5, 200);
v = linspace (-1, 1.5, 200);

z = zeros(length(u),length(v));

for i = 1:length(u)
    for j = 1:length(v)
        z(j,i) = map_feature(u(i),v(j))*theta;
    end
end
z = z';
contour(u,v,z,[0,0],'LineWidth',2);