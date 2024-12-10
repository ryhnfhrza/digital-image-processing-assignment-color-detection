function bw = DeteksiWarna(HSV, warna)
    % Mengambil komponen H dan S
    H = HSV(:,:,1); % Hue
    S = HSV(:,:,2); % Saturation
    V = HSV(:,:,3); % Value (Brightness)

    % Deteksi berdasarkan warna yang diberikan
    if strcmp(warna, 'merah')
        % Deteksi warna merah
        [row, column, values] = find((H < 11/255 & S > 50/255) | (H > 244/255 & S > 50/255));
    elseif strcmp(warna, 'kuning')
        % Deteksi warna kuning
        [row, column, values] = find(H > 30/255 & H < 54/255 & S > 50/255);
    elseif strcmp(warna,'hijau')
        % Deteksi warna hijau
        [row,column,values] = find (H > 54/255 & H < 116/255 & S > 50/255);
    elseif strcmp(warna,'biru')
        % Deteksi warna biru
        [row,column,values] = find (H > 141/255 & H < 185/255 & S > 50/255); 
     elseif strcmp(warna, 'cokelat')
        % Deteksi warna cokelat
        [row, column, values] = find(H > 10/255 & H < 30/255 & S > 0.2 & V > 0.3 & V < 0.7);
    elseif strcmp(warna, 'abu-abu')
        % Deteksi warna abu-abu
        [row, column, values] = find(S < 50/255 & V > 20/255 & V < 80/255);
    elseif strcmp(warna, 'pink')
        % Deteksi warna pink
        [row, column, values] = find(H > 300/360 & H < 340/360 & S > 0.4 & V > 0.6);
    elseif strcmp(warna, 'ungu')
        % Deteksi warna ungu
         [row, column, values] = find((H >= 0.7 & H <= 0.85) & S >= 0.2 & V >= 0.2);
    elseif strcmp(warna, 'oranye')
        % Deteksi warna oranye
        [row, column, values] = find(H > 11/255 & H < 30/255 & S > 50/255 & V > 80/255);
    else
        error('Warna tidak dikenali');
    end

    % Membuat citra biner dari deteksi
    numind = size(row, 1);
    bw = false(size(HSV, 1), size(HSV, 2));
    for i = 1:numind
        bw(row(i), column(i)) = 1;
    end
end
