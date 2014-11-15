clear all
close all

% curve fit till ssn-datan

tint=[irf_time([2003 01 01 0 0 0]) irf_time([2013 06 01 0 0 0])];
fa=irf_get_data_omni(tint,'ssn');
y=fa(:,2);                             %y-data/ssn-data
time_int=irf_time(fa(:,1),'datenum'); %x-data/t-data

f=fit(time_int,y,'sin2','Lower',[0,0])
plot(f,time_int,y)
datetick('x','dd-mm-yy')
ylabel('Solar Sunspot Number, R')