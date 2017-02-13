% PHY577 hw10 part 2 
clear all
close all

t=[0:1:1000]/100;

x1=sin(2*pi*t);
x2=x1+.05*rand(size(x1));
x3=cos(2*pi*t);

figure()
plot(t,x1,'*b')
hold on 
plot(t,x2,'.r')
plot(t,x3,'xg')

xlabel('time')
title('original data')
legend('x1','x2','x3')

D=cat(1,x1,x2,x3);
C=(1/length(x1))*D*D';

[evecs,evals]=eig(C);

amps=D'*evals;
figure()
plot(t,amps)
legend('mode 1','mode 2','mode 3')
title('amplitudes of the modes as a funtion of time ')
xlabel('time')

X1=((x1-mean(x1))/std(x1));
X2=((x2-mean(x2))/std(x2));
X3=((x3-mean(x3))/std(x3));

figure()
plot(t,X1,'*')
hold on 
plot(t,X2,'r')
plot(t,X3,'g')


xlabel('time')
title('normalized data')
legend('X1','X2','X3')

