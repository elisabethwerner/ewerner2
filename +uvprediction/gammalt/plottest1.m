clear all
close all

%the ssn and f10.7 index are plotted against time in this bit of code.

% Initialize figure
h=irf_plot(2,'newfigure'); % h= irf_plot(number_of_subplots,'newfigure');
tint=[irf_time([2013 01 01 0 0 0]) irf_time([2013 11 01 23 59 0])];
fa=irf_get_data_omni(tint,'ssn','omni2');
fb=irf_get_data_omni(tint,'f10.7','omni2');
tint=tint(:);

irf_plot(h(1),fa)
ylabel(h(1),'Solar Sunspot Number, R')
irf_timeaxis(h(1),'nolabels')

irf_plot(h(2),fb)
ylabel(h(2),'f10.7 index [10^{-22} W\cdotm^{-2}Hz^{-1}]')

%fafa=fa(:,1)
