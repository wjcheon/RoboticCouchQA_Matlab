function varargout = CouchQA_GUI_Geo(varargin)
% COUCHQA_GUI_GEO MATLAB code for CouchQA_GUI_Geo.fig
%      COUCHQA_GUI_GEO, by itself, creates a new COUCHQA_GUI_GEO or raises the existing
%      singleton*.
%
%      H = COUCHQA_GUI_GEO returns the handle to a new COUCHQA_GUI_GEO or the handle to
%      the existing singleton*.
%
%      COUCHQA_GUI_GEO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COUCHQA_GUI_GEO.M with the given input arguments.
%
%      COUCHQA_GUI_GEO('Property','Value',...) creates a new COUCHQA_GUI_GEO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CouchQA_GUI_Geo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CouchQA_GUI_Geo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CouchQA_GUI_Geo

% Last Modified by GUIDE v2.5 30-Apr-2015 13:44:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CouchQA_GUI_Geo_OpeningFcn, ...
                   'gui_OutputFcn',  @CouchQA_GUI_Geo_OutputFcn, ...
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


% --- Executes just before CouchQA_GUI_Geo is made visible.
function CouchQA_GUI_Geo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CouchQA_GUI_Geo (see VARARGIN)

% Choose default command line output for CouchQA_GUI_Geo
handles.output = hObject;



CounterBtTakeDistance =0;
handles.CounterBtTakeDistance = CounterBtTakeDistance;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CouchQA_GUI_Geo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CouchQA_GUI_Geo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in rd_IsocentricRotation.
function rd_IsocentricRotation_Callback(hObject, eventdata, handles)
% hObject    handle to rd_IsocentricRotation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rd_IsocentricRotation


% --- Executes on button press in rd_maximumLoad.
function rd_maximumLoad_Callback(hObject, eventdata, handles)
% hObject    handle to rd_maximumLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rd_maximumLoad


% --- Executes on button press in bt_SetRefer.
function bt_SetRefer_Callback(hObject, eventdata, handles)
% hObject    handle to bt_SetRefer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    ViconRealTimeSDK_WJ;
    marker1 = BufferForSave(:,1:3);
    marker2 = BufferForSave(:,4:6);
    marker3 = BufferForSave(:,7:9);
    marker4 = BufferForSave(:,10:12);
    iter_sz = size(BufferForSave,1);
    sub_iter = 0;
    for iter = 1: iter_sz
        if(BufferForSave(iter,1)~=0)
            sub_iter = sub_iter+1;
            CoordiMarker1(sub_iter,1:3) = marker1(iter,1:3);
            CoordiMarker2(sub_iter,1:3) = marker2(iter,1:3);
            CoordiMarker3(sub_iter,1:3) = marker3(iter,1:3);
            CoordiMarker4(sub_iter,1:3) = marker4(iter,1:3);
            
        end
    end
    
    ave_CoordiMarker1 = mean(CoordiMarker1,1);
    ave_CoordiMarker2 = mean(CoordiMarker2,1);
    ave_CoordiMarker3 = mean(CoordiMarker3,1);
    ave_CoordiMarker4 = mean(CoordiMarker4,1);
    
    
    handles.ave_CoordiMarker1 = [];
    handles.ave_CoordiMarker2 = [];
    handles.ave_CoordiMarker3 = [];
    handles.ave_CoordiMarker4 = [];
    
    if (isempty(handles.ave_CoordiMarker1)==0)
        field = 'ave_CoordiMarker1';
        handles = rmfield(handles,field)
    end
   
    if (isempty(handles.ave_CoordiMarker2)==0)
        field = 'ave_CoordiMarker2';
        handles = rmfield(handles,field)
    end
    
    if (isempty(handles.ave_CoordiMarker3)==0)
        field = 'ave_CoordiMarker3';
        handles = rmfield(handles,field)
    end
    
    if (isempty(handles.ave_CoordiMarker4)==0)
        field = 'ave_CoordiMarker4';
        handles = rmfield(handles,field)
    end
    
        
    handles.ave_CoordiMarker1 = ave_CoordiMarker1;
    handles.ave_CoordiMarker2 = ave_CoordiMarker2;
    handles.ave_CoordiMarker3 = ave_CoordiMarker3;
    handles.ave_CoordiMarker4 = ave_CoordiMarker4;
    
    set(handles.edit_RefX,'String',ave_CoordiMarker1(1));
    set(handles.edit_RefY,'String',ave_CoordiMarker1(2));
    set(handles.edit_RefZ,'String',ave_CoordiMarker1(3));
    
    set(handles.edit_RefX2,'String',ave_CoordiMarker2(1));
    set(handles.edit_RefY2,'String',ave_CoordiMarker2(2));
    set(handles.edit_RefZ2,'String',ave_CoordiMarker2(3));
    
    set(handles.edit_RefX3,'String',ave_CoordiMarker3(1));
    set(handles.edit_RefY3,'String',ave_CoordiMarker3(2));
    set(handles.edit_RefZ3,'String',ave_CoordiMarker3(3));
    
    set(handles.edit_RefX4,'String',ave_CoordiMarker4(1));
    set(handles.edit_RefY4,'String',ave_CoordiMarker4(2));
    set(handles.edit_RefZ4,'String',ave_CoordiMarker4(3));
    
    guidata(hObject, handles);
    





