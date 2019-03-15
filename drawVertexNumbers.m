function drawVertexNumbers(V,do)

if do
    ff = any(~isnan(V),2);
    text(V(ff,1),V(ff,2),arrayfun(@num2str,find(ff),'UniformOutput',false),'color','b','HorizontalAlignment','center','fontweight','bold');
end
