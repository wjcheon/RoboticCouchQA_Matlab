function varargout = CouchQA_Mag(varargin)
% COUCHQA_MAG MATLAB code for CouchQA_Mag.fig
%      COUCHQA_MAG, by itself, creates a new COUCHQA_MAG or raises the existing
%      singleton*.
%
%      H = COUCHQA_MAG returns the handle to a new COUCHQA_MAG or the handle to
%      the existing singleton*.
%
%      COUCHQA_MAG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COUCHQA_MAG.M with the given input arguments.
%
%      COUCHQA_MAG('Property','Value',...) creates a new COUCHQA_MAG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CouchQA_Mag_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CouchQA_Mag_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CouchQA_Mag

% Last Modified by GUIDE v2.5 29-Apr-2015 15:48:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CouchQA_Mag_OpeningFcn, ...
                   'gui_OutputFcn',  @CouchQA_Mag_OutputFcn, ...
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


% --- Executes just before CouchQA_Mag is made visible.
function CouchQA_Mag_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CouchQA_Mag (see VARARGIN)

% Choose default command line output for CouchQA_Mag
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CouchQA_Mag wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CouchQA_Mag_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in rb_linearposition.
function rb_linearposition_Callback(hObject, eventdata, handles)
% hObject    handle to rb_linearposition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_linearposition
a=0;


% --- Executes on button press in rb_yaw.
function rb_yaw_Callback(hObject, eventdata, handles)
% hObject    handle to rb_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_yaw


% --- Executes on button press in rb_pitch.
function rb_pitch_Callback(hObject, eventdata, handles)
% hObject    handle to rb_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_pitch


% --- Executes on button press in rb_roll.
function rb_roll_Callback(hObject, eventdata, handles)
% hObject    handle to rb_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_roll


% --- Executes on button press in bt_SetCurrent.
function bt_SetCurrent_Callback(hObject, eventdata, handles)
% hObject    handle to bt_SetCurrent (see GCBO)
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
    
    handles.ave_CoordiMarker1_current = ave_CoordiMarker1;
    handles.ave_CoordiMarker2_current = ave_CoordiMarker2;
    handles.ave_CoordiMarker3_current = ave_CoordiMarker3;
    handles.ave_CoordiMarker4_current = ave_CoordiMarker4;

    set(handles.edit_marker1x_current,'String',ave_CoordiMarker1(1));
    set(handles.edit_marker1y_current,'String',ave_CoordiMarker1(2));
    set(handles.edit_marker1z_current,'String',ave_CoordiMarker1(3));

    set(handles.edit_marker2x_current,'String',ave_CoordiMarker2(1));
    set(handles.edit_marker2y_current,'String',ave_CoordiMarker2(2));
    set(handles.edit_marker2z_current,'String',ave_CoordiMarker2(3));

    set(handles.edit_marker3x_current,'String',ave_CoordiMarker3(1));
    set(handles.edit_marker3y_current,'String',ave_CoordiMarker3(2));
    set(handles.edit_marker3z_current,'String',ave_CoordiMarker3(3));

    set(handles.edit_marker4x_current,'String',ave_CoordiMarker4(1));
    set(handles.edit_marker4y_current,'String',ave_CoordiMarker4(2));
    set(handles.edit_marker4z_current,'String',ave_CoordiMarker4(3));

    guidata(hObject, handles);