% --- Executes on button press in bt_SetPostRefCoordi.
function bt_SetPostRefCoordi_Callback(hObject, eventdata, handles)
% hObject    handle to bt_SetPostRefCoordi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    ViconRealTimeSDK_WJ;
    Postmarker1 = BufferForSave(:,1:3);
    Postmarker2 = BufferForSave(:,4:6);
    Postmarker3 = BufferForSave(:,7:9);
    Postmarker4 = BufferForSave(:,10:12);
    iter_sz = size(BufferForSave,1);
    sub_iter = 0;
    for iter = 1: iter_sz
        if(BufferForSave(iter,1)~=0)
            sub_iter = sub_iter+1;
            PostCoordiMarker1(sub_iter,1:3) = Postmarker1(iter,1:3);
            PostCoordiMarker2(sub_iter,1:3) = Postmarker2(iter,1:3);
            PostCoordiMarker3(sub_iter,1:3) = Postmarker3(iter,1:3);
            PostCoordiMarker4(sub_iter,1:3) = Postmarker4(iter,1:3);
            
        end
    end
    
      
    handles.ave_PostCoordiMarker1 = [];
    handles.ave_PostCoordiMarker2 = [];
    handles.ave_PostCoordiMarker3 = [];
    handles.ave_PostCoordiMarker4 = [];
    
    if (isempty(handles.ave_PostCoordiMarker1)==0)
        field = 'ave_PostCoordiMarker1';
        handles = rmfield(handles,field)
    end
    
    if (isempty(handles.ave_PostCoordiMarker2)==0)
        field = 'ave_PostCoordiMarker2';
        handles = rmfield(handles,field)
    end
    
    if (isempty(handles.ave_PostCoordiMarker3)==0)
        field = 'ave_PostCoordiMarker3';
        handles = rmfield(handles,field)
    end
    
    if (isempty(handles.ave_PostCoordiMarker4)==0)
        field = 'ave_PostCoordiMarker4';
        handles = rmfield(handles,field)
    end
    
    
    
    ave_PostCoordiMarker1 = mean(PostCoordiMarker1,1);
    ave_PostCoordiMarker2 = mean(PostCoordiMarker2,1);
    ave_PostCoordiMarker3 = mean(PostCoordiMarker3,1);
    ave_PostCoordiMarker4 = mean(PostCoordiMarker4,1);
    
    handles.ave_PostCoordiMarker1 = ave_PostCoordiMarker1;
    handles.ave_PostCoordiMarker2 = ave_PostCoordiMarker2;
    handles.ave_PostCoordiMarker3 = ave_PostCoordiMarker3;
    handles.ave_PostCoordiMarker4 = ave_PostCoordiMarker4;
    
    
