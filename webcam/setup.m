%% more help
% % https://www.mathworks.com/help/imaq/acquiring-image-and-skeletal-data-using-the-kinect.html

%% device chacking

info = imaqhwinfo('winvideo'); % get info object
info.DeviceInfo(1); % there are two device 1.RGB camera 2.IR depth camera ]
% also can check device 2
%% Acquire Color and Depth Data
% Create the VIDEOINPUT objects for the two streams
colorVid = videoinput('kinect',1, 'RGB_640x480');
depthVid = videoinput('kinect',2); % depth data also

%% 
src = getselectedsource(vid);