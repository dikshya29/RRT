function status = connectnodes(sample,nn)

global stepsize mytree
oldnn = nn;

min = 99999999999;
count= 0;
while(count<5)
    d = dis(sample,nn);
    prim = generate_primitives(nn);
    
    if d<stepsize
        ext = extend(nn,sample);
        mytree{end+1}=ext;
        mytree{end}.parentid = nn.nodeid;
        mytree{end}.nodeid = length(mytree);
        status = 1;
        break;
    end;
    
    for i=1:length(prim)
        primnode.x=prim(i,1);
        primnode.y=prim(i,2);
        primnode.th=prim(i,3);
        primnode.phi=prim(i,4);
        dis_to_sample = dis(primnode,sample);
        if dis_to_sample<min
            min = dis_to_sample;
            min_prim = i;
            min_node = primnode;
        end
    end
    mytree{end+1}=min_node;
    mytree{end}.parentid = nn.nodeid;
    mytree{end}.nodeid = length(mytree);
    joinnodes(nn,min_node);
    drawnow;
    nn = min_node;
    count = count+1;
end
status=0; % TODO



function [] = joinnodes(newnn,minode)
global carlen speed
nth = newnn.th; % newnn is starting
nx = newnn.x;
ny = newnn.y;
phi = minode.phi; % minode is destination
dt = 0;
j=speed;
th_dot = j*tand(phi)/carlen;
while dt~=30
    nth = nth + th_dot;
    nx = nx + j*cosd(nth);
    ny = ny + j*sind(nth);
    hold on;
    plot(nx,ny,'k.');
    dt=dt+1;
end

function ext = extend(newnn,sample)
global carlen speed sample_thresh mytree ang
nth = newnn.th; % newnn is starting
nx = newnn.x;
ny = newnn.y;
% phi = sample.phi; % minode is destination
dt = 0;
j=speed;
for phi = -ang:10:ang
    th_dot = j*tand(phi)/carlen;
    dt=0;
    while dt~=30
        nth = nth + th_dot;
        nx = nx + j*cosd(nth);
        ny = ny + j*sind(nth);
        h.x=nx;
        h.y=ny;
        h.th=nth;
        
        if dis(h,sample)<sample_thresh
            h.phi=phi;
            h.dt=dt;
            mytree{end+1}=h;
            mytree{end}.nodeid=length(mytree);
            ext = mytree{end};
            flag = 1;
            break;
        end
        dt=dt+1;
    end
    if flag==1
        break;
    end
end


