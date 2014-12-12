% Curve fit to SSN data using "least square fit" (LSF).
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

% Method used to find the least square fit:

% Set an approximate frequency of the SSN data.
freq = 1/4500;
% Model function:   y = a*1 + b*sin(2*pi*freq*t) + c*cos(2*pi*freq*t)
% Store the three base vectors in an array F
F1 = ones(size(t));
F2 = sin(2*pi*freq*t);
F3 = cos(2*pi*freq*t);
F  = [F1,F2,F3];
% Use the backslash operator to find the fit parameters k = [a b c].
k = F\y;
% The fitted function, or least square fit, may then be calculated.
yfit = F*k;

% Set prediction time interval.
start_date = datenum(1992,01,01,0,0,0);
end_date = datenum(2025,01,01,0,0,0);
interval = 60/24/60;
date1 = start_date:interval:end_date;
date1 = date1(:);
% Plotting least square fit on prediction time interval.
r = predictionlsf(date1,k);

% Plotting SSN data, least square fit and prediction in figure.
plot(t, y, 'Color', [1 .6 0]);
hold on
plot(t, yfit, 'b', 'LineWidth', 1.5); 
hold on
plot(date1, r, 'b', 'LineWidth', 1.5);
legend('SSN data', 'Least square fit')
xlim([min(t),max(t)]);
datetick('x','dd-mm-yy')
ylabel('Solar Sunspot Number, R')
xlabel('Year-Month-Day')