% --- Executes on button press in bt_CalculateDegree.
function bt_CalculateDegree_Callback(hObject, eventdata, handles)
% hObject    handle to bt_CalculateDegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% if(get(handles.rb_linearposition,'Value')==1)
%     ValueOfAim = 

    DegreeOutput = 0;
    CoordiMarker1_refer = handles.ave_CoordiMarker1_refer;
    CoordiMarker2_refer = handles.ave_CoordiMarker2_refer;
    CoordiMarker3_refer = handles.ave_CoordiMarker3_refer;
    CoordiMarker4_refer = handles.ave_CoordiMarker4_refer;
    Coordinates_refer = [CoordiMarker1_refer; CoordiMarker2_refer; CoordiMarker3_refer; ...
        CoordiMarker4_refer]';
    Cube_refer = GenerateCube(Coordinates_refer);

    CoordiMarker1_current = handles.ave_CoordiMarker1_current;
    CoordiMarker2_current = handles.ave_CoordiMarker2_current;
    CoordiMarker3_current = handles.ave_CoordiMarker3_current;
    CoordiMarker4_current = handles.ave_CoordiMarker4_current;
    Coordinates_current = [CoordiMarker1_current; CoordiMarker2_current; CoordiMarker3_current; ...
        CoordiMarker4_current]';
    Cube_current = GenerateCube(Coordinates_current);

    if(get(handles.rb_yaw,'Value')==1)
        vector1_refer = Cube_refer(:,3) - Cube_refer(:,1);
        vector1_current = Cube_refer(:,3) - Cube_refer(:,1);

        vector2_refer = Cube_refer(:,2)-Cube_refer(:,1);
        vector2_current = Cube_current(:,2) - Cube_current(:,1);
    %     disp('Yaw')
    else


        vector1_refer = Cube_refer(:,5)-Cube_refer(:,1);
        vector1_current = Cube_current(:,5) - Cube_current(:,1);

        vector2_refer = Cube_refer(:,6)-Cube_refer(:,2);
        vector2_current = Cube_current(:,6) - Cube_current(:,2);
    %     disp('Pitch or Roll')
    end


    DegreeOutput1= CalRotationDegree(vector1_refer,vector1_current);
    DegreeOutput2= CalRotationDegree(vector2_refer,vector2_current);
    DegreeOutput = mean([DegreeOutput1 DegreeOutput2])

    set(handles.edit_CalDegree1,'String',DegreeOutput1);
    set(handles.edit_CalDegree2,'String',DegreeOutput2);
    handles.DegreeOutput = DegreeOutput;
    guidata(hObject, handles);




% --- Executes on button press in bt_CalculateDistance.
function bt_CalculateDistance_Callback(hObject, eventdata, handles)
% hObject    handle to bt_CalculateDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DistOutput = 0;
CoordiMarker1_refer = handles.ave_CoordiMarker1_refer;
CoordiMarker2_refer = handles.ave_CoordiMarker2_refer;
CoordiMarker3_refer = handles.ave_CoordiMarker3_refer;
CoordiMarker4_refer = handles.ave_CoordiMarker4_refer;

CoordiMarker1_current = handles.ave_CoordiMarker1_current;
CoordiMarker2_current = handles.ave_CoordiMarker2_current;
CoordiMarker3_current = handles.ave_CoordiMarker3_current;
CoordiMarker4_current = handles.ave_CoordiMarker4_current;


DistOutputMarker1 = GetDist(CoordiMarker1_refer,CoordiMarker1_current);
DistOutputMarker2 = GetDist(CoordiMarker2_refer,CoordiMarker2_current);
DistOutputMarker3 = GetDist(CoordiMarker3_refer,CoordiMarker3_current);
DistOutputMarker4 = GetDist(CoordiMarker4_refer,CoordiMarker4_current);


set(handles.edit_CalDistance1,'String',DistOutputMarker1);
set(handles.edit_CalDistance2,'String',DistOutputMarker2);
set(handles.edit_CalDistance3,'String',DistOutputMarker3);
set(handles.edit_CalDistance4,'String',DistOutputMarker4);


DistOutput = mean([DistOutputMarker1 DistOutputMarker2...
    DistOutputMarker3 DistOutputMarker4]);

handles.DistOutput = DistOutput;
 guidata(hObject, handles);


% --- Executes on button press in bt_RecordData.
function bt_RecordData_Callback(hObject, eventdata, handles)
% hObject    handle to bt_RecordData (see GCBO)
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




MeanValue = handles.DegreeOutput;

