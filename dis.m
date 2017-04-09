function d = dis(a,b)
global weight

d = sqrt((a.x-b.x)^2 + (a.y-b.y)^2 + weight*(a.th-b.th)^2 );

end