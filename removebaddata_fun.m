function [jan2012_ace_data, jan2012_ace_data_5min,...
    mar2015_ace_data, mar2015_ace_data_5min] = removebaddata_fun(jan2012_ace_data,...
    jan2012_ace_data_5min,...
    mar2015_ace_data, mar2015_ace_data_5min)
%----------------------------------- Remove bad or missing data ------------
%----------------------------------- ACE ----------------
jan2012_ace_data{6}(jan2012_ace_data{6}==999.9) = NaN;
jan2012_ace_data{7}(jan2012_ace_data{7}==999.9) = NaN;
jan2012_ace_data{8}(jan2012_ace_data{8}==999.9) = NaN;
jan2012_ace_data{9}(jan2012_ace_data{9}==999.9) = NaN;
jan2012_ace_data{10}(jan2012_ace_data{10}==9999.) = NaN;
jan2012_ace_data{13}(jan2012_ace_data{13}==999.9) = NaN;
jan2012_ace_data{14}(jan2012_ace_data{14}==9999999.) = NaN;
%-----------
jan2012_ace_data_5min{27}(jan2012_ace_data_5min{27}==9999999.) = NaN;
jan2012_ace_data_5min{22}(jan2012_ace_data_5min{22}==99999.9) = NaN;
%-----------
mar2015_ace_data{6}(mar2015_ace_data{6}==999.9) = NaN;
mar2015_ace_data{7}(mar2015_ace_data{7}==999.9) = NaN;
mar2015_ace_data{8}(mar2015_ace_data{8}==999.9) = NaN;
mar2015_ace_data{9}(mar2015_ace_data{9}==999.9) = NaN;
mar2015_ace_data{10}(mar2015_ace_data{10}==9999.) = NaN;
mar2015_ace_data{13}(mar2015_ace_data{13}==999.9) = NaN;
mar2015_ace_data{14}(mar2015_ace_data{14}==9999999.) = NaN;
%-----------
mar2015_ace_data_5min{27}(mar2015_ace_data_5min{27}==9999999.) = NaN;
mar2015_ace_data_5min{22}(mar2015_ace_data_5min{22}==99999.9) = NaN;
%------------
end