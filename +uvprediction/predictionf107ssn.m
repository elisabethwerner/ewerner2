clear all
close all

% curve fit till ssn-datan

tint=[irf_time([1994 01 01 0 0 0]) irf_time([2014 01 01 0 0 0])];
fa=irf_get_data_omni(tint,'ssn');
y=fa(:,2);                             
time_int=irf_time(fa(:,1),'datenum'); 

start_date = datenum(1994,01,01,0,0,0);
end_date = datenum(2024,01,01,0,0,0);
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

% curve fit till f10.7-datan

fb=irf_get_data_omni(tint,'f10.7');               
ys=fb(:,2);                           
x=irf_time(fb(:,1),'datenum'); 

t = ~isnan(x) & ~isnan(ys);         % stötte på ett par NaN-värden i datan
fs=fit(x(t),ys(t),'sin2','Lower',[0,0])
r2 = prediction1(date1,fs);

figure(02)
plot(date1, r2,'r')
hold on
plot(fs,'r',x,ys,'g')
datetick('x','dd-mm-yy')
ylabel('f10.7 index [10^{-22} W\cdotm^{-2}Hz^{-1}]')