%     marker1
    set(handles.edit_PostRefX,'String',ave_PostCoordiMarker1(1));
    set(handles.edit_PostRefY,'String',ave_PostCoordiMarker1(2));
    set(handles.edit_PostRefZ,'String',ave_PostCoordiMarker1(3));
    
%     marker2
    set(handles.edit_PostRefX2,'String',ave_PostCoordiMarker2(1));
    set(handles.edit_PostRefY2,'String',ave_PostCoordiMarker2(2));
    set(handles.edit_PostRefZ2,'String',ave_PostCoordiMarker2(3));
    
    
    set(handles.edit_PostRefX3,'String',ave_PostCoordiMarker3(1));
    set(handles.edit_PostRefY3,'String',ave_PostCoordiMarker3(2));
    set(handles.edit_PostRefZ3,'String',ave_PostCoordiMarker3(3));
    
    
    set(handles.edit_PostRefX4,'String',ave_PostCoordiMarker4(1));
    set(handles.edit_PostRefY4,'String',ave_PostCoordiMarker4(2));
    set(handles.edit_PostRefZ4,'String',ave_PostCoordiMarker4(3));
    guidata(hObject, handles);
    


% --- Executes on button press in bt_CalcuRotation.
function bt_CalcuRotation_Callback(hObject, eventdata, handles)
% hObject    handle to bt_CalcuRotation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DegreeOutput = 0;
CoordiMarker1 = handles.ave_CoordiMarker1;
CoordiMarker2 = handles.ave_CoordiMarker2;
PostCoordiMarker1 = handles.ave_PostCoordiMarker1;
PostCoordiMarker2 = handles.ave_PostCoordiMarker2;

vector1 = CoordiMarker1-CoordiMarker2;
vector2 = PostCoordiMarker1-PostCoordiMarker2;

DegreeOutputMarker = CalRotationDegree(vector1,vector2);
set(handles.edit_Degree,'String',DegreeOutputMarker);
handles.DegreeOutputMarker = DegreeOutputMarker;

DegreeOutput = 0;
CoordiMarker3 = handles.ave_CoordiMarker3;
CoordiMarker4 = handles.ave_CoordiMarker4;
PostCoordiMarker3 = handles.ave_PostCoordiMarker3;
PostCoordiMarker4 = handles.ave_PostCoordiMarker4;

vector3 = CoordiMarker3-CoordiMarker4;
vector4 = PostCoordiMarker3-PostCoordiMarker4;

DegreeOutputMarker2 = CalRotationDegree(vector3,vector4);
set(handles.edit_Degree2,'String',DegreeOutputMarker2);
handles.DegreeOutputMarker2 = DegreeOutputMarker2;
  guidata(hObject, handles);



% --- Executes on button press in bt_CalculateDistance.
function bt_CalculateDistance_Callback(hObject, eventdata, handles)
% hObject    handle to bt_CalculateDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DistOutput = 0;
CoordiMarker1 = handles.ave_CoordiMarker1;
CoordiMarker2 = handles.ave_CoordiMarker2;
PostCoordiMarker1 = handles.ave_PostCoordiMarker1;
PostCoordiMarker2 = handles.ave_PostCoordiMarker2;
DistOutputMarker1 = GetDist(CoordiMarker1,PostCoordiMarker1);
DistOutputMarker2 = GetDist(CoordiMarker2,PostCoordiMarker2);

set(handles.edit_Distance1,'String',DistOutputMarker1);
set(handles.edit_Distance2,'String',DistOutputMarker2);

DistOutput = 0;
CoordiMarker3 = handles.ave_CoordiMarker3;
CoordiMarker4 = handles.ave_CoordiMarker4;
PostCoordiMarker3 = handles.ave_PostCoordiMarker3;
PostCoordiMarker4 = handles.ave_PostCoordiMarker4;
DistOutputMarker3 = GetDist(CoordiMarker3,PostCoordiMarker3);
DistOutputMarker4 = GetDist(CoordiMarker4,PostCoordiMarker4);

