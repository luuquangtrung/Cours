function mix = mix_image(i, q1_dct_lp, q2_dct_hp, f)
    
    mix_dct = q2_dct_hp(:,:,i);             % First assign all values by HP coefficients
    mix_dct(1:f,1:f) = q1_dct_lp(1:f,1:f);  % Then assign the first quarter by LP coefficients
    
    mix = idct2(mix_dct);                   % Inverse DCT
    
    % Plot
    subplot(3,3,i);  
    %subaxis(3,3,i, 'Spacing',0.01,'Margin',0.01); 
    imagesc(mix);
    colormap('gray');  set(gca,'visible','off')
end