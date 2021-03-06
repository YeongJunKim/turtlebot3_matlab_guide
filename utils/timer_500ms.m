function timer_500ms(hObject,eventdata,hfigure)
%% get figure data
handles = guidata(hfigure);

%% global

%% persistent
persistent step

%% timer init
if isempty(step)
   step = 0; 
end

%% mapping
for i = 1:size(handles.app.robot_position, 2)
    handles.app.robot_position(:,i) = [normrnd(0, 0.3) normrnd(0, 5)];    
end



%% to the ui

% disp(handles.app)
step = step +1;
message = strcat("timer_500ms", num2str(step));
log_manager(0, 0, handles, "DEBUG", message);

ax = handles.axes1;
for i = 1:handles.app.robot_num
   dpname = strcat("ROBOT", string(i));
   plot(ax, handles.app.robot_position(1,i),handles.app.robot_position(2,i), 'o', 'DisplayName', handles.app.robot_namespace{i}); hold(ax, 'on'); 
end
hold(ax, 'off');
xlim(ax,[-10 10]);
ylim(ax,[-10 10]);
legend(handles.axes1);
% plot(handles.axes2, x,y);
guidata(hfigure, handles);
end