set(handles.edit_Distance3,'String',DistOutputMarker3);
set(handles.edit_Distance4,'String',DistOutputMarker4);

handles.DistOutputMarker1 = DistOutputMarker1;
handles.DistOutputMarker2 = DistOutputMarker2;
handles.DistOutputMarker3 = DistOutputMarker3;
handles.DistOutputMarker4 = DistOutputMarker4;
 guidata(hObject, handles);












function edit_RefX_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% Hints: get(hObject,'String') returns contents of edit_RefX as text
%        str2double(get(hObject,'String')) returns contents of edit_RefX as a double


% --- Executes during object creation, after setting all properties.
function edit_RefX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PostRefX_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PostRefX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PostRefX as text
%        str2double(get(hObject,'String')) returns contents of edit_PostRefX as a double


% --- Executes during object creation, after setting all properties.
function edit_PostRefX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PostRefX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Degree_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Degree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Degree as text
%        str2double(get(hObject,'String')) returns contents of edit_Degree as a double


% --- Executes during object creation, after setting all properties.
function edit_Degree_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Degree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Distance1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Distance1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Distance1 as text
%        str2double(get(hObject,'String')) returns contents of edit_Distance1 as a double


% --- Executes during object creation, after setting all properties.
function edit_Distance1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Distance1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_RefY_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RefY as text
%        str2double(get(hObject,'String')) returns contents of edit_RefY as a double


% --- Executes during object creation, after setting all properties.
function edit_RefY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PostRefY_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PostRefY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PostRefY as text
%        str2double(get(hObject,'String')) returns contents of edit_PostRefY as a double


% --- Executes during object creation, after setting all properties.
function edit_PostRefY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PostRefY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_RefZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RefZ as text
%        str2double(get(hObject,'String')) returns contents of edit_RefZ as a double


% --- Executes during object creation, after setting all properties.
function edit_RefZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PostRefZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PostRefZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PostRefZ as text
%        str2double(get(hObject,'String')) returns contents of edit_PostRefZ as a double


% --- Executes during object creation, after setting all properties.
function edit_PostRefZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PostRefZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Distance2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Distance2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Distance2 as text
%        str2double(get(hObject,'String')) returns contents of edit_Distance2 as a double


% --- Executes during object creation, after setting all properties.
function edit_Distance2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Distance2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_RefX2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RefX2 as text
%        str2double(get(hObject,'String')) returns contents of edit_RefX2 as a double


% --- Executes during object creation, after setting all properties.
function edit_RefX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_RefY2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RefY2 as text
%        str2double(get(hObject,'String')) returns contents of edit_RefY2 as a double


% --- Executes during object creation, after setting all properties.
function edit_RefY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_RefZ2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RefZ2 as text
%        str2double(get(hObject,'String')) returns contents of edit_RefZ2 as a double


% --- Executes during object creation, after setting all properties.
function edit_RefZ2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PostRefX2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PostRefX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PostRefX2 as text
%        str2double(get(hObject,'String')) returns contents of edit_PostRefX2 as a double


% --- Executes during object creation, after setting all properties.
function edit_PostRefX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PostRefX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PostRefY2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PostRefY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PostRefY2 as text
%        str2double(get(hObject,'String')) returns contents of edit_PostRefY2 as a double


% --- Executes during object creation, after setting all properties.
function edit_PostRefY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PostRefY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PostRefZ2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PostRefZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PostRefZ2 as text
%        str2double(get(hObject,'String')) returns contents of edit_PostRefZ2 as a double


% --- Executes during object creation, after setting all properties.
function edit_PostRefZ2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PostRefZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Degreetxt_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Degreetxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Degreetxt as text
%        str2double(get(hObject,'String')) returns contents of edit_Degreetxt as a double


