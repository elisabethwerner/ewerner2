% Curve fit to SSN data using predefined sum-of-sines function 'sin2'.
clear all
close all

% Set time interval for SSN data.
tint=[irf_time([1992 01 01 0 0 0]) irf_time([2014 01 01 0 0 0])];
% Load SSN data for specified time interval.
fa=irf_get_data_omni(tint,'ssn');
% Convert omni time format into Matlab datenum format and store time in t.
t=irf_time(fa(:,1),'datenum'); 
% SSN data are stored in y.
y=fa(:,2);  
y=y(:);
t=t(:);

% Computing the best-fit sum-of-sines function for SSN data on given time
% interval. General function Sin2:   f = a1*sin(b1*x+c1) + a2*sin(b2*x+c2).
f=fit(t,y,'sin2');

% Set prediction time interval.
start_date = datenum(1992,01,01,0,0,0);
end_date = datenum(2025,01,01,0,0,0);
interval = 60/24/60;
date1 = [start_date:interval:end_date];
date1 = date1(:);
% Plotting fitted function on prediction time interval.
r = predictionsin2(date1,f);

% Plotting SSN data, Sin2 fit and prediction in figure.
plot(t, y, 'g')
hold on
plot(f, 'm')
hold on 
plot(date1, r,'m')
datetick('x','dd-mm-yy')
ylabel('Solar Sunspot Number, R')
legend('SSN data', 'Sin2-fitted function')
xlim([min(t),max(t)]);
datetick('x','dd-mm-yy')
ylabel('Solar Sunspot Number, R')
xlabel('Year-Month-Day')

