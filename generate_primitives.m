function prim = generate_primitives(node)
global ang
x = node.x;
y=node.y;
th = node.th;
prim=[];
for phi = -ang:10:ang
[nx,ny,nth,p]= evolve(x,y,th,phi);
prim = [prim; [nx,ny,nth,p]];
end


function [nx,ny,nth,phi] = evolve(nx,ny,nth,phi)

global carlen speed 
j = speed;
dt =0;
th_dot = j*tand(phi)/carlen;
while dt~=30 % dt also used in connect > joinnodes
    nth = nth + th_dot;
    nx = nx + j*cosd(nth);
    ny = ny + j*sind(nth);
%     hold on;
%     plot(nx,ny,'y.');
    dt=dt+1;
end