Table{1,1} = handles.ValueOfAim;
Table{1,2} = MeanValue;
Table{1,3} = MeanValue-handles.ValueOfAim;
% Table{1,3} = (handles.ValueOfAim-MeanValue)/handles.ValueOfAim*100;

CriticalValueOfDistance = 2; 
CriticalValueOfDegree = 1;

%  2mm  Error Threshold
if(get(handles.rb_linearposition,'Value')==1)
    if(abs(Table{1,3}) < CriticalValueOfDistance)
         PassNonPass = 'Pass';
    else
        PassNonPass = 'NonPass';
    end
else
    if(abs(Table{1,3}) < CriticalValueOfDegree)
         PassNonPass = 'Pass';
    else
        PassNonPass = 'NonPass';
    end
end


Table{1,4} = PassNonPass;

if s_check == 0
    new_table = Table;
else
    new_table = [raw_table;Table];
end

set(handles.uitable1,'Data',new_table)




handles.ExportDegreeReport = get(handles.uitable1,'Data');
guidata(hObject, handles);


% --- Executes on button press in bt_SaveData.
function bt_SaveData_Callback(hObject, eventdata, handles)
% hObject    handle to bt_SaveData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Information= cell(1,4);
Information{1,1} = date;
if(get(handles.rb_linearposition,'Value')==1)
    Information{1,2} = 'Robotic Couch QA : Lienar Position';
elseif(get(handles.rb_yaw,'Value')==1)
    Information{1,2} = 'Robotic Couch QA : Yaw';
elseif(get(handles.rb_pitch,'Value')==1)
    Information{1,2} = 'Robotic Couch QA : Pitch';
else(get(handles.rb_yaw,'Value')==1)
    Information{1,2} = 'Robotic Couch QA : Roll';
end
ForSave = [Information ; handles.ExportDegreeReport ];


if(get(handles.rb_linearposition,'Value')==1)
    FileName = 'ExportDistance_Report';
else
    FileName = 'ExportDegree_Report';
end

xlswrite(FileName,ForSave);




function edit_marker1x_refer_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker1x_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker1x_refer as text
%        str2double(get(hObject,'String')) returns contents of edit_marker1x_refer as a double


% --- Executes during object creation, after setting all properties.
function edit_marker1x_refer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker1x_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker2x_refer_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker2x_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker2x_refer as text
%        str2double(get(hObject,'String')) returns contents of edit_marker2x_refer as a double


% --- Executes during object creation, after setting all properties.
function edit_marker2x_refer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker2x_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker3x_refer_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker3x_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker3x_refer as text
%        str2double(get(hObject,'String')) returns contents of edit_marker3x_refer as a double


% --- Executes during object creation, after setting all properties.
function edit_marker3x_refer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker3x_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker4x_refer_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker4x_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker4x_refer as text
%        str2double(get(hObject,'String')) returns contents of edit_marker4x_refer as a double


% --- Executes during object creation, after setting all properties.
function edit_marker4x_refer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker4x_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker1y_refer_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker1y_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker1y_refer as text
%        str2double(get(hObject,'String')) returns contents of edit_marker1y_refer as a double


% --- Executes during object creation, after setting all properties.
function edit_marker1y_refer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker1y_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker2y_refer_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker2y_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker2y_refer as text
%        str2double(get(hObject,'String')) returns contents of edit_marker2y_refer as a double


% --- Executes during object creation, after setting all properties.
function edit_marker2y_refer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker2y_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker3y_refer_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker3y_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker3y_refer as text
%        str2double(get(hObject,'String')) returns contents of edit_marker3y_refer as a double


% --- Executes during object creation, after setting all properties.
function edit_marker3y_refer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker3y_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker4y_refer_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker4y_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker4y_refer as text
%        str2double(get(hObject,'String')) returns contents of edit_marker4y_refer as a double


