%% setup cam object
cam = webcam;

writer = VideoWriter('movie.avi');

%% grab and process image

frames =200;

for i = 1:frames
    img = snapshot(cam);
    % imagesc(img);
    axis image;
    axis off;
    
    writeVideo(writer, img);
    
end

%% clean up

delete(cam);

