function bw = OperasiMorfologi(bw)
    % Mengisi lubang dalam objek biner
    bw = imfill(bw, 'holes');
    
    % Menghapus objek kecil berdasarkan ukuran area
    bw = bwareaopen(bw, 1000);
end
