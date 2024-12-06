function bw = DeteksiWarna(HSV, warna)
    % Mengambil komponen H dan S
    H = HSV(:,:,1); % Hue
    S = HSV(:,:,2); % Saturation

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
