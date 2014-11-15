clear all
close all

% curve fit till f10.7-datan

tint=[irf_time([2011 01 01 0 0 0]) irf_time([2014 01 05 0 0 0])];
fb=irf_get_data_omni(tint,'f10.7');               
y=fb(:,2);                            %f10.7
x=irf_time(fb(:,1),'datenum'); 

%plot(x,y)
%datetick('x','dd-mm-yy')

t = ~isnan(x) & ~isnan(y);
f=fit(x(t),y(t),'sin3','Lower',[0,0])
%f=fit(x,y,'sin3','Lower',[0,0])
plot(f,x,y)
datetick('x','dd-mm-yy')
ylabel('f10.7 index [10^{-22} W\cdotm^{-2}Hz^{-1}]')


%t = ~isnan(x) & ~isnan(y);
%bcurve=fit(x(t),y(t),'sin2')