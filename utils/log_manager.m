function r = log_manager(hObject, eventdata, handles, level, messages)
% id = get(handles.listbox_log, 'Value')
items = get(handles.listbox_log, 'String');
messages = strcat("[",level,"], ",messages);
items = [messages;items];
%level
%handles.log_level
if level == "INFO"
    set(handles.listbox_log, 'String', items);
elseif handles.log_level == "DEBUG"
    % all message print
    set(handles.listbox_log, 'String', items);
elseif handles.log_level == "WARNNING"
    if level == "WARNING" || level == "ERROR"
        set(handles.listbox_log, 'String', items);
    end
elseif handles.log_level == "ERROR"
    if level == "ERROR"
        set(handles.listbox_log, 'String', items);
    end
end

end