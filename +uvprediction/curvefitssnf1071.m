% curve fit till ssn-datan

tint=[irf_time([2011 01 01 0 0 0]) irf_time([2014 02 01 0 0 0])];
fa=irf_get_data_omni(tint,'ssn');
y=fa(:,2);                             
time_int=irf_time(fa(:,1),'datenum'); 

f=fit(time_int,y,'sin2','Lower',[0,0])
figure(01)
plot(f,time_int,y)
datetick('x','dd-mm-yy')
ylabel('Solar Sunspot Number, R')

% curve fit till f10.7-datan

fb=irf_get_data_omni(tint,'f10.7');               
ys=fb(:,2);                           
x=irf_time(fb(:,1),'datenum'); 

t = ~isnan(x) & ~isnan(ys);         % stötte på ett par NaN-värden i datan
fs=fit(x(t),ys(t),'sin2','Lower',[0,0])
figure(02)
plot(fs,x,ys)
datetick('x','dd-mm-yy')
ylabel('f10.7 index [10^{-22} W\cdotm^{-2}Hz^{-1}]')