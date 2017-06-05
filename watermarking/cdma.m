clc
clear all; close all;

%% CDMA
T = 1000;
x = randn(1,T);

figure;
subplot(2,2,1); plot(x);
subplot(2,2,2); hist(x);

y = 2*randn(1,T) + 3; 
subplot(2,2,3); plot(y);
subplot(2,2,4); hist(y);

z = x+y;
figure; 
subplot(2,1,1); plot(z);
subplot(2,1,2); hist(z);

figure;
subplot(2,3,1); plot(xcorr(x,x));   % correlation btw 2 vectors
subplot(2,3,2); plot(xcorr(y,y));
subplot(2,3,3); plot(xcorr(z,z));
subplot(2,3,4); plot(xcorr(x,y));
subplot(2,3,5); plot(xcorr(x,z));
subplot(2,3,6); plot(xcorr(y,z));

%% Signal multiplexing (image + watermark)

clear all; close all;

M = zeros(100,100);
T = linspace(100,10000,100);
alpha = linspace(0.1,10,100);

for i=1:length(T)
    for j=1:length(alpha)
        x = randn(1,T(i));
        n = alpha(j)*randn(1,T(i));
        r = x+n;
        M(i,j) = max(xcorr(x,r))/(sqrt(sum(x.^2)*sum(r.^2)));
    end
end

p = surf(T,alpha,M);				% 3D-plot of M 
xlim([100 10000]);
ylim([0.1 10]);
xlabel('T');
ylabel('alpha');
zlabel('M');

axis vis3d tight, box on, grid on	% set axes props
camproj perspective                 % use perspective projection