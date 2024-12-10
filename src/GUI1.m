function varargout = GUI1(varargin)
addpath('path/to/ColorDetection');

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI1_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function GUI1_OpeningFcn(hObject, eventdata, handles, varargin)
addpath('D:\Kuliah\Tugas Semester 5\PCD\DeteksiWarnaPadaRuangHSV\src\ColorDetection');

handles.output = hObject;

guidata(hObject, handles);

function varargout = GUI1_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function popUpMenuColorCallback(hObject, eventdata, handles)

 colors = {'menu','merah', 'kuning', 'hijau', 'biru','cokelat','abu-abu','pink','ungu','oranye'};
    selectedIdx = get(hObject, 'Value');
    disp('Button pressed' + selectedIdx);
    handles.selectedColor = colors{selectedIdx};
    guidata(hObject, handles);

function popUpMenuColorCallback_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function inputButtonCallback(hObject, eventdata, handles)

    disp('Button pressed'); % Debugging
    [filename, pathname] = uigetfile({'*.jpg;*.png;*.jpeg', 'Images (*.jpg, *.png,*.jpeg)'; '*.*', 'All Files'}, 'Select Image');
    if isequal(filename, 0)
        disp('User canceled file selection'); % Debugging
    else
        fullpath = fullfile(pathname, filename);
        disp(['Selected file: ', fullpath]); % Debugging

        RGB = imread(fullpath);

        if size(RGB, 3) == 4
            alphaChannel = RGB(:, :, 4); % Kanal alpha
            RGB = RGB(:, :, 1:3);        % Kanal RGB saja

            % Ganti piksel transparan dengan putih
            for c = 1:3
                channel = RGB(:, :, c);
                channel(alphaChannel == 0) = 255; % Ganti dengan putih
                RGB(:, :, c) = channel;
            end
        end

        if max(RGB(:)) > 1
            RGB = double(RGB) / 255;
            %% 
        end
        
        handles.originalImage = RGB;

        axes(handles.axes1); 
        cla reset;
        set(handles.axes1, 'Color', 'none')
        imshow(handles.originalImage,'Parent', handles.axes1);

        title('Original Image');
        guidata(hObject, handles); 
        disp('Image loaded and displayed'); % Debugging
    end


function pushbutton2_Callback(hObject, eventdata, handles)

function processButtonCallback(hObject, eventdata, handles)
  % Mengecek apakah gambar sudah dipilih
    if ~isfield(handles, 'originalImage') || isempty(handles.originalImage)
        errordlg('Silakan pilih gambar terlebih dahulu!', 'Error');
        return;
    end

    % Mengecek apakah warna telah dipilih dari dropdown (popupmenu1)
    if ~isfield(handles, 'selectedColor') || strcmp(handles.selectedColor, 'Menu')
        errordlg('Silakan pilih warna terlebih dahulu!', 'Error');
        return;
    end

    % Jika semuanya sudah dipilih, lanjutkan proses
    disp('Proses dimulai...');

    % Ambil gambar asli dan konversi ke HSV
    RGB = handles.originalImage;
    HSV = rgb2hsv(RGB);
    selectedColor = handles.selectedColor;

    % Deteksi warna
    bwColor = DeteksiWarna(HSV, selectedColor);

    % Simpan gambar deteksi awal ke dalam cell array
    processSteps = {};  
    processSteps{1} = RGB; % Gambar asli
    processSteps{2} = HSV; % Gambar dalam format HSV
    processSteps{3} = bwColor; % Gambar biner hasil deteksi warna

    % Operasi morfologi
    bwMorphology = OperasiMorfologi(bwColor);
    processSteps{4} = bwMorphology; % Gambar biner setelah operasi morfologi

    % Rekonstruksi gambar berdasarkan deteksi warna
    R = RGB(:, :, 1); G = RGB(:, :, 2); B = RGB(:, :, 3);
    R(~bwMorphology) = 0; G(~bwMorphology) = 0; B(~bwMorphology) = 0;
    detectedImage = cat(3, R, G, B);
    processSteps{5} = detectedImage; % Gambar hasil rekonstruksi warna

    % Panggil RestorasiCitra untuk mengurangi noise atau perbaikan blur
    restoredImageFinal = RestorasiCitra(detectedImage);

    % Tambahkan hasil akhir
    processSteps{6} = restoredImageFinal; % Final processed image

    % Tampilkan hasil di GUI1 pada axes3
    axes(handles.axes3);
    imshow(restoredImageFinal);
    title(['Hasil Deteksi Warna: ' selectedColor]);

    handles.processedSteps = processSteps;
    guidata(hObject, handles);  % Simpan perubahan ke handles

    % Panggil GUI2
    GUI2(handles.processedSteps);
    disp('Proses selesai.');
