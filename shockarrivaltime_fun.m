function [jan2012_data_shock1, jan2012_data_shock1b, jan2012_model_shock1,...
    jan2012_data_shock2, jan2012_model_shock2,...
    mar2015_data_shock1, mar2015_model_shock1] = shockarrivaltime_fun(timeline_jan2012_ace_data_diff, timeline_jan2012_ace_model_diff,...
    timeline_mar2015_ace_data_diff, timeline_mar2015_ace_model_diff,...
    jan2012_ace_data, jan2012_ace_model,...
    mar2015_ace_data, mar2015_ace_model)
%--------------------------------------------------------------------------
%----------------------------------- Compute the shock arrival time -------------
%--------------------------------------------------------------------------
%----------------------------------- JAN2012 EVENT ------------------------
%--------------------------------------------------------------------------
%----------------------------------- jan2012 event: Earth (ACE) -----------
%----------------------- obs! two shocks ---------------
jan2012_data_first_1 = find(timeline_jan2012_ace_data_diff>=datenum(2012,1,21,0,0,0),1,'first');
jan2012_data_first_end = find(timeline_jan2012_ace_data_diff>=datenum(2012,1,23,0,0,0),1,'first');
jan2012_data_second_1 = find(timeline_jan2012_ace_data_diff>=datenum(2012,1,24,0,0,0),1,'first');
jan2012_data_second_end = find(timeline_jan2012_ace_data_diff>=datenum(2012,1,25,0,0,0),1,'first');
jan2012_data_first_interval = jan2012_data_first_1:jan2012_data_first_end;
jan2012_data_second_interval = jan2012_data_second_1:jan2012_data_second_end;
%-----------------------------------
jan2012_model_first_1 = find(timeline_jan2012_ace_model_diff>=datenum(2012,1,21,0,0,0),1,'first');
jan2012_model_first_end = find(timeline_jan2012_ace_model_diff>=datenum(2012,1,23,0,0,0),1,'first');
jan2012_model_second_1 = find(timeline_jan2012_ace_model_diff>=datenum(2012,1,24,0,0,0),1,'first');
jan2012_model_second_end = find(timeline_jan2012_ace_model_diff>=datenum(2012,1,25,0,0,0),1,'first');
jan2012_model_first_interval = jan2012_model_first_1:jan2012_model_first_end;
jan2012_model_second_interval = jan2012_model_second_1:jan2012_model_second_end;
%-----------------------------------
%------------- data --------------
jan2012_data_k_a = max(diff(jan2012_ace_data{10}(jan2012_data_first_interval)));
jan2012_data_k_b = max(diff(jan2012_ace_data{10}(jan2012_data_second_interval)));
jan2012_data_kind_a = find(diff(jan2012_ace_data{10})==jan2012_data_k_a,1,'first');
jan2012_data_kind_b = find(diff(jan2012_ace_data{10})==jan2012_data_k_b,1,'first');

p = diff(jan2012_ace_data{13}(jan2012_data_first_interval)); svals = sort(p(:),'descend');
%II = ind2sub([48,1],idx(2)); % find second largest diff value
jan2012_data_kind_c = find(diff(jan2012_ace_data{13})==svals(2),1,'first');

jan2012_data_shock1 = timeline_jan2012_ace_data_diff(jan2012_data_kind_a);
jan2012_data_shock2 = timeline_jan2012_ace_data_diff(jan2012_data_kind_b);
jan2012_data_shock1b = timeline_jan2012_ace_data_diff(jan2012_data_kind_c);
%------------- model --------------
jan2012_model_k_a = max(diff(jan2012_ace_model{8}(jan2012_model_first_interval)));
jan2012_model_k_b = max(diff(jan2012_ace_model{8}(jan2012_model_second_interval)));
jan2012_model_kind_a = find(diff(jan2012_ace_model{8})==jan2012_model_k_a,1,'first');
jan2012_model_kind_b = find(diff(jan2012_ace_model{8})==jan2012_model_k_b,1,'first');
jan2012_model_shock1 = timeline_jan2012_ace_model_diff(jan2012_model_kind_a);
jan2012_model_shock2 = timeline_jan2012_ace_model_diff(jan2012_model_kind_b);
%--------------------------------------------------------------------------
%----------------------------------- MAR2015 EVENT ------------------------
%--------------------------------------------------------------------------
%----------------------------------- mar2015 event: Earth (ACE) -----------
mar2015_data_1 = find(timeline_mar2015_ace_data_diff>=datenum(2015,3,15,0,0,0),1,'first');
mar2015_data_end = find(timeline_mar2015_ace_data_diff>=datenum(2015,3,20,0,0,0),1,'first');
mar2015_data_interval = mar2015_data_1:mar2015_data_end;
%-----------------------------------
mar2015_model_1 = find(timeline_mar2015_ace_model_diff>=datenum(2015,3,15,0,0,0),1,'first');
mar2015_model_end = find(timeline_mar2015_ace_model_diff>=datenum(2015,3,20,0,0,0),1,'first');
mar2015_model_interval = mar2015_model_1:mar2015_model_end;
%-----------------------------------
%------------- data --------------
mar2015_data_k = max(diff(mar2015_ace_data{10}(mar2015_data_interval)));
mar2015_data_kind = find(diff(mar2015_ace_data{10})==mar2015_data_k,1,'first');
mar2015_data_shock1 = timeline_mar2015_ace_data_diff(mar2015_data_kind);
%------------- model --------------
mar2015_model_k = max(diff(mar2015_ace_model{8}(mar2015_model_interval)));
mar2015_model_kind = find(diff(mar2015_ace_model{8})==mar2015_model_k,1,'first');
mar2015_model_shock1 = timeline_mar2015_ace_model_diff(mar2015_model_kind);
%--------------------------------------------------------------------------
end