close all 
clear all

X=[-100:1:100];
Y=X + (100*rand(size(X)));

plot(X,Y,'*b')
axis equal


theta=[0:pi/12:2*pi];
N=length(X);
Xprime=zeros(13,201);
Yprime=zeros(13,201);

xvar=zeros(length(theta),1);
yvar=zeros(length(theta),1);

for i=1:length(theta) 
    Xprime(i,:)=(X*cos(theta(i))+Y*sin(theta(i)));
    Yprime(i,:)=(-X*sin(theta(i))+Y*cos(theta(i)));
    
    xvar(i)=variance(N,Xprime(i,:));
    yvar(i)=variance(N,Yprime(i,:));
  
    
    plot(Yprime(i,:),Xprime(i,:),'*r') 
    axis equal 

    pause()
    
    [sum_var(i)]=xvar(i)+yvar(i);
end
    

 
figure() 
plot(theta,xvar)
hold on    
plot(theta,yvar,'r')
legend('x var','y var')
xlabel('theta')
ylabel('variance')

figure()
plot(theta,sum_var)
title('Sum of  X variance  and Y variiance as a function of theta')
xlabel('theta')
ylabel(' Sum of variance')
%% Finding the Principle components using method from 4.4.1
%
xp=(X-mean(X));
yp=(Y-mean(Y));
figure()
plot(xp,yp,'.');

%calculating the prinicple theta
theta_p=.5*atan((2*mean(xp*yp'))/(mean(xp.^2)-mean(yp.^2)));

%setting up the d matirx
d_mat=cat(1,xp,yp);

% calculatting the covaraince matrix
c_mat=(1/length(xp)-1)*d_mat*d_mat';

%finding the eigen vals and vectors 
[evecs,evals]=eig(c_mat);

