clc
clear all; close all;

%% Sources: 512x512 gray images Lena and Baboon
lena = imread('lena.jpg');
lena = double(lena);

baboon = imread('baboon.jpg');
baboon = double(baboon);
baboon = baboon(:,:,1);

figure(1); colormap('gray'); 
subplot(2,2,1); imagesc(lena);      set(gca,'visible','off')
subplot(2,2,2); imagesc(baboon);    set(gca,'visible','off')


%% Compute DCT
lena_dct = dct2(lena);
baboon_dct = dct2(baboon);

subplot(2,2,3); imagesc(lena_dct);
subplot(2,2,4); imagesc(baboon_dct);

fc = [256,128,64,32,16,8,4];

%% Low Pass Filter
PSNR_lena_lp = zeros(1,7);
PSNR_baboon_lp = zeros(1,7);
lena_dct_lp = zeros(512,512,7);
baboon_dct_lp = zeros(512,512,7);

% Lena
figure;
for i=1:7
    [lena_lp, lena_dct_lp(:,:,i), PSNR_lena_lp(i)]  = cal_LPF(i, lena, lena_dct, fc(i));
    hold on;
end
hold off;

% Baboon
figure;
for i=1:7
    [baboon_lp, baboon_dct_lp(:,:,i), PSNR_baboon_lp(i)]  = cal_LPF(i, baboon, baboon_dct, fc(i));
    hold on;
end
hold off;

%% High Pass Filter

PSNR_lena_hp = zeros(1,7);
PSNR_baboon_hp = zeros(1,7);
lena_dct_hp = zeros(512,512,7);
baboon_dct_hp = zeros(512,512,7);

% Lena
figure;
for i=1:7
    [lena_lp, lena_dct_hp(:,:,i), PSNR_lena_hp(i)]  = cal_HPF(i, lena, lena_dct, fc(i));
    hold on;
end
hold off;

% Baboon
figure;
for i=1:7
    [baboon_lp, baboon_dct_hp(:,:,i), PSNR_baboon_hp(i)]  = cal_HPF(i, baboon, baboon_dct, fc(i));
    hold on;
end
hold off;

%% Compute PSNR

figure;
p1 = plot(fc, PSNR_lena_lp,'k-o','MarkerFaceColor', 'auto');    hold on;
p2 = plot(fc, PSNR_lena_hp,'b-v','MarkerFaceColor', 'auto');    hold on;
p3 = plot(fc, PSNR_baboon_lp,'r--s','MarkerFaceColor', 'auto'); hold on;
p4 = plot(fc, PSNR_baboon_hp,'g--^','MarkerFaceColor', 'auto'); hold off;

legend('lena\_lp','lena\_hp','baboon\_lp','baboon\_hp','Location','northwest');
xlim([4;256]);

%% Mixed images

% Case 1: mix1 = 1/4 Lena (low-pass) + 3/4 Baboon (high-pass)
figure;
for i=1:7
    mix1 = mix_image(i, lena_dct_lp, baboon_dct_hp, fc(i));
    hold on;
end
hold off;

% Case 2: mix2 = 1/4 Baboon (low-pass) + 3/4 Lena (high-pass)
figure;
for i=1:7
    mix2 = mix_image(i, baboon_dct_lp, lena_dct_hp, fc(i));
    hold on;
end
hold off;

