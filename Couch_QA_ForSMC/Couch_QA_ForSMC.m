function varargout = Couch_QA_ForSMC(varargin)
% COUCH_QA_FORSMC MATLAB code for Couch_QA_ForSMC.fig
%      COUCH_QA_FORSMC, by itself, creates a new COUCH_QA_FORSMC or raises the existing
%      singleton*.
%
%      H = COUCH_QA_FORSMC returns the handle to a new COUCH_QA_FORSMC or the handle to
%      the existing singleton*.
%
%      COUCH_QA_FORSMC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COUCH_QA_FORSMC.M with the given input arguments.
%
%      COUCH_QA_FORSMC('Property','Value',...) creates a new COUCH_QA_FORSMC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Couch_QA_ForSMC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Couch_QA_ForSMC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Couch_QA_ForSMC

% Last Modified by GUIDE v2.5 29-Apr-2015 11:56:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Couch_QA_ForSMC_OpeningFcn, ...
                   'gui_OutputFcn',  @Couch_QA_ForSMC_OutputFcn, ...
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


% --- Executes just before Couch_QA_ForSMC is made visible.
function Couch_QA_ForSMC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Couch_QA_ForSMC (see VARARGIN)

% Choose default command line output for Couch_QA_ForSMC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Couch_QA_ForSMC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Couch_QA_ForSMC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bt_MagnitudeMode.
function bt_MagnitudeMode_Callback(hObject, eventdata, handles)
% hObject    handle to bt_MagnitudeMode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addpath('MagnitudeMode')
CouchQA_Mag;


% --- Executes on button press in bt_GeometryCalibrationMode.
function bt_GeometryCalibrationMode_Callback(hObject, eventdata, handles)
% hObject    handle to bt_GeometryCalibrationMode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addpath('GeometryCalibrionMode')
CouchQA_GUI_Geo;
