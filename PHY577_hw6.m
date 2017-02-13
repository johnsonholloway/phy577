%% hw 6
% PART 1  testing the central limit theorem 

%uniformly distrubted random numbers
for i=[1:1:1000]
    x=rand(100,1);
    [means(i)]=mean(x);
    
end 

means=means';

a=tabulate(means);
figure()
hist(means)
title(' uniformly distrubted random numbers')
xlabel('means')
ylabel('frequency')
% Normally Distrubted random numbers 
for i=[1:1:1000]
    y=randn(100,1);
    [n_means(i)]=mean(y);
end

n_means=n_means';
b=tabulate(n_means);
figure()
hist(n_means)
title(' normaly distrubted random numbers')
xlabel('means')
ylabel('frequency')
% Chi-Squared Distrubtion of random numbers
for i=[1:1:1000]
    R=chi2rnd(4,[100,1]);
    [chi_means(i)]=mean(R);
    
end
chi_means=chi_means';
c=tabulate(chi_means);
figure()
hist(chi_means)
title('chi^2 distrubted random numbers')
xlabel('means')
ylabel('frequency')
v=var(chi_means);
%% Part 2
% normal distribution 

dist=randn(10000,1);
d=find(dist>1.96);
e=find(dist<-1.96);
num_greater=length(d);
num_less=length(e);

mu=0;
s=1;
x=[-10:.01:10];
a=normpdf(x,mu,s);
figure()

plot(x,a)
title('gaussian distribution')

fun=@(x)(1/sqrt(2*s.^2*pi))*exp(-(x-mu).^2/2*s.^2)

i1=integral(fun,-10,-1.96);
i2=integral(fun,-1.96,1.96);
i3=integral(fun,1.97,10);


i_tot=i1+i2+i3;
%% part 3 
% students t distribution
mu=0;
s=1;

n=[5;10;20;30;50;100];
xx=[-5:.01:5];
t5=tpdf(xx,5)';
t10=tpdf(xx,10)';
t20=tpdf(xx,20)';
t30=tpdf(xx,30)';
t50=tpdf(xx,50)';
t100=tpdf(xx,100)';

max_n5=max(t5);
max_n10=max(t10);
max_n20=max(t20);
max_n30=max(t30);
max_n50=max(t50);
max_n100=max(t100);

norm=normpdf(xx,mu,s);
figure()

hold on 
plot(xx,norm','*','MarkerSize',2)
plot(xx,t5)
plot(xx,t10,'c')
plot(xx,t20,'r')
plot(xx,t30,'y')
plot(xx,t50,'m')
plot(xx,t100,'k')
legend('norm','n=5','n=10','n=20','n=30','n=50','n=100')
title('students T-distribution')

fun=@(xx)(1/sqrt(2*s.^2*pi))*exp(-(xx-mu).^2/2*s.^2);
outlying_event=integral(fun,-5,-2);