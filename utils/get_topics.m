function r = get_topics(handles, topic)
handles.sub = rossubscriber(topic, {@topic_callback, handles});
end

function r = topic_callback(src, msg)
    
end