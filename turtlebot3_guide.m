function varargout = turtlebot3_guide(varargin)
% TURTLEBOT3_GUIDE MATLAB code for turtlebot3_guide.fig
%      TURTLEBOT3_GUIDE, by itself, creates a new TURTLEBOT3_GUIDE or raises the existing
%      singleton*.
%
%      H = TURTLEBOT3_GUIDE returns the handle to a new TURTLEBOT3_GUIDE or the handle to
%      the existing singleton*.
%
%      TURTLEBOT3_GUIDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TURTLEBOT3_GUIDE.M with the given input arguments.
%
%      TURTLEBOT3_GUIDE('Property','Value',...) creates a new TURTLEBOT3_GUIDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before turtlebot3_guide_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to turtlebot3_guide_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help turtlebot3_guide

% Last Modified by GUIDE v2.5 07-Apr-2020 16:07:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @turtlebot3_guide_OpeningFcn, ...
                   'gui_OutputFcn',  @turtlebot3_guide_OutputFcn, ...
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


% --- Executes just before turtlebot3_guide is made visible.
function turtlebot3_guide_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to turtlebot3_guide (see VARARGIN)

% Choose default command line output for turtlebot3_guide
addpath("utils/");
addpath("img/");
addpath("linker/");

handles.output = hObject;
handles.log_level = "DEBUG";
axes(handles.axes1);
imshow('img/turtlebot3_with_logo.png');
axes(handles.axes2);
imshow('img/turtlebot3_with_logo.png');



guidata(hObject, handles);
% handles.tm = timer('BusyMode', 'drop', 'ExecutionMode', 'fixedRate', 'Period', 1, 'TimerFcn', {@timer_1000ms, hObject, eventdata, handles});
handles.timer1000 = timer(...
    'ExecutionMode', 'fixedRate', ...       % Run timer repeatedly.
    'Period', 1, ...                        % Initial period is 1 sec.
    'TimerFcn', {@timer_1000ms,hObject}); % Specify callback function.
handles.timer500 = timer(...
    'ExecutionMode', 'fixedRate', ...       % Run timer repeatedly.
    'Period', 0.5, ...                        % Initial period is 1 sec.
    'TimerFcn', {@timer_500ms,hObject}); % Specify callback function.
start(handles.timer1000);
start(handles.timer500);
% start(handles.tm);
%axes1_CreateFcn(hObject,eventdata,handles);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes turtlebot3_guide wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = turtlebot3_guide_OutputFcn(hObject, eventdata, handles) 
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



% --- Executes on button press in pushbutton_log_level.
function pushbutton_log_level_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_log_level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
% x = 1:0.01:10;
% y = sin(x);
% plot(x,y);
id = get(handles.listbox_log_level,'Value');
item = get(handles.listbox_log_level, 'String');
set_value = item(id);
handles.log_level = set_value;
log_manager(hObject, eventdata, handles, "INFO", strcat("The log level is setted: ", set_value ));
guidata(hObject, handles);

