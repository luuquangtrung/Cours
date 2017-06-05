# AdvancedSecurity
Practical work on watermarking course with Prof. Mihai Mitrea at Télécom ParisTech

1. Test images (gray-scale, 512x512 pixels): 

		lena.jpg and 
		baboon.jpg 

2. Functions:

		cal_LPF.m to do low-pass filtering
		cal_HPF.m to do high-pass filtering
		mix_image.m to multiplex the original image and the watermark

3. Main codes:

		main.m contains codes for the first part of the TP (DCT, LPF, HPF)
		cdma.m contains codes for the second part (watermark detection)
