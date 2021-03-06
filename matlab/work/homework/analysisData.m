function [result]=analysisData(a,title)

[m,n]=size(a);
for i=1:n
    result(i).title=title;
    result(i).maxValue=max(a(:,i));
    result(i).minValue=min(a(:,i));
    result(i).sampleNum=m;
    result(i).meanValue=mean(a(:,i));
    result(i).medianValue=median(a(:,i));
    result(i).stdValue=std(a(:,i));
    result(i).varValue=power(std(a(:,i)),2);
%     result(i).stdErrorValue=stdError(a(:,i));
    result(i).majorityValue=mostValue(a(:,i));
%     result(i).kurtosisValue=kurtosis(a(:,i));
    result(i).skewnessValue=skewness(a(:,i));
    result(i).regionValue=max(a(:,i))-min(a(:,i));
    result(i).sumValue=sum(a(:,i));
    fieldnamesString=fieldnames(result(i));
    resultRowsNum=size(fieldnamesString,1);
    for j=1:resultRowsNum
        sName=sprintf('%15s',fieldnamesString{j,1});
        if(j==1)
            sValue=sprintf('%10s',getfield(result(i),fieldnamesString{j,1}));
            disp(['  ' sName '   ' sValue]);
            continue;
        end
        sValue=sprintf('%10d',getfield(result(i),fieldnamesString{j,1}));
        disp(['  ' sName '  ' sValue]);
    end
    
end



end
