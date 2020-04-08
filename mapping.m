function mapping(hfigure)


handles = guidata(hfigure);




% robot_position_mapping
% 
% robot's state (x, y, theta)
% handles.app.data.state = (:, robot_index)
% The robot_index.              : handles.app.data.robot_num (1:robot_num)


% 
for i = 1:handles.app.robot_num
   handles.app.robot_position(:,1) = [1 2]; 
   handles.app.robot_position(:,3) = [3 2];
end

handles.app.robot_position
guidata(hfigure, handles);
end