% --- Executes during object creation, after setting all properties.
function edit_marker4y_refer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker4y_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker1z_refer_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker1z_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker1z_refer as text
%        str2double(get(hObject,'String')) returns contents of edit_marker1z_refer as a double


% --- Executes during object creation, after setting all properties.
function edit_marker1z_refer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker1z_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker2z_refer_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker2z_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker2z_refer as text
%        str2double(get(hObject,'String')) returns contents of edit_marker2z_refer as a double


% --- Executes during object creation, after setting all properties.
function edit_marker2z_refer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker2z_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker3z_refer_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker3z_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker3z_refer as text
%        str2double(get(hObject,'String')) returns contents of edit_marker3z_refer as a double


% --- Executes during object creation, after setting all properties.
function edit_marker3z_refer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker3z_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker4z_refer_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker4z_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker4z_refer as text
%        str2double(get(hObject,'String')) returns contents of edit_marker4z_refer as a double


% --- Executes during object creation, after setting all properties.
function edit_marker4z_refer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker4z_refer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker1x_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker1x_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker1x_current as text
%        str2double(get(hObject,'String')) returns contents of edit_marker1x_current as a double


% --- Executes during object creation, after setting all properties.
function edit_marker1x_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker1x_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker2x_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker2x_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker2x_current as text
%        str2double(get(hObject,'String')) returns contents of edit_marker2x_current as a double


% --- Executes during object creation, after setting all properties.
function edit_marker2x_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker2x_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker3x_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker3x_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker3x_current as text
%        str2double(get(hObject,'String')) returns contents of edit_marker3x_current as a double


% --- Executes during object creation, after setting all properties.
function edit_marker3x_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker3x_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker4x_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker4x_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker4x_current as text
%        str2double(get(hObject,'String')) returns contents of edit_marker4x_current as a double


% --- Executes during object creation, after setting all properties.
function edit_marker4x_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker4x_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker1y_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker1y_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker1y_current as text
%        str2double(get(hObject,'String')) returns contents of edit_marker1y_current as a double


% --- Executes during object creation, after setting all properties.
function edit_marker1y_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker1y_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker2y_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker2y_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker2y_current as text
%        str2double(get(hObject,'String')) returns contents of edit_marker2y_current as a double


% --- Executes during object creation, after setting all properties.
function edit_marker2y_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker2y_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker3y_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker3y_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker3y_current as text
%        str2double(get(hObject,'String')) returns contents of edit_marker3y_current as a double


% --- Executes during object creation, after setting all properties.
function edit_marker3y_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker3y_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker4y_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker4y_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker4y_current as text
%        str2double(get(hObject,'String')) returns contents of edit_marker4y_current as a double


% --- Executes during object creation, after setting all properties.
function edit_marker4y_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker4y_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker1z_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker1z_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker1z_current as text
%        str2double(get(hObject,'String')) returns contents of edit_marker1z_current as a double


% --- Executes during object creation, after setting all properties.
function edit_marker1z_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker1z_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker2z_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker2z_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker2z_current as text
%        str2double(get(hObject,'String')) returns contents of edit_marker2z_current as a double


% --- Executes during object creation, after setting all properties.
function edit_marker2z_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker2z_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker3z_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker3z_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker3z_current as text
%        str2double(get(hObject,'String')) returns contents of edit_marker3z_current as a double


% --- Executes during object creation, after setting all properties.
function edit_marker3z_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker3z_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_marker4z_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_marker4z_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_marker4z_current as text
%        str2double(get(hObject,'String')) returns contents of edit_marker4z_current as a double


% --- Executes during object creation, after setting all properties.
function edit_marker4z_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_marker4z_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_DeleteData.
function bt_DeleteData_Callback(hObject, eventdata, handles)
% hObject    handle to bt_DeleteData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
old_table = get(handles.uitable1,'Data');
sz_old_table = size(old_table,1);
old_table(sz_old_table,:) = [];
set(handles.uitable1,'Data',old_table);
guidata(hObject, handles);



