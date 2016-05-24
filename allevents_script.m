% startDate = datenum('2012-01-20'); endDate = datenum('2012-01-31');
clear all
close all
%-------------------------------
x = 1; % dummy variable
[d_jan2012_ace_data, d_jan2012_ace_model,...
    d_jan2012_ace_data_5min,...
    d_mar2015_ace_data, d_mar2015_ace_model,...
    d_mar2015_ace_data_5min] = load_allevents_fun(x);

[d_jan2012_ace_data, d_jan2012_ace_data_5min,... 
    d_mar2015_ace_data, d_mar2015_ace_data_5min] = removebaddata_fun(d_jan2012_ace_data,...
    d_jan2012_ace_data_5min,...
    d_mar2015_ace_data, d_mar2015_ace_data_5min);

[timeline_jan2012_ace_model, timeline_jan2012_ace_data,...
    timeline_jan2012_ace_model_diff, timeline_jan2012_ace_data_diff,...
    timeline_jan2012_ace_data_5min,...
    timeline_mar2015_ace_model, timeline_mar2015_ace_data,...
    timeline_mar2015_ace_model_diff, timeline_mar2015_ace_data_diff,...
    timeline_mar2015_ace_data_5min] = serialdatenumberarray_fun(d_jan2012_ace_model,...
    d_jan2012_ace_data, d_jan2012_ace_data_5min,...
    d_mar2015_ace_model, d_mar2015_ace_data, d_mar2015_ace_data_5min);

[jan2012_data_shock1, jan2012_data_shock1b, jan2012_model_shock1,...
    jan2012_data_shock2, jan2012_model_shock2,...
    mar2015_data_shock1, mar2015_model_shock1] = shockarrivaltime_fun(timeline_jan2012_ace_data_diff, timeline_jan2012_ace_model_diff,...
    timeline_mar2015_ace_data_diff, timeline_mar2015_ace_model_diff,...
    d_jan2012_ace_data, d_jan2012_ace_model,...
    d_mar2015_ace_data, d_mar2015_ace_model);

[Tp_jan2012, Tex_jan2012,...
    lapse1_jan2012, lapse2_jan2012, lapse3_jan2012,...
    Tp_mar2015, Tex_mar2015,...
    lapse1_mar2015, lapse2_mar2015, lapse3_mar2015, lapse4_mar2015, lapse5_mar2015,...
    lapse6_mar2015] = tp_depression_fun(d_jan2012_ace_data, timeline_jan2012_ace_data,...
    d_mar2015_ace_data, timeline_mar2015_ace_data);
%-------------------------------
d_jan2012_ace_data{14} = d_jan2012_ace_data{14}*1e-3; %conversion: K to kK

absB_jan2012_ace_model = zeros(1,length(d_jan2012_ace_model{11}));
for i = 1:length(d_jan2012_ace_model{11})
absB_jan2012_ace_model(1,i) = sqrt(((d_jan2012_ace_model{11}(i)).^2) + ((d_jan2012_ace_model{12}(i)).^2) + ((d_jan2012_ace_model{13}(i)).^2));
end
%-----------------------
d_mar2015_ace_data{14} = d_mar2015_ace_data{14}*1e-3; %conversion: K to kK

