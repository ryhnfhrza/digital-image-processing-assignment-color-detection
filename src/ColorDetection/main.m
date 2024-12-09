clc; clear; close all; warning off all;

% melakukan pembacaan file citra rgb 
RGB = imread('../Data-Test/bricks toy.jpg');
figure, imshow(RGB);
title('Citra Asli');

% melakukan konversi citra rgb menjadi citra hsv
HSV = rgb2hsv(RGB);
figure, imshow(HSV);
title('Citra dalam format HSV');

% melakukan ekstraksi komponen H dan S dari citra hsv
H = HSV(:,:,1); % Hue
S = HSV(:,:,2); % Saturation

%%
% Deteksi warna merah
bwMerah = DeteksiWarna(HSV, 'merah');
%figure, imshow(bwMerah);
%title('Deteksi Warna Merah');

% Operasi morfologi pada citra biner hasil deteksi
bwMerah = OperasiMorfologi(bwMerah);

% Menampilkan hasil setelah operasi morfologi
%figure, imshow(bwMerah);
%title('Hasil Operasi Morfologi pada Warna Merah');


% Menyusun kembali citra RGB berdasarkan deteksi warna merah
R = RGB(:,:,1); G = RGB(:,:,2); B = RGB(:,:,3);
R(~bwMerah) = 0; G(~bwMerah) = 0; B(~bwMerah) = 0;
Img = cat(3, R, G, B);

% Melakukan restorasi citra
restoredImageFinal = RestorasiCitra(Img);

% Menampilkan citra yang telah direstorasi
figure, imshow(restoredImageFinal);
title('Warna Merah');

%%
% Deteksi warna kuning
bwKuning = DeteksiWarna(HSV, 'kuning');
%figure, imshow(bwKuning);
%title('Deteksi Warna Kuning');

% Operasi morfologi pada citra biner hasil deteksi
bwKuning = OperasiMorfologi(bwKuning);

% Menampilkan hasil setelah operasi morfologi
%figure, imshow(bwKuning);
%title('Hasil Operasi Morfologi pada Warna Kuning');


% Menyusun kembali citra RGB berdasarkan deteksi warna kuning
R = RGB(:,:,1); G = RGB(:,:,2); B = RGB(:,:,3);
R(~bwKuning) = 0; G(~bwKuning) = 0; B(~bwKuning) = 0;
Img = cat(3, R, G, B);

% Melakukan restorasi citra
restoredImageFinal = RestorasiCitra(Img);

% Menampilkan citra yang telah direstorasi
figure, imshow(restoredImageFinal);
title('Warna Kuning');

%%
% Deteksi warna hijau
bwHijau = DeteksiWarna(HSV, 'hijau');
%figure, imshow(bwHijau);
%title('Deteksi Warna Hijau');

% Operasi morfologi pada citra biner hasil deteksi
bwHijau = OperasiMorfologi(bwHijau);

% Menampilkan hasil setelah operasi morfologi
%figure, imshow(bwHijau);
%title('Hasil Operasi Morfologi pada Warna hijau');


% Menyusun kembali citra RGB berdasarkan deteksi warna hijau
R = RGB(:,:,1); G = RGB(:,:,2); B = RGB(:,:,3);
R(~bwHijau) = 0; G(~bwHijau) = 0; B(~bwHijau) = 0;
Img = cat(3, R, G, B);

% Melakukan restorasi citra
restoredImageFinal = RestorasiCitra(Img);

% Menampilkan citra yang telah direstorasi
figure, imshow(restoredImageFinal);
title('Warna Hijau');

%%

% Deteksi warna biru
bwBiru = DeteksiWarna(HSV, 'biru');
%figure, imshow(bwBiru);
%title('Deteksi Warna Biru');

% Operasi morfologi pada citra biner hasil deteksi
bwBiru = OperasiMorfologi(bwBiru);

% Menampilkan hasil setelah operasi morfologi
%figure, imshow(bwBiru);
%title('Hasil Operasi Morfologi pada Warna biru');


% Menyusun kembali citra RGB berdasarkan deteksi warna biru
R = RGB(:,:,1); G = RGB(:,:,2); B = RGB(:,:,3);
R(~bwBiru) = 0; G(~bwBiru) = 0; B(~bwBiru) = 0;
Img = cat(3, R, G, B);

% Melakukan restorasi citra
restoredImageFinal = RestorasiCitra(Img);

% Menampilkan citra yang telah direstorasi
figure, imshow(restoredImageFinal);
title('Warna Biru');


