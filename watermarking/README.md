# AdvancedSecurity
Travail pratique sur le watermarking avec Prof. Mihai Mitrea à Télécom ParisTech

1. Testes les images (gray-scale, 512x512 pixels): 

		lena.jpg et 
		baboon.jpg 

2. Fonctions de traitement:

		cal_LPF.m pour le filtre passe-basse (low-pass filter)
		cal_HPF.m pour le filtrage passe-haut (high-pass filter)
		mix_image.m pour multiplexer l'image originale et le watermark

3. Codes principaux:

		main.m contient les codes pour la première partie du TP (DCT, LPF, HPF)
		cdma.m contient les codes pour la deuxième partie du TP (detection de watermark)