absB_mar2015_ace_model = zeros(1,length(d_mar2015_ace_model{11}));
for i = 1:length(d_mar2015_ace_model{11})
absB_mar2015_ace_model(1,i) = sqrt(((d_mar2015_ace_model{11}(i)).^2) + ((d_mar2015_ace_model{12}(i)).^2) + ((d_mar2015_ace_model{13}(i)).^2));
end
%---------------------------- Plotting ------------------------------------
%--------------------------------------------------------------------------
%---------------------------- JAN2012 EVENT -------------------------------
%--------------------------------------------------------------------------
%---------------------------- jan2012 event: Earth (ACE) ------------------
y1 = [200 1000]; y1_flip = [y1(1) y1(1) y1(2) y1(2)];
y2 = [0 60]; y2_flip = [y2(1) y2(1) y2(2) y2(2)];
figure('Name','jan2012 - ACE: Speed (high res.)','NumberTitle','off')
plot(timeline_jan2012_ace_data,d_jan2012_ace_data{10},':bo','MarkerSize',3);
hold on
plot(timeline_jan2012_ace_model,d_jan2012_ace_model{8},'r','linewidth',1)
hold on
plot([jan2012_data_shock1 jan2012_data_shock1], y1,'--b','linewidth',1)
hold on
plot([jan2012_model_shock1 jan2012_model_shock1], y1,'--r','linewidth',1)
hold on 
lowTp1_jan2012=patch([lapse1_jan2012(1) lapse1_jan2012(2) lapse1_jan2012(2) lapse1_jan2012(1)],y1_flip,'k');
set(lowTp1_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp2_jan2012=patch([lapse2_jan2012(1) lapse2_jan2012(2) lapse2_jan2012(2) lapse2_jan2012(1)],y1_flip,'k');
set(lowTp2_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp3_jan2012=patch([lapse3_jan2012(1) lapse3_jan2012(2) lapse3_jan2012(2) lapse3_jan2012(1)],y1_flip,'k');
set(lowTp3_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
hold on
plot([jan2012_data_shock1b jan2012_data_shock1b], y1,'--b','linewidth',1)
hold on
plot([jan2012_data_shock2 jan2012_data_shock2], y1,'--b','linewidth',1)
hold on
plot([jan2012_model_shock2 jan2012_model_shock2], y1,'--r','linewidth',1)
title('Speed')
xlabel('Date [January 2012]')
ylabel('Proton speed (v_r = |v|) [km/s]')
%customTicks = datenum(2012,1,20,0:264,0,0);
customTicks = datenum(2012,1,20:27,0,0,0);
set(gca, 'XTick', customTicks, 'FontSize', 9);
%datetick('x', 'dd-hh', 'keepticks')
datetick('x', 'dd', 'keepticks')
ylim(y1)
legalpha('ACE data', 'Model','Detected SAT','Predicted SAT','T_{p} depression','Location','NorthWest');
print(gcf,[pwd '/figures/eps/jan2012_ace_speed_highres'],'-depsc')

figure('Name','jan2012 - ACE: Density (high res.)','NumberTitle','off')
plot(timeline_jan2012_ace_data,d_jan2012_ace_data{13},':bo','MarkerSize',3);
hold on
plot(timeline_jan2012_ace_model,d_jan2012_ace_model{6},'r','linewidth',1)
hold on
plot([jan2012_data_shock1 jan2012_data_shock1], y2,'--b','linewidth',1)
hold on
plot([jan2012_model_shock1 jan2012_model_shock1], y2,'--r','linewidth',1)
hold on
lowTp1_jan2012=patch([lapse1_jan2012(1) lapse1_jan2012(2) lapse1_jan2012(2) lapse1_jan2012(1)],y2_flip,'k');
set(lowTp1_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp2_jan2012=patch([lapse2_jan2012(1) lapse2_jan2012(2) lapse2_jan2012(2) lapse2_jan2012(1)],y2_flip,'k');
set(lowTp2_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp3_jan2012=patch([lapse3_jan2012(1) lapse3_jan2012(2) lapse3_jan2012(2) lapse3_jan2012(1)],y2_flip,'k');
set(lowTp3_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
hold on
plot([jan2012_data_shock1b jan2012_data_shock1b], y2,'--b','linewidth',1)
hold on
plot([jan2012_data_shock2 jan2012_data_shock2], y2,'--b','linewidth',1)
hold on
plot([jan2012_model_shock2 jan2012_model_shock2], y2,'--r','linewidth',1)
title('Density')
xlabel('Date [January 2012]')
ylabel('Proton density [p/cc]')
customTicks = datenum(2012,1,20:27,0,0,0);
set(gca, 'XTick', customTicks, 'FontSize', 10);
datetick('x', 'dd', 'keepticks')
ylim(y2)
legalpha('ACE data', 'Model','Detected SAT','Predicted SAT','T_{p} depression','Location','NorthEast');
print(gcf,[pwd '/figures/eps/jan2012_ace_density_highres'],'-depsc')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y3 = [0 1700]; y3_flip = [y3(1) y3(1) y3(2) y3(2)];
y4 = [0 30]; y4_flip = [y4(1) y4(1) y4(2) y4(2)];
figure('Name','jan2012 - ACE: Temperature (high res.)','NumberTitle','off')
plot(timeline_jan2012_ace_data,d_jan2012_ace_data{14},':bo','MarkerSize',3);
hold on
plot(timeline_jan2012_ace_model,d_jan2012_ace_model{7},'r','linewidth',1)
hold on
plot([jan2012_data_shock1 jan2012_data_shock1], y3,'--b','linewidth',1)
hold on
plot([jan2012_model_shock1 jan2012_model_shock1], y3,'--r','linewidth',1)
hold on 
lowTp1_jan2012=patch([lapse1_jan2012(1) lapse1_jan2012(2) lapse1_jan2012(2) lapse1_jan2012(1)],y3_flip,'k');
set(lowTp1_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp2_jan2012=patch([lapse2_jan2012(1) lapse2_jan2012(2) lapse2_jan2012(2) lapse2_jan2012(1)],y3_flip,'k');
set(lowTp2_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp3_jan2012=patch([lapse3_jan2012(1) lapse3_jan2012(2) lapse3_jan2012(2) lapse3_jan2012(1)],y3_flip,'k');
set(lowTp3_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
hold on
plot([jan2012_data_shock1b jan2012_data_shock1b], y3,'--b','linewidth',1)
hold on
plot([jan2012_data_shock2 jan2012_data_shock2], y3,'--b','linewidth',1)
hold on
plot([jan2012_model_shock2 jan2012_model_shock2], y3,'--r','linewidth',1)
title('Temperature')
xlabel('Date [January 2012]')
ylabel('Ion temperature, [kK]')
customTicks = datenum(2012,1,20:27,0,0,0);
set(gca, 'XTick', customTicks, 'FontSize', 10);
datetick('x', 'dd', 'keepticks')
ylim(y3)
legalpha('ACE data', 'Model','Detected SAT','Predicted SAT','T_{p} depression','Location','NorthWest');
print(gcf,[pwd '/figures/eps/jan2012_ace_temp_highres'],'-depsc')

figure('Name','jan2012 - ACE: Magnetic Field Strength (high. res)','NumberTitle','off')
plot(timeline_jan2012_ace_data,d_jan2012_ace_data{9},':bo','MarkerSize',3);
hold on
plot(timeline_jan2012_ace_model,absB_jan2012_ace_model,'r','linewidth',1)
hold on
plot([jan2012_data_shock1 jan2012_data_shock1], y4,'--b','linewidth',1)
hold on
plot([jan2012_model_shock1 jan2012_model_shock1], y4,'--r','linewidth',1)
hold on 
lowTp1_jan2012=patch([lapse1_jan2012(1) lapse1_jan2012(2) lapse1_jan2012(2) lapse1_jan2012(1)],y4_flip,'k');
set(lowTp1_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp2_jan2012=patch([lapse2_jan2012(1) lapse2_jan2012(2) lapse2_jan2012(2) lapse2_jan2012(1)],y4_flip,'k');
set(lowTp2_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp3_jan2012=patch([lapse3_jan2012(1) lapse3_jan2012(2) lapse3_jan2012(2) lapse3_jan2012(1)],y4_flip,'k');
set(lowTp3_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
hold on
plot([jan2012_data_shock1b jan2012_data_shock1b], y4,'--b','linewidth',1)
hold on
plot([jan2012_data_shock2 jan2012_data_shock2], y4,'--b','linewidth',1)
hold on
plot([jan2012_model_shock2 jan2012_model_shock2], y4,'--r','linewidth',1)
title('|B|')
xlabel('Date [January 2012]')
ylabel('|B| [nT]')
customTicks = datenum(2012,1,20:27,0,0,0);
set(gca, 'XTick', customTicks, 'FontSize', 10);
datetick('x', 'dd', 'keepticks')
ylim(y4)
legalpha('ACE data', 'Model','Detected SAT','Predicted SAT','T_{p} depression','Location','NorthEast');
print(gcf,[pwd '/figures/eps/jan2012_ace_absmag_highres'],'-depsc')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y5 = [-25 25]; y5_flip = [y5(1) y5(1) y5(2) y5(2)];
figure('Name','jan2012 - ACE: Southward magnetic field component (Bz)','NumberTitle','off')
plot(timeline_jan2012_ace_data,d_jan2012_ace_data{8},':bo','MarkerSize',3);
hold on
plot(timeline_jan2012_ace_model,d_jan2012_ace_model{13},'r','linewidth',1);
hold on
plot([jan2012_data_shock1 jan2012_data_shock1], y5,'--b','linewidth',1)
hold on 
plot([jan2012_model_shock1 jan2012_model_shock1], y5,'--r','linewidth',1)
hold on
lowTp1_jan2012=patch([lapse1_jan2012(1) lapse1_jan2012(2) lapse1_jan2012(2) lapse1_jan2012(1)],y5_flip,'k');
set(lowTp1_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp2_jan2012=patch([lapse2_jan2012(1) lapse2_jan2012(2) lapse2_jan2012(2) lapse2_jan2012(1)],y5_flip,'k');
set(lowTp2_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp3_jan2012=patch([lapse3_jan2012(1) lapse3_jan2012(2) lapse3_jan2012(2) lapse3_jan2012(1)],y5_flip,'k');
set(lowTp3_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
hold on
plot([jan2012_data_shock1b jan2012_data_shock1b], y5,'--b','linewidth',1)
hold on
plot([jan2012_data_shock2 jan2012_data_shock2], y5,'--b','linewidth',1);
hold on
plot([jan2012_model_shock2 jan2012_model_shock2], y5,'--r','linewidth',1);
title('ACE B_N')
xlabel('Date [January 2012]')
ylabel('B_N [nT]')
customTicks = datenum(2012,1,20:27,0,0,0);
set(gca, 'XTick', customTicks, 'FontSize', 10);
datetick('x', 'dd', 'keepticks')
ylim(y5)
legalpha('ACE data', 'Model','Detected SAT','Predicted SAT','T_{p} depression','Location','NorthEast');
print(gcf,[pwd '/figures/eps/jan2012_ace_bz_highres'],'-depsc')

%--------------------------------------------------------------------------
%---------------------------- MAR2015 EVENT -------------------------------
%--------------------------------------------------------------------------
%---------------------------- mar2015 event: Earth (ACE) ------------------
y6 = [200 800]; y6_flip = [y6(1) y6(1) y6(2) y6(2)];
y7 = [0 45]; y7_flip = [y7(1) y7(1) y7(2) y7(2)];
figure('Name','mar2015 - ACE: Speed (high res.)','NumberTitle','off')
plot(timeline_mar2015_ace_data,d_mar2015_ace_data{10},':bo','MarkerSize',3);
hold on
plot(timeline_mar2015_ace_model,d_mar2015_ace_model{8},'r','linewidth',1)
hold on
plot([mar2015_data_shock1 mar2015_data_shock1], y6,'--b','linewidth',1)
hold on
plot([mar2015_model_shock1 mar2015_model_shock1], y6,'--r','linewidth',1)
hold on
lowTp1_mar2015=patch([lapse1_mar2015(1) lapse1_mar2015(2) lapse1_mar2015(2) lapse1_mar2015(1)],y6_flip,'k');
set(lowTp1_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp2_mar2015=patch([lapse2_mar2015(1) lapse2_mar2015(2) lapse2_mar2015(2) lapse2_mar2015(1)],y6_flip,'k');
set(lowTp2_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp3_mar2015=patch([lapse3_mar2015(1) lapse3_mar2015(2) lapse3_mar2015(2) lapse3_mar2015(1)],y6_flip,'k');
set(lowTp3_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp4_mar2015=patch([lapse4_mar2015(1) lapse4_mar2015(2) lapse4_mar2015(2) lapse4_mar2015(1)],y6_flip,'k');
set(lowTp4_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp5_mar2015=patch([lapse5_mar2015(1) lapse5_mar2015(2) lapse5_mar2015(2) lapse5_mar2015(1)],y6_flip,'k');
set(lowTp5_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
title('Bulk speed')
xlabel('Date [March 2015]')
ylabel('Bulk proton speed [km/s]')
%customTicks = [datenum(2015, 2, 28) datenum(2015, 3, 1:25)];
%customTicks = [datenum(2015, 2, 28) datenum(2015, 3, 5:4:25)];
customTicks = datenum(2015,3,15:20,0,0,0);
set(gca, 'XTick', customTicks, 'FontSize', 10);
%datetick('x', 'dd-mmm', 'keepticks')
datetick('x', 'dd', 'keepticks')
ylim(y6)
legalpha('ACE data', 'Model','Detected SAT','Predicted SAT','T_{p} depression','Location','NorthWest');
print(gcf,[pwd '/figures/eps/mar2015_ace_speed_highres'],'-depsc')

figure('Name','mar2015 - ACE: Density (high res.)','NumberTitle','off')
plot(timeline_mar2015_ace_data,d_mar2015_ace_data{13},':bo','MarkerSize',3);
hold on
plot(timeline_mar2015_ace_model,d_mar2015_ace_model{6},'r','linewidth',1)
hold on
plot([mar2015_data_shock1 mar2015_data_shock1], y7,'--b','linewidth',1)
hold on
plot([mar2015_model_shock1 mar2015_model_shock1], y7,'--r','linewidth',1)
hold on
lowTp1_mar2015=patch([lapse1_mar2015(1) lapse1_mar2015(2) lapse1_mar2015(2) lapse1_mar2015(1)],y7_flip,'k');
set(lowTp1_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp2_mar2015=patch([lapse2_mar2015(1) lapse2_mar2015(2) lapse2_mar2015(2) lapse2_mar2015(1)],y7_flip,'k');
set(lowTp2_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp3_mar2015=patch([lapse3_mar2015(1) lapse3_mar2015(2) lapse3_mar2015(2) lapse3_mar2015(1)],y7_flip,'k');
set(lowTp3_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp4_mar2015=patch([lapse4_mar2015(1) lapse4_mar2015(2) lapse4_mar2015(2) lapse4_mar2015(1)],y7_flip,'k');
set(lowTp4_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp5_mar2015=patch([lapse5_mar2015(1) lapse5_mar2015(2) lapse5_mar2015(2) lapse5_mar2015(1)],y7_flip,'k');
set(lowTp5_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
title('Density')
xlabel('Date [March 2015]')
ylabel('Proton density [p/cc]')
%customTicks = [datenum(2015, 2, 28) datenum(2015, 3, 1:25)];
%customTicks = [datenum(2015, 2, 28) datenum(2015, 3, 5:4:25)];
customTicks = datenum(2015,3,15:20,0,0,0);
set(gca, 'XTick', customTicks, 'FontSize', 10);
datetick('x', 'dd', 'keepticks')
%xlim(serialdatenumberarray([1 end]))
ylim(y7)
legalpha('ACE data', 'Model','Detected SAT','Predicted SAT','T_{p} depression','Location','NorthEast');
print(gcf,[pwd '/figures/eps/mar2015_ace_density_highres'],'-depsc')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y8 = [0 1000]; y8_flip = [y8(1) y8(1) y8(2) y8(2)];
y9 = [0 35]; y9_flip = [y9(1) y9(1) y9(2) y9(2)];
figure('Name','mar2015 - ACE: Temperature (high res.)','NumberTitle','off')
plot(timeline_mar2015_ace_data,d_mar2015_ace_data{14},':bo','MarkerSize',3);
hold on
plot(timeline_mar2015_ace_model,d_mar2015_ace_model{7},'r','linewidth',1)
hold on
plot([mar2015_data_shock1 mar2015_data_shock1], y8, '--b','linewidth',1)
hold on
plot([mar2015_model_shock1 mar2015_model_shock1], y8, '--r','linewidth',1)
hold on
lowTp1_mar2015=patch([lapse1_mar2015(1) lapse1_mar2015(2) lapse1_mar2015(2) lapse1_mar2015(1)],y8_flip,'k');
set(lowTp1_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp2_mar2015=patch([lapse2_mar2015(1) lapse2_mar2015(2) lapse2_mar2015(2) lapse2_mar2015(1)],y8_flip,'k');
set(lowTp2_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp3_mar2015=patch([lapse3_mar2015(1) lapse3_mar2015(2) lapse3_mar2015(2) lapse3_mar2015(1)],y8_flip,'k');
set(lowTp3_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp4_mar2015=patch([lapse4_mar2015(1) lapse4_mar2015(2) lapse4_mar2015(2) lapse4_mar2015(1)],y8_flip,'k');
set(lowTp4_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp5_mar2015=patch([lapse5_mar2015(1) lapse5_mar2015(2) lapse5_mar2015(2) lapse5_mar2015(1)],y8_flip,'k');
set(lowTp5_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
title('Temperature')
xlabel('Date [March 2015]')
ylabel('Ion temperature, [kK]')
%customTicks = [datenum(2015, 2, 28) datenum(2015, 3, 5:4:25)];
customTicks = datenum(2015,3,15:20,0,0,0);
set(gca, 'XTick', customTicks, 'FontSize', 10);
datetick('x', 'dd', 'keepticks')
ylim(y8)
legalpha('ACE data', 'Model','Detected SAT','Predicted SAT','T_{p} depression','Location','NorthWest');
print(gcf,[pwd '/figures/eps/mar2015_ace_temp_highres'],'-depsc')

figure('Name','mar2015 - ACE: Magnetic Field Strength (high res.)','NumberTitle','off')
plot(timeline_mar2015_ace_data,d_mar2015_ace_data{9},':bo','MarkerSize',3);
hold on
plot(timeline_mar2015_ace_model,absB_mar2015_ace_model,'r','linewidth',1)
hold on
plot([mar2015_data_shock1 mar2015_data_shock1], y9,'--b','linewidth',1)
hold on
plot([mar2015_model_shock1 mar2015_model_shock1], y9,'--r','linewidth',1)
hold on
lowTp1_mar2015=patch([lapse1_mar2015(1) lapse1_mar2015(2) lapse1_mar2015(2) lapse1_mar2015(1)],y9_flip,'k');
set(lowTp1_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp2_mar2015=patch([lapse2_mar2015(1) lapse2_mar2015(2) lapse2_mar2015(2) lapse2_mar2015(1)],y9_flip,'k');
set(lowTp2_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp3_mar2015=patch([lapse3_mar2015(1) lapse3_mar2015(2) lapse3_mar2015(2) lapse3_mar2015(1)],y9_flip,'k');
set(lowTp3_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp4_mar2015=patch([lapse4_mar2015(1) lapse4_mar2015(2) lapse4_mar2015(2) lapse4_mar2015(1)],y9_flip,'k');
set(lowTp4_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp5_mar2015=patch([lapse5_mar2015(1) lapse5_mar2015(2) lapse5_mar2015(2) lapse5_mar2015(1)],y9_flip,'k');
set(lowTp5_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
title('|B|')
xlabel('Date [March 2015]')
ylabel('|B| [nT]')
%customTicks = [datenum(2015, 2, 28) datenum(2015, 3, 5:4:25)];
customTicks = datenum(2015,3,15:20,0,0,0);
set(gca, 'XTick', customTicks, 'FontSize', 10);
datetick('x', 'dd', 'keepticks')
ylim(y9)
legalpha('ACE data', 'Model','Detected SAT','Predicted SAT','T_{p} depression','Location','NorthWest');
print(gcf,[pwd '/figures/eps/mar2015_ace_absmag_highres'],'-depsc')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y10 = [-25 25]; y10_flip = [y10(1) y10(1) y10(2) y10(2)];
figure('Name','mar2015 - ACE: Southward magnetic field components (Bz)','NumberTitle','off')
plot(timeline_mar2015_ace_data,d_mar2015_ace_data{8},':bo','MarkerSize',3);
hold on
plot(timeline_mar2015_ace_model,d_mar2015_ace_model{13},'r','linewidth',1);
hold on
plot([mar2015_data_shock1 mar2015_data_shock1], y10,'--b','linewidth',1)
hold on
plot([mar2015_model_shock1 mar2015_model_shock1], y10,'--r','linewidth',1)
hold on
lowTp1_mar2015=patch([lapse1_mar2015(1) lapse1_mar2015(2) lapse1_mar2015(2) lapse1_mar2015(1)],y10_flip,'k');
set(lowTp1_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp2_mar2015=patch([lapse2_mar2015(1) lapse2_mar2015(2) lapse2_mar2015(2) lapse2_mar2015(1)],y10_flip,'k');
set(lowTp2_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp3_mar2015=patch([lapse3_mar2015(1) lapse3_mar2015(2) lapse3_mar2015(2) lapse3_mar2015(1)],y10_flip,'k');
set(lowTp3_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp4_mar2015=patch([lapse4_mar2015(1) lapse4_mar2015(2) lapse4_mar2015(2) lapse4_mar2015(1)],y10_flip,'k');
set(lowTp4_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp5_mar2015=patch([lapse5_mar2015(1) lapse5_mar2015(2) lapse5_mar2015(2) lapse5_mar2015(1)],y10_flip,'k');
set(lowTp5_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
title('Stereo A B_N')
xlabel('Date [March 2015]')
ylabel('B_N [nT]')
customTicks = datenum(2015,3,15:20,0,0,0);
set(gca, 'XTick', customTicks, 'FontSize', 10);
datetick('x', 'dd', 'keepticks')
ylim(y10)
legalpha('ACE data', 'Model','Detected SAT','Predicted SAT','T_{p} depression','Location','NorthEast');
print(gcf,[pwd '/figures/eps/mar2015_ace_bz_highres'],'-depsc')
%------------------- mar2015 event: Stereo A data is either sporadic or unavailable ---------------------------
%---------------------------------------------------------------------------------------------------------------------------------------
figure('Name','Tp depression','NumberTitle','off')
subplot(2,1,1)
plot(timeline_jan2012_ace_data',Tex_jan2012,':go','MarkerSize',3);
hold on
plot(timeline_jan2012_ace_data',Tp_jan2012,':bo','MarkerSize',3);
hold on
lowTp1_jan2012=patch([lapse1_jan2012(1) lapse1_jan2012(2) lapse1_jan2012(2) lapse1_jan2012(1)],[0 0 1000 1000],'k');
set(lowTp1_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp2_jan2012=patch([lapse2_jan2012(1) lapse2_jan2012(2) lapse2_jan2012(2) lapse2_jan2012(1)],[0 0 1000 1000],'k');
set(lowTp2_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp3_jan2012=patch([lapse3_jan2012(1) lapse3_jan2012(2) lapse3_jan2012(2) lapse3_jan2012(1)],[0 0 1000 1000],'k');
set(lowTp3_jan2012,'FaceAlpha',0.1,'EdgeAlpha',0.3);
title('Temperature')
xlabel('Date [January 2012]')
ylabel('Ion temperature, [kK]')
customTicks = datenum(2012,1,20:27,0,0,0);
set(gca, 'XTick', customTicks, 'FontSize', 10);
datetick('x', 'dd', 'keepticks')
ylim([0 1000])
legalpha('T_{exp}','T_p data','T_{p} depression','Location','NorthWest');
saveas(gcf,[pwd '/figures/jan2012_tp_depression.png']); 

subplot(2,1,2)
plot(timeline_mar2015_ace_data',Tex_mar2015,':go','MarkerSize',3);
hold on
plot(timeline_mar2015_ace_data',Tp_mar2015,':bo','MarkerSize',3);
hold on
lowTp1_mar2015=patch([lapse1_mar2015(1) lapse1_mar2015(2) lapse1_mar2015(2) lapse1_mar2015(1)],[0 0 1000 1000],'k');
set(lowTp1_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp2_mar2015=patch([lapse2_mar2015(1) lapse2_mar2015(2) lapse2_mar2015(2) lapse2_mar2015(1)],[0 0 1000 1000],'k');
set(lowTp2_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp3_mar2015=patch([lapse3_mar2015(1) lapse3_mar2015(2) lapse3_mar2015(2) lapse3_mar2015(1)],[0 0 1000 1000],'k');
set(lowTp3_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp4_mar2015=patch([lapse4_mar2015(1) lapse4_mar2015(2) lapse4_mar2015(2) lapse4_mar2015(1)],[0 0 1000 1000],'k');
set(lowTp4_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
lowTp5_mar2015=patch([lapse5_mar2015(1) lapse5_mar2015(2) lapse5_mar2015(2) lapse5_mar2015(1)],[0 0 1000 1000],'k');
set(lowTp5_mar2015,'FaceAlpha',0.1,'EdgeAlpha',0.3);
title('Temperature')
xlabel('Date [March 2015]')
ylabel('Ion temperature, [kK]')
customTicks = datenum(2015,3,15:20,0,0,0);
set(gca, 'XTick', customTicks, 'FontSize', 10);
datetick('x', 'dd', 'keepticks')
ylim([0 1000])
legalpha('T_{exp}','T_{p} data','T_p depression','Location','NorthEast');
print(gcf,[pwd '/figures/eps/tp'],'-depsc')
%------------------------------------------------------------------
%------------------------------------------------------------------
%------------------------------------------------------------------
eruption_date1 = datestr(datenum({'01/18/2012';'01/19/2012';'01/23/2012';'03/15/2015'},'mm/dd/yyyy'),'dd mmm yyyy');
hourly_model_SAT = datevec([jan2012_model_shock1; jan2012_model_shock1; jan2012_model_shock2; mar2015_model_shock1]);
for i = 1:4
if hourly_model_SAT(i,5)<30;
    hourly_model_SAT(i,5) = 0;
else
    hourly_model_SAT(i,5) = 0;
    hourly_model_SAT(i,4) = hourly_model_SAT(i,4) + 1;
end
end
hourly_model_SAT;
model_SAT = datestr(hourly_model_SAT,'dd mmm yyyy, HH:MM');
data_SAT = [jan2012_data_shock1; jan2012_data_shock1b; jan2012_data_shock2; mar2015_data_shock1];
data_SAT = datestr(data_SAT,'dd mmm yyyy, HH:MM');

eruption_date = {eruption_date1(1,:); eruption_date1(2,:); eruption_date1(3,:); eruption_date1(4,:)};
SAT_date = {model_SAT(1,1:11);model_SAT(2,1:11);model_SAT(3,1:11);model_SAT(4,1:11)}; 
SAT_model = {model_SAT(1,14:18);model_SAT(2,14:18);model_SAT(3,14:18);model_SAT(4,14:18)}; 
SAT_data = {data_SAT(1,14:18);data_SAT(2,14:18);data_SAT(3,14:18);data_SAT(4,14:18)}; 
deltaT_in_hours = str2num(model_SAT(1:4,14:15))-str2num(data_SAT(1:4,14:15));
T = table(eruption_date, SAT_date, SAT_model,SAT_data,deltaT_in_hours)
%------------------------------------------------------------
%--- Proportionality between deltaT and v_initial ---
%------------------------------------------------------------
v_donki = [1020.0 2211.0 750]'; % km/s
half_width_donki = [62.0 45.0]'; % degrees
deltaT_in_hours_donki = deltaT_in_hours(2:4);

figure('Name','Proportionality analysis','NumberTitle','off')
subplot(2,1,1)
plot(v_donki, deltaT_in_hours_donki, 'b*')
hold on
plot([0 3000], [-7 -7],'Color', [0.2 0.2 0.2],'LineStyle','--')
hold on 
plot([0 3000], [7 7],'Color', [0.3 0.3 0.3],'LineStyle','--')
title('Proportionality between SAT delay and initial speed')
xlabel('Initial speed [km/s]')
ylabel('SAT delay [hours]')
axis([0 3000 -15 15])

subplot(2,1,2)
travel_time_data = [68 34 50]'; % h
travel_time_model = [60 34 61]'; % h
plot(v_donki, travel_time_model, 'r*')
hold on
plot(v_donki, travel_time_data,'b*')
title('Proportionality between travel time and initial speed')
xlabel('Initial speed [km/s]')
ylabel('Travel time [hours]')
legend('Predicted travel time', 'Real travel time','Location','NorthEast')
axis([0 3000 0 100])
print(gcf,[pwd '/figures/eps/prop'],'-depsc')