

[tidestruc,pout]=t_tide(WaterLevel);
date=[datenum(2015,11,15):.04166:datenum(2016,11,11)]';

subplot(311)

plot(date(1:length(WaterLevel)),WaterLevel)
xlim([7.363*10^5 7.3635*10^5])
legend('  Original TS')
title('Mobile Sate Dock Tides')
subplot(312) 

plot(date(1:length(WaterLevel)),pout,'g')
xlim([7.363*10^5 7.3635*10^5])
legend('Tidal Pred')


subplot(313)
plot(date(1:length(WaterLevel)),WaterLevel-pout,'r')
xlim([7.363*10^5 7.3635*10^5])
legend('Original TS - Tidal Pred')




indx=find(~isnan(WaterLevel));
var(WaterLevel(indx))

