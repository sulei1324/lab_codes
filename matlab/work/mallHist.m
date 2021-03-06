% function mallHist(exl,n_start,n_end,d)
clc;
clear all;
num=xlsread('E:\ѧϰ\��ϰ1\��ϰ1\��ϰ1����.xls','A2:A41');
uni_num=unique(num);
m=size(uni_num,1);
n_start=min(num(:));
n_end=max(num(:));
d=5;
group_ini=[n_start:d:n_end];
group_num=ceil(m/d);
group=zeros(2*group_num,1);
for i=1:group_num
    group(2*i-1,1)=group_ini(i);
    if((group_ini(i)+group_num)>n_end)
        group(2*i,1)=n_end;
    else
        group(2*i,1)=group_ini(i)+group_num-1;
    end
end


for i=1:group_num
    n=0;
    for j=group(2*i-1):group(2*i)
        n=n+size(find(num==j),1);
    end
    disp(['group ' num2str(i,'%d') ' (' num2str(group(2*i-1),'%02d') '-' num2str(group(2*i),'%02d') ') has ' num2str(n,'%02d') ' elements']);
end

disp(['Range   Frequency']);
for i=1:group_num
    n=0;
    for j=group(2*i-1):group(2*i)
        n=n+size(find(num==j),1);
    end
    disp([num2str(group(2*i-1),'%02d') '-' num2str(group(2*i),'%02d') '      '  num2str(n,'%02d')]);
end

x=n_start+2:d:n_end;


hist(num,x);



% end