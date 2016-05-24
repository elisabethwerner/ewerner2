function [timeline_jan2012_ace_model, timeline_jan2012_ace_data,...
    timeline_jan2012_ace_model_diff, timeline_jan2012_ace_data_diff,...
    timeline_jan2012_ace_data_5min,...
    timeline_mar2015_ace_model, timeline_mar2015_ace_data,... 
    timeline_mar2015_ace_model_diff, timeline_mar2015_ace_data_diff,...
    timeline_mar2015_ace_data_5min] = serialdatenumberarray_fun(jan2012_ace_model,...
    jan2012_ace_data, jan2012_ace_data_5min,... 
    mar2015_ace_model, mar2015_ace_data, mar2015_ace_data_5min)
%--------------------------------------------------------------------------
%------------------------------- Construct timelines ----------------------
%--------------------------------------------------------------------------
%----------------------------------- JAN2012 EVENT ------------------------
%--------------------------------------------------------------------------
%----------------------------------- jan2012 event: Earth (ACE) -----------
%----------------------------------- Construct model timeline -------------
timeline_jan2012_ace_model = zeros(length(jan2012_ace_model{2}),1);
for i = 1:length(jan2012_ace_model{2})
    old_date = jan2012_ace_model{2}{i};
    new_date = strrep(old_date, 'T', ' ');
    timeline_jan2012_ace_model(i) = datenum(new_date,'yyyy-mm-dd HH:MM');
    %check: astr = datestr(serialDateNumberarray)
end
%----------------------------------- Construct data timeline --------------
timeline_jan2012_ace_data = zeros(length(jan2012_ace_data{1}),1);
for i = 1:length(jan2012_ace_data{1})
    D = datenum(jan2012_ace_data{1}(i),1,1)+jan2012_ace_data{2}(i)-1;
    [Year,Month,Day] = datevec(D);
    timeline_jan2012_ace_data(i) = datenum(Year,Month,Day,jan2012_ace_data{3}(i),0,0);
end
%----------------------------------- Construct diff timelines (1 hour timestep) ----
timeline_jan2012_ace_model_diff = zeros(length(jan2012_ace_model{2})-1,1);
for i = 1:length(jan2012_ace_model{2})-1
    old_date = jan2012_ace_model{2}{i};
    new_date = strrep(old_date, 'T', ' ');
    timeline_jan2012_ace_model_diff(i) = datenum(new_date,'yyyy-mm-dd HH:MM');
end

timeline_jan2012_ace_data_diff = zeros(length(jan2012_ace_data{1})-1,1);
for i = 1:length(jan2012_ace_data{1})-1
    D = datenum(jan2012_ace_data{1}(i),1,1)+jan2012_ace_data{2}(i)-1;
    [Year,Month,Day] = datevec(D);
    timeline_jan2012_ace_data_diff(i) = datenum(Year,Month,Day,jan2012_ace_data{3}(i),0,0);
end
%----------------------------------- Construct 5 min data timeline --------------
timeline_jan2012_ace_data_5min = zeros(length(jan2012_ace_data_5min{1}),1);
for i = 1:length(jan2012_ace_data_5min{1})
    D = datenum(jan2012_ace_data_5min{1}(i),1,1)+jan2012_ace_data_5min{2}(i)-1;
    [Year,Month,Day] = datevec(D);
    timeline_jan2012_ace_data_5min(i) = datenum(Year,Month,Day,jan2012_ace_data_5min{3}(i),0,0);
end
%--------------------------------------------------------------------------
%----------------------------------- MAR2015 EVENT ------------------------
%--------------------------------------------------------------------------
%----------------------------------- mar2015 event: Earth (ACE) -----------
%----------------------------------- Construct model timeline -------------
timeline_mar2015_ace_model = zeros(length(mar2015_ace_model{2}),1);
for i = 1:length(mar2015_ace_model{2})
    old_date = mar2015_ace_model{2}{i};
    new_date = strrep(old_date, 'T', ' ');
    timeline_mar2015_ace_model(i) = datenum(new_date,'yyyy-mm-dd HH:MM');
end
%----------------------------------- Construct data timeline --------------
timeline_mar2015_ace_data = zeros(length(mar2015_ace_data{1}),1);
for i = 1:length(mar2015_ace_data{1})
    D = datenum(mar2015_ace_data{1}(i),1,1)+mar2015_ace_data{2}(i)-1;
    [Year,Month,Day] = datevec(D);
    timeline_mar2015_ace_data(i) = datenum(Year,Month,Day,mar2015_ace_data{3}(i),0,0);
end
%----------------------------------- Construct diff timelines (1 hour timestep) ----
timeline_mar2015_ace_model_diff = zeros(length(mar2015_ace_model{2})-1,1);
for i = 1:length(mar2015_ace_model{2})-1
    old_date = mar2015_ace_model{2}{i};
    new_date = strrep(old_date, 'T', ' ');
    timeline_mar2015_ace_model_diff(i) = datenum(new_date,'yyyy-mm-dd HH:MM');
end

timeline_mar2015_ace_data_diff = zeros(length(mar2015_ace_data{1})-1,1);
for i = 1:length(mar2015_ace_data{1})-1
    D = datenum(mar2015_ace_data{1}(i),1,1)+mar2015_ace_data{2}(i)-1;
    [Year,Month,Day] = datevec(D);
    timeline_mar2015_ace_data_diff(i) = datenum(Year,Month,Day,mar2015_ace_data{3}(i),0,0);
end
%----------------------------------- Construct 5 min data timeline --------------
timeline_mar2015_ace_data_5min = zeros(length(mar2015_ace_data_5min{1}),1);
for i = 1:length(mar2015_ace_data_5min{1})
    D = datenum(mar2015_ace_data_5min{1}(i),1,1)+mar2015_ace_data_5min{2}(i)-1;
    [Year,Month,Day] = datevec(D);
    timeline_mar2015_ace_data_5min(i) = datenum(Year,Month,Day,mar2015_ace_data_5min{3}(i),0,0);
end
%--------------------------------------------------------------------------
end