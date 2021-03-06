% function newhighlight()


clear all;
clc;
tic;
width=1548;
height=2235;
zRange=[3468,4267];
level=zRange(2)-zRange(1)+1;

src=('Y:\Public\mostzhangyalun\sulei\thy1\3468-4267\');
dst=('Y:\Public\mostzhangyalun\sulei\matlab\test_dst\highlightTest\26\');
pre='test_';
suf='_x3545_y_2092_w_1548_h_2235.tif';
R1=5;
R2=3;

swc1=load('Y:\Public\mostzhangyalun\sulei\matlab\m\highlight\used1.swc');
swc1(:,3:4)=swc1(:,3:4)*10/3;
line1=readLine(swc1);
lineNum1=size(line1,1);



Image=zeros(height,width,level);
tmpImage=zeros(height,width,level);
for i=zRange(1):zRange(2)
%      tmpImage(:,:,i)=imread('E:\sulei\hippo-sub.tif',i);    
    tmpImage(:,:,(i-zRange(1)+1))=imread([src pre num2str(i,'%05d') suf]);    
end


for i=1:lineNum1
    lineI1=line1{i};
    if(size(lineI1,1)~=0)
        lineI1=lineI1(:,3:6);
        lightArea1=chooseArea(lineI1,R1);
        disp(i);
        for j=1:size(lightArea1)
            x=lightArea1(j,1);
            y=lightArea1(j,2);
            z=lightArea1(j,3);
            [x,y,z]=checkXYZ(x,y,z,width,height,level);
            Image(y,x,z)=tmpImage(y,x,z);
%             Image(y,x,z)=255;
        end
        
    end
end


swc2=load('Y:\Public\mostzhangyalun\sulei\matlab\m\highlight\cell.swc');
swc2(:,3:4)=swc2(:,3:4)*10/3;
line2=readLine(swc2);
lineNum2=size(line2,1);
for i=1:lineNum2
    lineI2=line2{i};
    if(size(lineI2,1)~=0)
        lineI2=lineI2(:,3:6);
        lightArea2=chooseArea(lineI2,R2);
        disp(i);
        for j=1:size(lightArea2)
            x=lightArea2(j,1);
            y=lightArea2(j,2);
            z=lightArea2(j,3);
            [x,y,z]=checkXYZ(x,y,z,width,height,level);
            Image(y,x,z)=tmpImage(y,x,z);
%             Image(y,x,z)=255;
        end
        
    end
end





Image=uint8(Image);

for i=1:level
    i
    imwrite(Image(:,:,i),[dst num2str(i,'%05d') '.tif']);
end

toc;



% ball=sphericalArea(R);