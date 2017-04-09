global s g carlen speed mytree weight sample_thresh ang
global goal_thresh stepsize
close all; clear all;
figure();
axis([-30 30 -20 100]);
rectangle('Position',[-10,-10,20,100])
hold on

speed = 1;
s.x = 0;
s.y = 0;
s.th = 90;
s.nodeid = 1;
g.x = 8;
g.y = 80;
g.th = 0;
mytree={};
mytree{1}=s;
plot(g.x,g.y,'rx'); % Goal

carlen = 4.5;
weight = 1;
sample_thresh =3.5;
goal_thresh = 4;
stepsize = 30;
ang = 120; % max steering angle

rec(s); % draws robot


count = 0;
sampledata = [];
while count<1
    
    sample.x = randi(10)*(-1)^randi(2);
    sample.y = randi(100);
    sample.th = 90;
        sampledata = [sampledata;sample];

    count = count+1;

    plot(sample.x,sample.y,'bx');

    if dis(sample,g)<goal_thresh
        sample = g;
        goal_thresh = 1;
    end
    
    nn = findnn(sample);
    plot(nn.x,nn.y,'b+');
%     status = connectnodes(sample,nn);
    
    %     if status == 0
    %         continue;
    %     end
    
    pause(1);
    
end