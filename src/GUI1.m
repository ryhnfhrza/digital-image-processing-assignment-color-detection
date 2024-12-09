function varargout = GUI1(varargin)
addpath('path/to/ColorDetection');
% GUI1 MATLAB code for GUI1.fig
%      GUI1, by itself, creates a new GUI1 or raises the existing
%      singleton*.
%
%      H = GUI1 returns the handle to a new GUI1 or the handle to
%      the existing singleton*.
%
%      GUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI1.M with the given input arguments.
%
%      GUI1('Property','Value',...) creates a new GUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI1

% Last Modified by GUIDE v2.5 09-Dec-2024 21:48:00

% Begin initialization code - DO NOT EDIT
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
% End initialization code - DO NOT EDIT


% --- Executes just before GUI1 is made visible.
function GUI1_OpeningFcn(hObject, eventdata, handles, varargin)
addpath('D:\Kuliah\Tugas Semester 5\PCD\DeteksiWarnaPadaRuangHSV\src\ColorDetection');

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI1 (see VARARGIN)

% Choose default command line output for GUI1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popUpMenuColorCallback.
function popUpMenuColorCallback(hObject, eventdata, handles)
% hObject    handle to popUpMenuColorCallback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popUpMenuColorCallback contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popUpMenuColorCallback
 colors = {'menu','merah', 'kuning', 'hijau', 'biru'};
    selectedIdx = get(hObject, 'Value');
    disp('Button pressed' + selectedIdx);
    handles.selectedColor = colors{selectedIdx};
    guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function popUpMenuColorCallback_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popUpMenuColorCallback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in inputButtonCallback.
function inputButtonCallback(hObject, eventdata, handles)
% hObject    handle to inputButtonCallback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    disp('Button pressed'); % Debugging
    [filename, pathname] = uigetfile({'*.jpg;*.png', 'Images (*.jpg, *.png)'; '*.*', 'All Files'}, 'Select Image');
    if isequal(filename, 0)
        disp('User canceled file selection'); % Debugging
    else
        fullpath = fullfile(pathname, filename);
        disp(['Selected file: ', fullpath]); % Debugging
        handles.imagePath = fullpath;
        handles.originalImage = imread(fullpath);
        axes(handles.axes1); % Ensure this is the correct tag for your axes
        imshow(handles.originalImage);

        title('Original Image');
        guidata(hObject, handles); % Save changes to handles
        disp('Image loaded and displayed'); % Debugging
    end



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in processButtonCallback.
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
    processSteps = {};  % Pastikan ini adalah cell array yang kosong
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

    % Simpan data ke handles dan panggil GUI2 tanpa argumen tambahan
    handles.processedSteps = processSteps;
    guidata(hObject, handles);  % Simpan perubahan ke handles

    % Panggil GUI2
    GUI2(handles.processedSteps);
    disp('Proses selesai.');

% hObject    handle to processButtonCallback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