% --- Executes during object creation, after setting all properties.
function edit_Degreetxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Degreetxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_SetRefDegree.
function bt_SetRefDegree_Callback(hObject, eventdata, handles)
% hObject    handle to bt_SetRefDegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
TestDegree = str2double(get(handles.edit_Degreetxt,'String'));
handles.TestDegree = TestDegree;
guidata(hObject, handles);



function edit_AimXX_Callback(hObject, eventdata, handles)
% hObject    handle to edit_AimXX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_AimXX as text
%        str2double(get(hObject,'String')) returns contents of edit_AimXX as a double


% --- Executes during object creation, after setting all properties.
function edit_AimXX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_AimXX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_SetAimCoordinates.
function bt_SetAimCoordinates_Callback(hObject, eventdata, handles)
% hObject    handle to bt_SetAimCoordinates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

AimX = str2double(get(handles.edit_AimXX,'String'));
AimY = str2double(get(handles.edit_AimYY,'String'));
AimZ = str2double(get(handles.edit_AimZZ,'String'));
handles.edit_AimX = AimX;
handles.edit_AimY = AimY;
handles.edit_AimZ = AimZ;
guidata(hObject, handles);




function edit_RefX3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefX3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RefX3 as text
%        str2double(get(hObject,'String')) returns contents of edit_RefX3 as a double


% --- Executes during object creation, after setting all properties.
function edit_RefX3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefX3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_RefY3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RefY3 as text
%        str2double(get(hObject,'String')) returns contents of edit_RefY3 as a double


% --- Executes during object creation, after setting all properties.
function edit_RefY3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_RefZ3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefZ3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RefZ3 as text
%        str2double(get(hObject,'String')) returns contents of edit_RefZ3 as a double


% --- Executes during object creation, after setting all properties.
function edit_RefZ3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefZ3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_RefX4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefX4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RefX4 as text
%        str2double(get(hObject,'String')) returns contents of edit_RefX4 as a double


% --- Executes during object creation, after setting all properties.
function edit_RefX4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefX4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_RefY4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RefY4 as text
%        str2double(get(hObject,'String')) returns contents of edit_RefY4 as a double


% --- Executes during object creation, after setting all properties.
function edit_RefY4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_RefZ4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefZ4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RefZ4 as text
%        str2double(get(hObject,'String')) returns contents of edit_RefZ4 as a double


% --- Executes during object creation, after setting all properties.
function edit_RefZ4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefZ4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PostRefX3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PostRefX3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PostRefX3 as text
%        str2double(get(hObject,'String')) returns contents of edit_PostRefX3 as a double


% --- Executes during object creation, after setting all properties.
function edit_PostRefX3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PostRefX3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PostRefY3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PostRefY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PostRefY3 as text
%        str2double(get(hObject,'String')) returns contents of edit_PostRefY3 as a double


% --- Executes during object creation, after setting all properties.
function edit_PostRefY3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PostRefY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PostRefZ3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PostRefZ3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PostRefZ3 as text
%        str2double(get(hObject,'String')) returns contents of edit_PostRefZ3 as a double


% --- Executes during object creation, after setting all properties.
function edit_PostRefZ3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PostRefZ3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PostRefX4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PostRefX4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PostRefX4 as text
%        str2double(get(hObject,'String')) returns contents of edit_PostRefX4 as a double


% --- Executes during object creation, after setting all properties.
function edit_PostRefX4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PostRefX4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PostRefY4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PostRefY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PostRefY4 as text
%        str2double(get(hObject,'String')) returns contents of edit_PostRefY4 as a double


% --- Executes during object creation, after setting all properties.
function edit_PostRefY4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PostRefY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PostRefZ4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PostRefZ4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PostRefZ4 as text
%        str2double(get(hObject,'String')) returns contents of edit_PostRefZ4 as a double


% --- Executes during object creation, after setting all properties.
function edit_PostRefZ4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PostRefZ4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Distance3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Distance3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Distance3 as text
%        str2double(get(hObject,'String')) returns contents of edit_Distance3 as a double


