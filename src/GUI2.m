function varargout = GUI2(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI2_OutputFcn, ...
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


function GUI2_OpeningFcn(hObject, eventdata, handles,varargin)
    handles.output = hObject;

    % Periksa apakah ada data yang diteruskan melalui varargin
    if ~isempty(varargin)
        processSteps = varargin{1}; % Ambil data yang diteruskan

        % Tampilkan gambar proses pada masing-masing axes
        axes(handles.axes1);
        imshow(processSteps{1}); % Gambar asli
        title('Gambar Asli');

        axes(handles.axes2);
        imshow(processSteps{2}); % Gambar dalam format HSV
        title('Gambar HSV');

        axes(handles.axes3);
        imshow(processSteps{3}); % Gambar biner hasil deteksi warna
        title('Deteksi Warna');

        axes(handles.axes4);
        imshow(processSteps{4}); % Gambar setelah operasi morfologi
        title('Operasi Morfologi');

        axes(handles.axes5);
        imshow(processSteps{5}); % Gambar hasil rekonstruksi warna
        title('Rekonstruksi Warna');

        axes(handles.axes6);
        imshow(processSteps{6}); % Final processed image
        title('Hasil Akhir');

        % Simpan data ke handles
        handles.processedSteps = processSteps;
    else
        % Jika tidak ada data, tampilkan alert
        errordlg('Tidak ada data yang diteruskan ke GUI2!', 'Error');
    end

    % Simpan handles
    guidata(hObject, handles);


function varargout = GUI2_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles) 


% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_16_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_17_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_18_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
