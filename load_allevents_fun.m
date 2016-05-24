function [jan2012_ace_data, jan2012_ace_model,...
    jan2012_ace_data_5min,...
    mar2015_ace_data, mar2015_ace_model,...
    mar2015_ace_data_5min] = load_allevents_fun(x)
yn = 2*x;
%--------------------------------------------------------------------------
%----------------------------------- JAN2012 EVENT ------------------------
%--------------------------------------------------------------------------
%----------------------------------- jan2012 event: Earth (ACE) -----------
%----------------------------------- Load model data ----------------------
f_jan2012_ace_model = fopen([pwd, '\model\jan2012\evo_earth_20120120T00.dat'],'r');
jan2012_ace_model = textscan(f_jan2012_ace_model, '%f%s%f%f%f%f%f%f%f%f%f%f%f%f', 'HeaderLines',20);
fclose(f_jan2012_ace_model);
%----------------------------------- Load mag & swepam 1h data ------------
f_jan2012_ace_data = fopen([pwd, '\data\ace_omni2\jan2012\omni_m2012.dat.txt'],'r');
jan2012_ace_data = textscan(f_jan2012_ace_data, '%f%f%f%f%f%f%f%f%f%f%f%f%f%f');
fclose(f_jan2012_ace_data);

f_jan2012_ace_data_5min = fopen([pwd, '\data\ace_omni2\jan2012\omni_5min2012.txt'],'r');
jan2012_ace_data_5min = textscan(f_jan2012_ace_data_5min, '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f');
fclose(f_jan2012_ace_data_5min);
%--------------------------------------------------------------------------
%----------------------------------- MAR2015 EVENT ------------------------
%--------------------------------------------------------------------------
%----------------------------------- mar2015 event: Earth (ACE) -----------
%----------------------------------- Load model data ----------------------
f_mar2015_ace_model = fopen([pwd, '\model\mar2015\evo_Earth_201503.dat'],'r');
mar2015_ace_model = textscan(f_mar2015_ace_model, '%f%s%f%f%f%f%f%f%f%f%f%f%f%f', 'HeaderLines',20);
fclose(f_mar2015_ace_model);
%----------------------------------- Load mag & swepam 1h data ------------
f_mar2015_ace_data = fopen([pwd, '\data\ace_omni2\mar2015\omni_m2015.dat.txt'],'r');
mar2015_ace_data = textscan(f_mar2015_ace_data, '%f%f%f%f%f%f%f%f%f%f%f%f%f%f');
fclose(f_mar2015_ace_data);
%----------------------------------------------
f_mar2015_ace_data_5min = fopen([pwd, '\data\ace_omni2\mar2015\omni_5min2015.txt'],'r');
mar2015_ace_data_5min = textscan(f_mar2015_ace_data_5min, '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f');
fclose(f_mar2015_ace_data_5min);
end