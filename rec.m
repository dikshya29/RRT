% Function to draw a rectangle(car) according to given configuration)
% car width = 2.5;
% X vector start from left line in 0-degree orientation and go clockwise]
% % - Each column corresponds to one line

function []  =rec(node)
x = node.x;
y = node.y;
th = node.th;
global carlen
width = 2.5;
h = width/2;
w = carlen/2;
X = [x-w, x-w, x+w, x+w;
    x-w, x+w, x+w, x-w];
Y = [y-h, y+h, y+h, y-h;
    y+h, y+h, y-h, y-h];

direction = [0,0,1];
car = plot(X,Y,'Linewidth',3);
origin=[x y 0];
rotate(car,direction,th,origin)

end
