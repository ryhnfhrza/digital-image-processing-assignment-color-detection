function restoredImageFinal = RestorasiCitra(RGB)
    % Mengkonversi citra ke grayscale untuk analisis lebih lanjut
    grayRGB = rgb2gray(RGB);

    % Analisis citra untuk mendeteksi noise atau blur
    stdDev = std2(grayRGB); % Menghitung standar deviasi citra

    % Jika standar deviasi sangat rendah = noise tinggi
    if stdDev < 50
        % Deteksi noise -> Gunakan Filter Median
        disp('Citra terdeteksi dengan noise, menggunakan Filter Median.');
        restoredImage = medfilt2(RGB(:,:,1), [3 3]);  % Filter median pada channel R
        restoredImageG = medfilt2(RGB(:,:,2), [3 3]); % Filter median pada channel G
        restoredImageB = medfilt2(RGB(:,:,3), [3 3]); % Filter median pada channel B
        restoredImageFinal = cat(3, restoredImage, restoredImageG, restoredImageB);
    else
        % Jika citra lebih tajam dan tidak terdeteksi noise berat, gunakan Filter Wiener untuk deblurring
        disp('Citra terdeteksi tajam, menggunakan Filter Wiener.');
        restoredImage = wiener2(RGB(:,:,1), [5 5]);  % Filter Wiener pada channel R
        restoredImageG = wiener2(RGB(:,:,2), [5 5]); % Filter Wiener pada channel G
        restoredImageB = wiener2(RGB(:,:,3), [5 5]); % Filter Wiener pada channel B
        restoredImageFinal = cat(3, restoredImage, restoredImageG, restoredImageB);
    end
end
