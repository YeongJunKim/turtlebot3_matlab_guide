function timer_500ms(hObject,eventdata,hfigure)
persistent step
if isempty(step)
   step = 0; 
end


handles = guidata(hfigure);
step = step +1;
message = strcat("timer_500ms", num2str(step));
log_manager(0, 0, handles, "DEBUG", message);

x = 1:0.01:10;
y = sin(x);
ax = handles.axes1;
plot(ax, 1,1, 'o', 'DisplayName', "ROBOT1"); hold(ax, 'on');
plot(ax, 2,2, 'o', 'DisplayName', "ROBOT2"); hold(ax, 'on');
plot(ax, 3,3, 'o', 'DisplayName', "ROBOT3"); hold(ax, 'on');
plot(ax, 4,4, 'o', 'DisplayName', "ROBOT4"); hold(ax, 'off');
xlim(ax,[-10 10]);
ylim(ax,[-10 10]);
legend(handles.axes1);
plot(handles.axes2, x,y);
guidata(hfigure, handles);
end