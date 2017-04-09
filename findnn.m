function nn = findnn(a)
global mytree
min = 99999999;
for i=1:length(mytree)
    d = dis(mytree{i},a);
    if d<min
        min = d;
        nn = mytree{i}
    end
end
end
