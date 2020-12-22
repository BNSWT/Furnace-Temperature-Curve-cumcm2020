%判断数据相似程度
function [err]=geterr(data1,data2)
M=data1(:,2)-data2(:,2);
err=(M).^2;
err=(sum(err))^0.5;
end