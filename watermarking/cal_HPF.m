% Function to do high pass filtering
function [img_HP, img_DCT_HP, psnr_HP]  = cal_HPF(i, img_src, img_DCT, f)

    img_DCT_HP = img_DCT;
    img_DCT_HP(1:f,1:f) = 0;
    img_HP = idct2(img_DCT_HP);

    % PSNR
    diff = img_src - img_HP;
    psnr_HP = 10*log10(255*255/var(diff(:),1));
    
    % Plot
    subplot(3,3,i); 
    %subaxis(3,3,i, 'Spacing',0.01,'Margin',0.01); 
    imagesc(img_HP);
    colormap('gray');
    set(gca,'visible','off')
    
end

