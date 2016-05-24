function [Tp_jan2012, Tex_jan2012,...
    lapse1_jan2012, lapse2_jan2012, lapse3_jan2012,...
    Tp_mar2015, Tex_mar2015,...
    lapse1_mar2015, lapse2_mar2015, lapse3_mar2015, lapse4_mar2015, lapse5_mar2015,...
    lapse6_mar2015] = tp_depression_fun(jan2012_ace_data, timeline_jan2012_ace_data,...
    mar2015_ace_data, timeline_mar2015_ace_data)

%--------------- jan2012 event -----------------
R = 1; % AU
v_jan2012 = jan2012_ace_data{10}; %km/s
Tp_jan2012 = jan2012_ace_data{14}.*1e-3;
Tex_jan2012 = zeros(1,length(v_jan2012));
for i = 1:length(v_jan2012)
    if v_jan2012(i) < 500
        Tex_jan2012(1, i) = (((0.0106*v_jan2012(i))-0.278)^3)/R;
    else
        Tex_jan2012(1, i) = (((0.77*v_jan2012(i))-265))/R;
    end
end
t_jan2012 = zeros(2,length(Tex_jan2012));
for i = 1:length(Tex_jan2012)
t_jan2012(1,i) = Tex_jan2012(i)*(Tex_jan2012(i)>=2*Tp_jan2012(i));
t_jan2012(2,i) = Tp_jan2012(i)*(Tp_jan2012(i)<=0.5*Tex_jan2012(i));
end
t_jan2012_data_1 = find(timeline_jan2012_ace_data>=datenum(2012,1,22,1,0,0),1,'first');
t_jan2012_data_end = find(timeline_jan2012_ace_data>=datenum(2012,1,25,0,0,0),1,'first');
t_jan2012_data_first_interval = t_jan2012_data_1:t_jan2012_data_end;
sig_jan2012 = t_jan2012(1,t_jan2012_data_first_interval);
a = find(sig_jan2012);
p=find(diff(a)>1);
lapse_jan2012(1,:) = [a(1) a(p(1))]; 
lapse_jan2012(2,:) = [a(p(1)+1) a(p(2))];
lapse_jan2012(3,:) = [a(p(2)+1) a(end)];
lapse1_jan2012 = timeline_jan2012_ace_data(t_jan2012_data_first_interval(lapse_jan2012(1,:)))';
lapse2_jan2012 = timeline_jan2012_ace_data(t_jan2012_data_first_interval(lapse_jan2012(2,:)))';
lapse3_jan2012 = timeline_jan2012_ace_data(t_jan2012_data_first_interval(lapse_jan2012(3,:)))';
%------------- mar2015 event --------------------
v_mar2015 = mar2015_ace_data{10}; %km/s
Tp_mar2015 = mar2015_ace_data{14}.*1e-3;
Tex_mar2015 = zeros(1,length(v_mar2015));
for i = 1:length(v_mar2015)
    if v_mar2015(i) < 500
        Tex_mar2015(1, i) = (((0.0106*v_mar2015(i))-0.278)^3)/R;
    else
        Tex_mar2015(1, i) = (((0.77*v_mar2015(i))-265))/R;
    end
end
t_mar2015 = zeros(2,length(Tex_mar2015));
for i = 1:length(Tex_mar2015)
t_mar2015(1,i) = Tex_mar2015(i)*(Tex_mar2015(i)>=2*Tp_mar2015(i));
t_mar2015(2,i) = Tp_mar2015(i)*(Tp_mar2015(i)<=0.5*Tex_mar2015(i));
end
t_mar2015_data_1 = find(timeline_mar2015_ace_data>=datenum(2015,3,15,0,0,0),1,'first');
t_mar2015_data_end = find(timeline_mar2015_ace_data>=datenum(2015,3,20,0,0,0),1,'first');
t_mar2015_data_first_interval = t_mar2015_data_1:t_mar2015_data_end;
sig_mar2015 = t_mar2015(1,t_mar2015_data_first_interval);
b = find(sig_mar2015);
q=find(diff(b)>1);
lapse_mar2015(1,:) = [b(1) b(q(1))]; 
lapse_mar2015(2,:) = [b(q(1)+1) b(q(2))];
lapse_mar2015(3,:) = [b(q(2)+1) b(q(3))];
lapse_mar2015(4,:) = [b(q(3)+1) b(q(4))];
lapse_mar2015(5,:) = [b(q(4)+1) b(q(5))];
lapse_mar2015(6,:) = [b(q(5)+1) b(end)];
lapse1_mar2015 = timeline_mar2015_ace_data(t_mar2015_data_first_interval(lapse_mar2015(1,:)))';
lapse2_mar2015 = timeline_mar2015_ace_data(t_mar2015_data_first_interval(lapse_mar2015(2,:)))';
lapse3_mar2015 = timeline_mar2015_ace_data(t_mar2015_data_first_interval(lapse_mar2015(3,:)))';
lapse4_mar2015 = timeline_mar2015_ace_data(t_mar2015_data_first_interval(lapse_mar2015(4,:)))';
lapse5_mar2015 = timeline_mar2015_ace_data(t_mar2015_data_first_interval(lapse_mar2015(5,:)))';
lapse6_mar2015 = timeline_mar2015_ace_data(t_mar2015_data_first_interval(lapse_mar2015(6,:)))';
end