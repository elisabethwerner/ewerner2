clear all
close all
% curve fit och till ssn-datan

tint=[irf_time([2001 01 01 0 0 0]) irf_time([2006 01 01 0 0 0])];
fa=irf_get_data_omni(tint,'ssn');
y=fa(:,2);                             
time_int=irf_time(fa(:,1),'datenum'); 

start_date = datenum(2001,01,01,0,0,0);
end_date = datenum(2010,01,01,0,0,0);
interval = 60/24/60;
date1 = [start_date:interval:end_date];
date1 = date1(:);

f=fit(time_int,y,'sin2','Lower',[0,0])
r = prediction1(date1,f);

figure(01)
plot(date1, r,'r')
hold on
plot(f,'r',time_int,y,'g')
datetick('x','dd-mm-yy')
ylabel('Solar Sunspot Number, R')
