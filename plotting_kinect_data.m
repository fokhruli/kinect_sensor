clc,clear
cla
A = xlsread('pp1_trial1.xls');
nn = 1:19;
X = A(:,nn);                    % read first 19 columns
Y = A(:,nn+19);
Z = A(:,nn+19*2);
cla
axis equal
    % set axis limits
xlim([min(X(:)) max(X(:))])
ylim([min(Y(:)) max(Y(:))])
zlim([min(Z(:)) max(Z(:))])
    % let's identificate some lines
    % hand-wrist-elbow-shoulder-spinShoulder-shoulder-elbow-wrist-hand
ind1 = [6 5 4 3 19 7 8 9 10];
hold on
for i = 1:size(X,1)
        % draw all points
    h(1) = plot3(X(i,:),Y(i,:),Z(i,:),'.r'); 
        % draw some lines
    h(2) = plot3(X(i,ind1),Y(i,ind1),Z(i,ind1),'-b'); 
    pause(0.1)          % wait a bit
    delete(h)           % delete all
end
hold off