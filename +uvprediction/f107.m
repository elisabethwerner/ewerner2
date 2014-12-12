% Curve fit to f10.7 data using predefined sum-of-sines function 'sin2'.
clear all
close all

% Set time interval for f10.7 data.
tint=[irf_time([1972 01 01 0 0 0]) irf_time([2014 01 01 0 0 0])];
% Load f10.7 data for specified time interval.
fb=irf_get_data_omni(tint,'f10.7');
% Convert omni time format into Matlab datenum format and store time in t2.
t2=irf_time(fb(:,1),'datenum'); 
% SSN data are stored in y2.
y2=sqrt(fb(:,2)); 
y2=y2(:);
t2=t2(:);

% Computing the best-fit sum-of-sines function for f10.7 data on given time
% interval. General function Sin2:   f = a1*sin(b1*x+c1) + a2*sin(b2*x+c2).

u = ~isnan(t2) & ~isnan(y2);
f2=fit(t2(u),y2(u),'sin2');

% Set prediction time interval.
start_date = datenum(1972,01,01,0,0,0);
end_date = datenum(2027,01,01,0,0,0);
interval = 60/24/60;
date1 = [start_date:interval:end_date];
date1 = date1(:);
% Plotting fitted function on prediction time interval.
r2 = predictionsin2(date1,f2);
r2 = r2.^2;

% Plotting f10.7 data, Sin2 fit and prediction in figure.
plot(t2, y2.^2, 'color', [0.2,0.7,0.0])
hold on 
plot(date1, r2,'k')
datetick('x','yyyy')
legend('f10.7 data', 'Sin2-fitted function')
legend('boxoff')
title('10.7 cm Solar Flux Forecast (1972-2027)')
ylabel('f10.7 index [10^{-22} W\cdotm^{-2}Hz^{-1}]')
xlabel('Year')

