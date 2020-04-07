function timer_1000ms(hObject,eventdata,hfigure)
% % Timer timer1 callback, called each time timer iterates.
% % Gets surface Z data, adds noise, and writes it back to surface object.
% 
% handles = guidata(hfigure);
% log_manager(hObject, eventdata, handles, "DEBUG", "start button");
persistent step

if isempty(step)
   step = 0; 
end
handles = guidata(hfigure);
step = step +1;
message = strcat("timer_1000ms", num2str(step));
log_manager(0, 0, handles, "DEBUG", message);
end