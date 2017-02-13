%HW7
% simple linear regression
clear all 
close all
x=[1:1:100];
rng(0,'twister');
a=50;
b=-50;

% r = (b-a).*rand(1,100)+a; 
% r_range = [min(r) max(r)];
r=50*randn(1,100);

y=3*x+r;
N=length(x);
b1=coefficent_est_1(N,x,y);
b0=coefficent_est_2(b1,x,y);

ave_x=mean(x);
ave_y=mean(y);


reg_line=b0+b1*x;

var_y=variance(N,y);

resids=(y-reg_line);

var_e=variance(N,resids);
var_yhat=variance(N,reg_line);

verify_var_y=var_yhat+var_e;

se=std_err(N,y,reg_line);
se_b0=std_err_yint(se,N,x);
se_b1=std_err_slope(se,x);

rsqrd=var_yhat/var_y*100;

sse=sum_sq_err(y,reg_line);

c=-.5;
d=.5;

rr = (d-c).*rand(1,100)+c; 
rr_range = [min(rr) max(rr)];

for i=[1:1:100]
    [b0_rand(i)]=b0+rr(i);
    [b1_rand(i)]=b1+rr(i);
    [reg_lines_varying(i)]=b0_rand(i)+b1_rand(i)*x(i);
    [sse_rand(i)]=sum_sq_err(y,reg_lines_varying(i));
    
end

% % hyperbolic lines use eqn's 3.79 a and b 
x_sqg=xsquig(N,x);
t_alplha=1.98
mean_conf_int_plus=((mean(reg_line)+(t_alplha*se*sqrt(x_sqg))));
mean_conf_int_minus=((mean(reg_line)-(t_alplha*se*sqrt(x_sqg))));
reg_conf_int_plus=(reg_line)+(t_alplha*se*sqrt(1+x_sqg));
reg_conf_int_minus=(reg_line)-(t_alplha*se*sqrt(1+x_sqg));

figure()

hold on 
plot(sse,'rx','LineWidth',5,'MarkerSize',20)

plot(sse_rand)

title('Sum Squared error adding random variations to the b_o and b_1')
xlabel('number of iterations')
ylabel('Sum Squared Error')


figure()
plot(x,y,'*')

hold on 
plot(x,reg_line,'r')
% plot(x,mean_conf_int_plus,'k')
% plot(x,mean_conf_int_minus,'k')
plot(x,reg_conf_int_plus,'g')
plot(x,reg_conf_int_minus,'g')
plot(ave_x,ave_y,'rx','LineWidth',5,'MarkerSize',20)
title('Linear Regression')
legend('data','regression line','+confidence int','-confidence int','mean','location','SouthEast')
