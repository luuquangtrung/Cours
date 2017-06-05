% Function to do low pass filtering
function [img_LP, img_DCT_LP, psnr_LP]  = cal_LPF(i, img_src, img_DCT, f)
    
    img_DCT_LP = zeros(512);
    img_DCT_LP(1:f,1:f) = img_DCT(1:f,1:f);
    img_LP = idct2(img_DCT_LP);
    
    % PSNR
    diff = img_src - img_LP;
    psnr_LP = 10*log10(255*255/var(diff(:),1));
    
    % Plot
    subplot(3,3,i);  
    %subaxis(3,3,i, 'Spacing',0.01,'Margin',0.01); 
    imagesc(img_LP);
    colormap('gray');
    set(gca,'visible','off')
    
end