% --- Executes during object creation, after setting all properties.
function edit_Distance3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Distance3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Distance4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Distance4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Distance4 as text
%        str2double(get(hObject,'String')) returns contents of edit_Distance4 as a double


% --- Executes during object creation, after setting all properties.
function edit_Distance4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Distance4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Degree2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Degree2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Degree2 as text
%        str2double(get(hObject,'String')) returns contents of edit_Degree2 as a double


% --- Executes during object creation, after setting all properties.
function edit_Degree2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Degree2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_TakeDegreeData.
function bt_TakeDegreeData_Callback(hObject, eventdata, handles)
% hObject    handle to bt_TakeDegreeData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
raw_table = get(handles.uitable1,'Data');

s_check = 0;
for k = 1 : size(raw_table,1)
    if ~isempty(raw_table{k,1})
        s_check = k;
        break;
    end
end

Table = cell(1,4);

DegreeOutputMarker1 = handles.DegreeOutputMarker;
DegreeOutputMarker2 = handles.DegreeOutputMarker2;



MeanDegree = mean([DegreeOutputMarker1,DegreeOutputMarker2]);

Table{1,1} = handles.TestDegree;
Table{1,2} = MeanDegree;
Table{1,3} = (handles.TestDegree-MeanDegree)/handles.TestDegree*100;


%  10 % Error Threshold
if(Table{1,3} < 10)
    PassNonPass = 'Pass';
else
    PassNonPass = 'NonPass';
end


Table{1,4} = PassNonPass;

if s_check == 0
    new_table = Table;
else
    new_table = [raw_table;Table];
end
    

set(handles.uitable1,'Data',new_table)

handles.DegreeReport =get(handles.uitable1,'Data');
ForSave = get(handles.uitable1,'Data');
handles.ExportDegreeReport = ForSave;


 guidata(hObject, handles);


% --- Executes on button press in bt_TakeDistanceData.
function bt_TakeDistanceData_Callback(hObject, eventdata, handles)
% hObject    handle to bt_TakeDistanceData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 
% global CounterBtTakeDistance
% CounterBtTakeDistance =0;
raw_table = get(handles.uitable1,'Data');

s_check = 0;
for k = 1 : size(raw_table,1)
    if ~isempty(raw_table{k,1})
        s_check = k;
        break;
    end
end

     Table = cell(1,10);
%     Table = cell(31,10);
%     SaggingData = xlsread('SaggingData.xlsx')
%     
    
    
    
    
    
    
    
    

    DistOutputMarker1 = handles.DistOutputMarker1;
    DistOutputMarker2 = handles.DistOutputMarker2;
    DistOutputMarker3 = handles.DistOutputMarker3;
    DistOutputMarker4 = handles.DistOutputMarker4;

%% Selected Marker
    %%%%%%%%%%%%%%%%% Change %%%%%%%%%%%%%%%%%%%
    SelectedMarkers = handles.ave_PostCoordiMarker4;
    RelationMatrix = handles.RelationMatrix
    SelectedMarkers = [SelectedMarkers 1]';
    TransfferedMarkers = RelationMatrix*SelectedMarkers;
    AimMarkers = [handles.edit_AimX,handles.edit_AimY,handles.edit_AimZ]


    MeanDistance = mean([DistOutputMarker1,DistOutputMarker2,DistOutputMarker3,DistOutputMarker4]);

    Table{1,1} = handles.edit_AimX;
    Table{1,2} = handles.edit_AimY;
    Table{1,3} = handles.edit_AimZ;
    Table{1,4} = TransfferedMarkers(1);
    Table{1,5} = TransfferedMarkers(2);
    Table{1,6} = TransfferedMarkers(3);
    Table{1,7} = handles.edit_AimX-TransfferedMarkers(1);
    Table{1,8} = handles.edit_AimY-TransfferedMarkers(2);
    Table{1,9} = handles.edit_AimZ-TransfferedMarkers(3);
    Table{1,10} = GetDist(AimMarkers,TransfferedMarkers(1:3));

    
    


