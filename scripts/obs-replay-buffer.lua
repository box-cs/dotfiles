obs = obslua

-- mimics NVIDIA shadowplay/share by clearing replay buffer after saving clip in OBS

function script_description()
    return "Handles replay buffer/record start/stop/saved events"
end

function handle_event(event, enum, command, callback)
    if event == enum then
        os.execute(command)
        if callback then callback() end
    end
end

function on_replay_buffer_saved()
    obs.obs_frontend_replay_buffer_stop()
    obs.timer_add(obs.obs_frontend_replay_buffer_start, 4000)
end

function on_replay_buffer_starting()
    obs.timer_remove(obs.obs_frontend_replay_buffer_start)
end

function on_event(e)
    handle_event(e, obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_STARTING, 'notify-send "Alert" "Replay Buffer Starting"', on_replay_buffer_starting)
    handle_event(e, obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_STOPPING, 'notify-send "Alert" "Replay Buffer Stopping"')
    handle_event(e, obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_SAVED, 'notify-send "Alert" "Replay Buffer Saved!"', on_replay_buffer_saved)
    handle_event(e, obs.OBS_FRONTEND_EVENT_RECORDING_STARTED, 'notify-send "Alert" "Recording Started"')
    handle_event(e, obs.OBS_FRONTEND_EVENT_RECORDING_STOPPED, 'notify-send "Alert" "Recording Stopped"')
end

function script_load(settings)
    obs.obs_frontend_add_event_callback(on_event)
end

function script_update()
end


function script_unload()
    obs.obs_frontend_remove_event_callback(on_event)
end