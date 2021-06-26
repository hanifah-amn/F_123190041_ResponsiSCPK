function varargout = F_123190041_ResponsiSCPK(varargin)
% F_123190041_RESPONSISCPK MATLAB code for F_123190041_ResponsiSCPK.fig
%      F_123190041_RESPONSISCPK, by itself, creates a new F_123190041_RESPONSISCPK or raises the existing
%      singleton*.
%
%      H = F_123190041_RESPONSISCPK returns the handle to a new F_123190041_RESPONSISCPK or the handle to
%      the existing singleton*.
%
%      F_123190041_RESPONSISCPK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in F_123190041_RESPONSISCPK.M with the given input arguments.
%
%      F_123190041_RESPONSISCPK('Property','Value',...) creates a new F_123190041_RESPONSISCPK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before F_123190041_ResponsiSCPK_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to F_123190041_ResponsiSCPK_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help F_123190041_ResponsiSCPK

% Last Modified by GUIDE v2.5 26-Jun-2021 07:47:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @F_123190041_ResponsiSCPK_OpeningFcn, ...
                   'gui_OutputFcn',  @F_123190041_ResponsiSCPK_OutputFcn, ...
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


% --- Executes just before F_123190041_ResponsiSCPK is made visible.
function F_123190041_ResponsiSCPK_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to F_123190041_ResponsiSCPK (see VARARGIN)

% Choose default command line output for F_123190041_ResponsiSCPK
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes F_123190041_ResponsiSCPK wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = F_123190041_ResponsiSCPK_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%memasukkan dataset
ds = dataset('XLSFile','DATA RUMAH.xlsx');
ds.NAMARUMAH = [];

ds2 = ds; %data untuk diproses
ds2.NO = [];

%memasukkan nilai atribut -> 0=cost, 1=benefit
k = [0,1,1,1,1,1];

%memasukkan bobot kriteria
w = [0.30, 0.20, 0.23, 0.10, 0.07, 0.10];

%normalisasi matriks
[m n] = size(ds2);
%matriks kosong, untuk hasil normalisasi
R = zeros(m,n); 
for j=1:n
    if k(j)==1
        R(:,j)=ds2(:,j)./max(ds2(:,j));
    else
        R(:,j)=min(ds2(:,j))./ds2(:,j);
    end
end

%proses pemeringkatan
na=0;
s=0;

for i=1:m
    V(i)=sum(w.*R(i,:))
    if V(i)>na
        na=V(i);
        s=i;
    end
end

form = guidata(gcbo);
set(form.tabelRumah,'data',ds(1:20,:));


% --- Executes when selected cell(s) is changed in tabelRumah.
function tabelRumah_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to tabelRumah (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