% %  10 % Error Threshold
% if(Table{1,3} < 10)
%     PassNonPass = 'Pass';
% elseif(abs(Table{1,3})==inf)
%     PassNonPass = 'Pass';
% else
%     PassNonPass = 'NonPass';
% end
% 
% 
% Table{1,4} = PassNonPass;

if s_check == 0
    new_table = Table;
else
    new_table = [raw_table;Table];
end
    

set(handles.uitable1,'Data',SaggingData)

handles.DistanceReport =get(handles.uitable1,'Data');
% ForSave = get(handles.uitable1,'Data');
% handles.ExportDistanceReport = ForSave;


 guidata(hObject, handles);


% --- Executes on button press in bt_ExportDegreeReport.
function bt_ExportDegreeReport_Callback(hObject, eventdata, handles)
% hObject    handle to bt_ExportDegreeReport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
Information= cell(1,4);
Information{1,1} = date;
Information{1,2} = 'Robotic Couch QA : Degree Report';
ForSave = [Information ; handles.ExportDegreeReport ];
xlswrite('ExportDegreeReport',ForSave);


% --- Executes on button press in bt_ExportDistanceReport.
function bt_ExportDistanceReport_Callback(hObject, eventdata, handles)
% hObject    handle to bt_ExportDistanceReport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
UiTableData = get(handles.uitable1,'Data');

Information= cell(2,10);
Information{1,1} = date;
Information{1,2} = 'Robotic Couch QA : Distance Report';
Information{2,1} = 'X-Aim'
Information{2,2} = 'Y-Aim'
Information{2,3} = 'Z-Aim'
Information{2,4} = 'X-Measured'
Information{2,5} = 'Y-Measured'
Information{2,6} = 'Z-Measured'
Information{2,7} = 'X-Err'
Information{2,8} = 'Y-Err'
Information{2,9} = 'Z-Err'
Information{2,10} = 'Err[mm]'


ForSave = [Information ; UiTableData ];
xlswrite('ExportDistanceReport',ForSave);


% --- Executes on button press in bt_DelTable.
function bt_DelTable_Callback(hObject, eventdata, handles)
% hObject    handle to bt_DelTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
old_table = get(handles.uitable1,'Data')
sz_old_table = size(old_table,1)
old_table(sz_old_table,:) = []
set(handles.uitable1,'Data',old_table)
guidata(hObject, handles);


% --- Executes on button press in bt_LoadRelationMatrix.
function bt_LoadRelationMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to bt_LoadRelationMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, path]  = uigetfile('*.mat');
addpath(path);
LoadedFile = load(filename);
fieldname = fieldnames(LoadedFile);
stuff = LoadedFile.(fieldname{1});

[sr, sc] = size(stuff);
sz = sr+sc;
if (sz == 8)
    set(handles.chb_LoadRelationMatrix,'String','Load was Successful');
    handles.RelationMatrix = stuff;
else
    set(handles.chb_LoadRelationMatrix,'String','Load was Fail')
end
guidata(hObject, handles);



function edit_AimYY_Callback(hObject, eventdata, handles)
% hObject    handle to edit_AimYY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_AimYY as text
%        str2double(get(hObject,'String')) returns contents of edit_AimYY as a double


% --- Executes during object creation, after setting all properties.
function edit_AimYY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_AimYY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_AimZZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_AimZZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_AimZZ as text
%        str2double(get(hObject,'String')) returns contents of edit_AimZZ as a double


% --- Executes during object creation, after setting all properties.
function edit_AimZZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_AimZZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function chb_LoadRelationMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to chb_LoadRelationMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chb_LoadRelationMatrix as text
%        str2double(get(hObject,'String')) returns contents of chb_LoadRelationMatrix as a double


% --- Executes during object creation, after setting all properties.
function chb_LoadRelationMatrix_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chb_LoadRelationMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
