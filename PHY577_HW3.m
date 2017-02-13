% HW3 TEOS-10
clear all
addpath('library')
savepath

% plot potential temperature as a function of pressure for pressure
%going from 0 to 5000 dbars, temperature=5oC, SA=35, reference pressure 0

T=5;
SA=35;
a=[-5000:1:0]';

p_ref=0;
pt=zeros(5001,1);

for i=[1:1:5001]
    
pt(i)=gsw_pt_from_t(SA,T,i,p_ref)


end

pt

% % 
%% 
c=flipud(pt);
LOC='SouthEast';
plot(c,a,'LineWidth',3)
xlabel('Temperature (C)')
ylabel('Pressure (dbar)')
legend('Potential Temperature' ,'Location',LOC)
title('Potential Temperature as a function of Pressure')
%% 
% plot absolute salinity vs practical salinity as a function of latitude
% then longitude
SP=zeros(361,1);
for i=[1:361]
    SP(i)=35
end

p=[0:14:5042]';
lat=[-90:.5:90]';
lon=[0:1:360]';
lon_0=0;
lon_90=90;
lon_180=180;
lon_270=270;
lat_0=0;
lat_30N=30;
lat_30S=-30;
SA_lon_0=zeros(361,1);
SA_lon_90=zeros(361,1);
SA_lon_180=zeros(361,1);
SA_lon_270=zeros(361,1);


SA_lat_0=zeros(361,1);
SA_lat_30N=zeros(361,1);
SA_lat_30S=zeros(361,1);
in_ocean=zeros(361,1);

for j=[1:1:361]
    [SA_lon_0(j), in_ocean(j)] = gsw_SA_from_SP(SP,p,lon_0,lat)

end

SA_lon_0

%% 
%%Calculate and plot the conductivity ratio for
% practical salinity from 33 to 37 at 10oC, 20oC and 30oC
pres=[0];
S=[33:1:37];

R10=zeros(5,1);
R20=zeros(5,1);
R30=zeros(5,1);

for s=[33:1:37]
    R10(s)=gsw_cndr_from_SP(s,10,pres)
    R20(s)=gsw_cndr_from_SP(s,20,pres)
    R30(s)=gsw_cndr_from_SP(s,30,pres)
end


r10=R10((33:37),1);
r20=R20((33:37),1);
r30=R30((33:37),1);

figure(3)
hold on
plot(S,r10,'b');


plot(S,r20,'c');
plot(S,r30,'r');
xlabel('Practical Salinity')
ylabel('Conductivity Ratio')
legend('10 C','20 C', '30 C')
title(' conductivity ratio  practical salinity')

temp=[0:1:30];
cndr_pss33=zeros(31,1);
cndr_pss34=zeros(31,1);
cndr_pss35=zeros(31,1);
cndr_pss36=zeros(31,1);
cndr_pss37=zeros(31,1);
cndr_pss=zeros(31,4);
cndr=zeros(124,1);

for k=[1:1:31]
    for l=[33:1:37]
        cndr_pss33(k)=gsw_cndr_from_SP(33,k,0);
        cndr_pss34(k)=gsw_cndr_from_SP(34,k,0);
        cndr_pss35(k)=gsw_cndr_from_SP(35,k,0)
        cndr_pss36(k)=gsw_cndr_from_SP(36,k,0)
        cndr_pss37(k)=gsw_cndr_from_SP(37,k,0)
        cndr_pss(k,l)=gsw_cndr_from_SP(l,k,0)
    end 



end
z=[cndr_pss33,cndr_pss34,cndr_pss35,cndr_pss36,cndr_pss37];
w=cndr_pss(:,(33:37))
figure(4)
contour(z,10)
xlabel('Salinity')
ylabel('Temperture (C)')
colormap('default')
colorbar()

legend('Conductivity Ratio')

figure(5)
plot(S,z)
legend()

figure(6)
contour(cndr_pss,10)
axis([33 37 0 inf])
xlabel('Salinity')
ylabel('Temperture (C)')
colormap('default')
colorbar()
legend('Conductivity Ratio')