% function timer_1000ms(hObject,eventdata,hfigure)
% % Timer timer1 callback, called each time timer iterates.
% % Gets surface Z data, adds noise, and writes it back to surface object.
% handles = guidata(hfigure);
% log_manager(hObject, eventdata, handles, "DEBUG", "start button");
% x = 1:0.01:10;
% y = sin(x);
% plot(handles.axes1, 1,1, 'o', 'DisplayName', "ROBOT1"); hold on;
% plot(handles.axes1, 2,2, 'o', 'DisplayName', "ROBOT2"); hold on;
% plot(handles.axes1, 3,3, 'o', 'DisplayName', "ROBOT3"); hold on;
% plot(handles.axes1, 4,4, 'o', 'DisplayName', "ROBOT4"); 
% xlim(handles.axes1,[-10 10]);
% ylim(handles.axes1,[-10 10]);
% % legend(handles.axes1);
% % plot(handles.axes2, x,y);
% guidata(hfigure, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% x = 1:0.01:10;
% y = sin(x);
% plot(hObject, x,y);

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on listbox1 and none of its controls.
function listbox1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over listbox1.
function listbox1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
eventdata
hObject
handles


% --- Executes on button press in pushbutton_start.
function pushbutton_start_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
log_manager(hObject, eventdata, handles, "DEBUG", "start button");

% --- Executes on button press in checkbox_experiment.
function checkbox_experiment_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_experiment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
checkboxstate = get(hObject, 'Value')
if get(handles.checkbox_simulation, 'Value') == 1
    set(handles.checkbox_simulation, 'Value', 0) ;
end

% Hint: get(hObject,'Value') returns toggle state of checkbox_experiment


% --- Executes on button press in checkbox_simulation.
function checkbox_simulation_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_simulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
checkboxstate = get(hObject, 'Value')
if get(handles.checkbox_experiment, 'Value') == 1
    set(handles.checkbox_experiment, 'Value', 0) ;
end

% Hint: get(hObject,'Value') returns toggle state of checkbox_simulation



function edit_select_robot_num_Callback(hObject, eventdata, handles)
% hObject    handle to edit_select_robot_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_select_robot_num as text
%        str2double(get(hObject,'String')) returns contents of edit_select_robot_num as a double
log_manager(hObject, eventdata, handles, "DEBUG", "edit_select_robot_num");


% --- Executes during object creation, after setting all properties.
function edit_select_robot_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_select_robot_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox_log.
function listbox_log_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_log contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_log
log_manager(hObject, eventdata, handles, "DEBUG", "listbox_log");


% --- Executes during object creation, after setting all properties.
function listbox_log_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3
log_manager(hObject, eventdata, handles, "DEBUG", "listbox3");


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox_log_level.
function listbox_log_level_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_log_level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
log_manager(hObject, eventdata, handles, "DEBUG", "listbox_log_level");

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_log_level contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_log_level


% --- Executes during object creation, after setting all properties.
function listbox_log_level_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_log_level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function menu_setup_Callback(hObject, eventdata, handles)
% hObject    handle to menu_setup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
log_manager(hObject, eventdata, handles, "DEBUG", "menu_setup");


% --------------------------------------------------------------------
function robots2_Callback(hObject, eventdata, handles)
% hObject    handle to robots2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
log_manager(hObject, eventdata, handles, "DEBUG", "robots2");


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
log_manager(hObject, eventdata, handles, "DEBUG", "Untitled_3");


% --------------------------------------------------------------------
function ROS_MASTER_IP_Callback(hObject, eventdata, handles)
% hObject    handle to ROS_MASTER_IP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
log_manager(hObject, eventdata, handles, "DEBUG", "setup_basic");


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton_log_level.
function pushbutton_log_level_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton_log_level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.debug_level = 


% --- Executes on button press in pushbutton_log_box_clear.
function pushbutton_log_box_clear_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_log_box_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.listbox_log, 'String', []);
log_manager(hObject, eventdata, handles, "DEBUG", "pushbutton_log_box_clear");


% --- Executes on selection change in popupmenu_topics.
function popupmenu_topics_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_topics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_topics contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_topics


% --- Executes during object creation, after setting all properties.
function popupmenu_topics_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_topics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_update_topics.
function pushbutton_update_topics_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_update_topics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
log_manager(hObject, eventdata, handles, "DEBUG", "pushbutton_update_topics");
topiclist = rostopic("list");
top = "topics...";
topiclist = [top;topiclist];
set(handles.popupmenu_topics, 'String', topiclist);

% --- Executes on button press in pushbutton_get_topic_run.
function pushbutton_get_topic_run_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_get_topic_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
log_manager(hObject, eventdata, handles, "DEBUG", "pushbutton_get_topic_run");
id = get(handles.popupmenu_topics, 'Value');
topics = get(handles.popupmenu_topics, 'String');
topic = topics(id); topic = convertCharsToStrings(topic);
sub = rossubscriber(topic); msg = receive(sub, 1000); 
info = showdetails(msg);
set(handles.listbox_rostopic_box, 'String', info);

% --- Executes on button press in pushbutton_get_topic_stop.
function pushbutton_get_topic_stop_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_get_topic_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
log_manager(hObject, eventdata, handles, "DEBUG", "pushbutton_get_topic_stop");


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_master_ip_Callback(hObject, eventdata, handles)
% hObject    handle to edit_master_ip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_master_ip as text
%        str2double(get(hObject,'String')) returns contents of edit_master_ip as a double


% --- Executes during object creation, after setting all properties.
function edit_master_ip_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_master_ip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_connect_ros.
function pushbutton_connect_ros_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_connect_ros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addpath('../matlab/utils/');
ip = get(handles.edit_master_ip, 'String');
ip = convertCharsToStrings(ip);
ros_init(ip);


% --- Executes on selection change in listbox_rostopic_box.
function listbox_rostopic_box_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_rostopic_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_rostopic_box contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_rostopic_box


% --- Executes during object creation, after setting all properties.
function listbox_rostopic_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_rostopic_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end















