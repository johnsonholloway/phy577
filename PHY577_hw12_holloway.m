%% hw12 filtering
close all 
clear all

M=9;
filt = [1:1:10 9:-1:1];
filt= filt/sum(filt)
N=1000;
n=[0:N/2];

dt=1;
sum1=sum(filt/sum(filt));


for j=[1:length(n)]
    omega(j)=(2*pi*j)/(N*dt);
end
r=[0];
WW=zeros(size(omega));

for iomega=1:N/2
    for d=[1:(length(filt)-1)/2]
        WW(iomega)=WW(iomega) + 2*filt(d)*cos(omega(iomega)*d*dt);
    end 
    WW(iomega)=WW(iomega) + filt(10);
end


% for l=[1:19]
%     W(l)=admittance(filt(l),Om(l),k(l),dt);
%     weights(l)=sum(W(l)*exp(i*Om(l)*k(l)*dt));
% end 
figure()
subplot(211)
plot(filt,'o')
title('Triangular Filter')
subplot(212)
plot(WW)
title('Admittance Function')
%%

t=[1:1:9];
filt2 = exp(-(0.3*t)); 
filt2 = [filt2(end:-1:1) 1 filt2];
filt2 = filt2/sum(filt2);


for j=[1:length(n)]
    omega2(j)=(2*pi*j)/(N*dt);
end
WW2=zeros(size(omega2));
for iomega=1:N/2
    for d=[1:(length(filt2)-1)/2]
        WW2(iomega)=WW2(iomega) + 2*filt2(d)*cos(omega(iomega)*d*dt);
    end 
    WW2(iomega)=WW2(iomega) + filt2(10);
end

figure()
subplot(211)
plot(filt2,'o')
title('Exponential Filter')
subplot(212)
plot(WW2)
title('Admittance Function')
%%
filt3 = [1:1:10 zeros(1,9)];
filt3 = filt3/sum(filt3);

sum3=sum(filt3/sum(filt3));

for j=[1:length(n)]
    omega3(j)=(2*pi*j)/(N*dt);
end

WW3=zeros(size(omega2));
for iomega=1:N/2
    for d=[1:length(filt2)]
        WW3(iomega)=filt2(d)*exp(-i*omega3(iomega)*d*dt);
    end
end

figure()
subplot(211)
plot(filt3,'o')
title('Asymmertic  Filter')
subplot(212)
plot(abs(WW3))
title('Admittance Function')
% 
%% 
T=[200,100,50,25,12.5,6.25];


t1=[0:1:100];
for i =1:length(T)
    
    y1=sin(2*pi*t1/T(i));


    x1=conv(y1,filt2);
    x1=x1(M:(length(x1)-1)-M);
    hold off
    
    
    plot(t1,y1)
    hold on 
    plot(t1,x1,'r')
    
    title('Exponential  Filter')
  
    legend('original','filterd' )

    pause()
    
end 




