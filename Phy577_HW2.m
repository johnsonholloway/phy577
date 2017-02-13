%Phy577_hw2 Temperature


t1=[0:3:42]';
time1=single(t1);

t2=[0:3:42]';
time2=single(t2);

temp1=[26 16 12 9 6 4 3 3 3 2 2 2 2 2 2]';
Tem1=single(temp1);

temp2=[26 6.7 2.8 2 1.6 1.3 1.2 1 1 1 1 1 1 .8 .7 ]';
Tem2=single(temp2);

figure(1)
%model=(time1,Tem1,'exp1')

plot(time1,Tem1,'b*')


title('Alcohol Thermometer Icebath: Temp vs Time ');
xlabel('Time (S)');
ylabel('Temp (C)');

figure(2)
%model2=fitlm(t2,temp2)
plot(t2,temp2,'r*')

title('Digital Thermometer Icebath: Temp vs Time');
xlabel('Time (S)');
ylabel('Temp (C)');