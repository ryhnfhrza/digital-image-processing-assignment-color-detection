clc; clear; close all; warning off all;

% melakukan pembacaan file citra rgb 
RGB = imread('Data-balon.png');
figure, imshow(RGB);

% melakukan konversi citra rgb menjadi citra hsv
HSV = rgb2hsv(RGB);
figure, imshow(HSV);

% melakukan ekstraksi komponen H dan S dari citra hsv
H = HSV(:,:,1); % Hue
S = HSV(:,:,2); % Saturation

% melakukan deteksi warna merah
[row,column,values] = find ((H < 11/255 & S>50/255) | (H>244/255 & S>50/255));

% menampilkan citra biner hasil deteksi
numind =  size (row,1);
bw = false(size(RGB,1),size(RGB,2));
for i = 1:numind
    bw(row(i),column(i)) = 1;
end

figure, imshow(bw);

% melakukan operasi morfologi
% 1. filling holes
bw = imfill(bw, 'holes');
%figure, imshow(bw); 
% 2. area opening
bw = bwareaopen(bw,1000);
%figure, imshow(bw);

% melakukan ekstraksi komponen rgb
R = RGB (:,:,1); % Red
G = RGB (:,:,2); % Green
B = RGB (:,:,3); % Blue

% mengubah nilai piksel background menjadi nol
R(~bw) = 0;
G(~bw) = 0;
B(~bw) = 0;
Img = cat(3,R,G,B);
figure, imshow(Img);
title('Warna Merah');



% melakukan deteksi warna kuning
[row,column,values] = find (H > 30/255 & H < 54/255 & S > 50/255);

% menampilkan citra biner hasil deteksi
numind =  size (row,1);
bw = false(size(RGB,1),size(RGB,2));
for i = 1:numind
    bw(row(i),column(i)) = 1;
end

figure, imshow(bw);

% melakukan operasi morfologi
% 1. filling holes
bw = imfill(bw, 'holes');
%figure, imshow(bw); 
% 2. area opening
bw = bwareaopen(bw,1000);
%figure, imshow(bw);

% melakukan ekstraksi komponen rgb
R = RGB (:,:,1); % Red
G = RGB (:,:,2); % Green
B = RGB (:,:,3); % Blue

% mengubah nilai piksel background menjadi nol
R(~bw) = 0;
G(~bw) = 0;
B(~bw) = 0;
Img = cat(3,R,G,B);
figure, imshow(Img);
title('Warna Kuning');



% melakukan deteksi warna hijau
[row,column,values] = find (H > 54/255 & H < 116/255 & S > 50/255);

% menampilkan citra biner hasil deteksi
numind =  size (row,1);
bw = false(size(RGB,1),size(RGB,2));
for i = 1:numind
    bw(row(i),column(i)) = 1;
end

figure, imshow(bw);

% melakukan operasi morfologi
% 1. filling holes
bw = imfill(bw, 'holes');
%figure, imshow(bw); 
% 2. area opening
bw = bwareaopen(bw,1000);
%figure, imshow(bw);

% melakukan ekstraksi komponen rgb
R = RGB (:,:,1); % Red
G = RGB (:,:,2); % Green
B = RGB (:,:,3); % Blue

% mengubah nilai piksel background menjadi nol
R(~bw) = 0;
G(~bw) = 0;
B(~bw) = 0;
Img = cat(3,R,G,B);
figure, imshow(Img);
title('Warna Hijau');



% melakukan deteksi warna kuning
[row,column,values] = find (H > 141/255 & H < 185/255 & S > 50/255);

% menampilkan citra biner hasil deteksi
numind =  size (row,1);
bw = false(size(RGB,1),size(RGB,2));
for i = 1:numind
    bw(row(i),column(i)) = 1;
end

figure, imshow(bw);

% melakukan operasi morfologi
% 1. filling holes
bw = imfill(bw, 'holes');
%figure, imshow(bw); 
% 2. area opening
bw = bwareaopen(bw,1000);
%figure, imshow(bw);

% melakukan ekstraksi komponen rgb
R = RGB (:,:,1); % Red
G = RGB (:,:,2); % Green
B = RGB (:,:,3); % Blue

% mengubah nilai piksel background menjadi nol
R(~bw) = 0;
G(~bw) = 0;
B(~bw) = 0;
Img = cat(3,R,G,B);
figure, imshow(Img);
title('Warna Biru');