function yfit_pred = predictionlsf(time_int,coeff)
t = time_int(:);
a = coeff(1);
b = coeff(2);
c = coeff(3);
freq = 1/4500;
yfit_pred = (a*1)+(b*sin(2*pi*freq*t))+(c*cos(2*pi*freq*t));