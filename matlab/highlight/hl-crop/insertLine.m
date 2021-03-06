function [insLine]=insertLine(line)
% clear all;
% clc;
% load('line.mat');
% line=line{26,1}(:,3:6);

pNum=size(line,1);
index=1;
insLine=[];

% wholeD=0;
% dist=[];
% index=1;
% for i=2:pNum
%     d=distanceXYZ(line(i-1,1:3),line(i,1:3));
%     wholeD=wholeD+d;
%     dist(index,1)=d;
%     index=index+1;
% end
% mD=wholeD/(pNum-1);  

% mD=meanDistance(line);
thresh=2;
sthresh=thresh^2;


for i=1:pNum-1
    insLine(index,1:4)=line(i,1:4);
    index=index+1;
    d=distanceXYZ(line(i,1:3),line(i+1,1:3));
    sd=d^2;
    if(sd<=sthresh)
        continue;
    else
        x1=line(i,1);
        x2=line(i+1,1);
        y1=line(i,2);
        y2=line(i+1,2);
        z1=line(i,3);
        z2=line(i+1,3);
        r1=line(i,4);
        r2=line(i+1,4);
        r=(r1+r2)/2;
        insertNum=round(d/thresh);
        l=x2-x1;
        m=y2-y1;
        n=z2-z1;
        for j=1:insertNum
            a=sthresh*(j^2)/sd;
            a=sqrt(a);
            X=a*l+x1;
            Y=a*m+y1;
            Z=a*n+z1;
            if(sign(X-x1)==sign(x2-X))
                insLine(index,1:4)=[X,Y,Z,r];
                index=index+1;
            end
        end
    end
end

insLine(index,1:4)=line(i+1,1:4);  

end
        