% --- Executes on button press in bt_SetAim.
function bt_SetAim_Callback(hObject, eventdata, handles)
% hObject    handle to bt_SetAim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ValueOfAim= str2double(get(handles.edit_SetAim,'String'));
handles.ValueOfAim= ValueOfAim;
guidata(hObject, handles);



function edit_SetAim_Callback(hObject, eventdata, handles)
% hObject    handle to edit_SetAim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_SetAim as text
%        str2double(get(hObject,'String')) returns contents of edit_SetAim as a double


% --- Executes during object creation, after setting all properties.
function edit_SetAim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_SetAim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_CalDegree1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_CalDegree1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_CalDegree1 as text
%        str2double(get(hObject,'String')) returns contents of edit_CalDegree1 as a double


% --- Executes during object creation, after setting all properties.
function edit_CalDegree1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_CalDegree1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_CalDegree2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_CalDegree2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_CalDegree2 as text
%        str2double(get(hObject,'String')) returns contents of edit_CalDegree2 as a double


% --- Executes during object creation, after setting all properties.
function edit_CalDegree2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_CalDegree2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_CalDistance1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_CalDistance1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_CalDistance1 as text
%        str2double(get(hObject,'String')) returns contents of edit_CalDistance1 as a double


% --- Executes during object creation, after setting all properties.
function edit_CalDistance1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_CalDistance1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_CalDistance2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_CalDistance2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_CalDistance2 as text
%        str2double(get(hObject,'String')) returns contents of edit_CalDistance2 as a double


% --- Executes during object creation, after setting all properties.
function edit_CalDistance2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_CalDistance2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_CalDistance3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_CalDistance3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_CalDistance3 as text
%        str2double(get(hObject,'String')) returns contents of edit_CalDistance3 as a double


% --- Executes during object creation, after setting all properties.
function edit_CalDistance3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_CalDistance3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_CalDistance4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_CalDistance4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_CalDistance4 as text
%        str2double(get(hObject,'String')) returns contents of edit_CalDistance4 as a double


% --- Executes during object creation, after setting all properties.
function edit_CalDistance4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_CalDistance4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_SetReference.
function bt_SetReference_Callback(hObject, eventdata, handles)
% hObject    handle to bt_SetReference (see GCBO)
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
    
    handles.ave_CoordiMarker1_refer = ave_CoordiMarker1;
    handles.ave_CoordiMarker2_refer = ave_CoordiMarker2;
    handles.ave_CoordiMarker3_refer = ave_CoordiMarker3;
    handles.ave_CoordiMarker4_refer = ave_CoordiMarker4;

    set(handles.edit_marker1x_refer,'String',ave_CoordiMarker1(1));
    set(handles.edit_marker1y_refer,'String',ave_CoordiMarker1(2));
    set(handles.edit_marker1z_refer,'String',ave_CoordiMarker1(3));

    set(handles.edit_marker2x_refer,'String',ave_CoordiMarker2(1));
    set(handles.edit_marker2y_refer,'String',ave_CoordiMarker2(2));
    set(handles.edit_marker2z_refer,'String',ave_CoordiMarker2(3));

    set(handles.edit_marker3x_refer,'String',ave_CoordiMarker3(1));
    set(handles.edit_marker3y_refer,'String',ave_CoordiMarker3(2));
    set(handles.edit_marker3z_refer,'String',ave_CoordiMarker3(3));

    set(handles.edit_marker4x_refer,'String',ave_CoordiMarker4(1));
    set(handles.edit_marker4y_refer,'String',ave_CoordiMarker4(2));
    set(handles.edit_marker4z_refer,'String',ave_CoordiMarker4(3));

    guidata(hObject, handles);




% --- Executes when selected object is changed in uipanel6.
function uipanel6_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel6 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)



   
