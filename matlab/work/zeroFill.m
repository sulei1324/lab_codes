function outArray=zeroFill(inArray)
[m,n]=size(inArray);
outArray=zeros(m+2,n+2);
for i=2:m+1
    for j=2:n+1
        outArray(i,j)=inArray(i-1,j-1);
    end
end
end