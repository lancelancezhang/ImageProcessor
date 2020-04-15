% this function generates a list of frames from specifications
% inputs: starting frame, step size, number of frames to generate
% output: array with starting frame increasing in step size until total
% number of frames reached

function[frame_array] = GenerateFrameList(start_frame, step_size, num_frames)

% iterate starting frame by step size number
for i = 1:num_frames
    % append frames into array
    frame_array(i) = start_frame;
    start_frame = start_frame + step_size;
end
