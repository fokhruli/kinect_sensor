function kinect()
imaqreset;
%create color and depth kinect videoinput objects
colorVid = videoinput('kinect', 1);
depthVid = videoinput('kinect', 2);
triggerconfig (depthVid,'manual');
framesPerTrig = 1;
depthVid.FramesPerTrigger=framesPerTrig;
depthVid.TriggerRepeat=inf;
src = getselectedsource(depthVid);
src.EnableBodyTracking = 'on';  
start(depthVid);
himg = figure;
SkeletonConnectionMap = [ [4 3];  % Neck
                          [3 21]; % Head
                          [21 2]; % Right Leg
                          [2 1];
                          [21 9];
                          [9 10];  % Hip
                          [10 11];
                          [11 12]; % Left Leg
                          [12 24];
                          [12 25];
                          [21 5];  % Spine
                          [5 6];
                          [6 7];   % Left Hand
                          [7 8];
                          [8 22];
                          [8 23];
                          [1 17];
                          [17 18];
                          [18 19];  % Right Hand
                          [19 20];
                          [1 13];
                          [13 14];
                          [14 15];
                          [15 16];
                        ];
while ishandle(himg);
trigger (depthVid);
[depthMap, ts, depthMetaData] = getdata (depthVid);
anyBodiesTracked = any(depthMetaData.IsBodyTracked ~= 0);
trackedBodies = find(depthMetaData.IsBodyTracked);
nBodies = length(trackedBodies);
colors = ['r';'g';'b';'c';'y';'m'];
imshow (depthMap, [0 4096]);
if  sum(depthMetaData.IsBodyTracked) >0
skeletonJoints = depthMetaData.DepthJointIndices (:,:,depthMetaData.IsBodyTracked);
hold on;
for i = 1:24
for body = 1:nBodies
X1 = [skeletonJoints(SkeletonConnectionMap(i,1),1,body); skeletonJoints(SkeletonConnectionMap(i,2),1,body)];
Y1 = [skeletonJoints(SkeletonConnectionMap(i,1),2,body), skeletonJoints(SkeletonConnectionMap(i,2),2,body)];
line(X1,Y1, 'LineWidth', 2, 'LineStyle', '-' , 'Marker', '+', 'Color', colors(body));
end
end
hold off;
end
flushdata(depthvid,'triggers');
flushdata(colorvid,'triggers');
%clear vid;
end
stop(depthVid);
delete(depthVid); %Always remove image acquisition objects from memory, and the variables that reference them, when you no longer need them.
clear depthVid;
delete(colorVid);
clear colorVid;
end

