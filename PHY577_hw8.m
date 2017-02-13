clear all 
close all

% HW 8
% contouring and surface plotting 



[x,y] = meshgrid(1:100,1:100);
z = sqrt(x.*x + y.*y);

sub_z=zeros(100);

xpick=ceil(rand(10,1)*100);
ypick=ceil(rand(10,1)*100);

for i=1:length(xpick),
    sub_z(xpick(i),ypick(i))=z(xpick(i),ypick(i));
end


figure()
h=pcolor(sub_z)
set(h,'edgecolor','none')
colorbar()
axis([0 100 0 100])

[r,c]=find(sub_z~=0);
valueloc=find(sub_z~=0);
values=sub_z(valueloc);

z_bar=zeros(100);

for i=1:length(x)    
    for j = 1:length(y)
     
      if sub_z(i,j)==0,
         
          %find the distance to each known value
          distance=zeros(length(r),1);
          
          for n=1:length(r)
              
            distance(n) = sqrt( (r(n) - i)^2 + (c(n) - j)^2 ) ;
            
          end
          
          z_bar1(i,j)=sum(values./distance)/sum(1./distance);
          z_bar2(i,j)=sum(values.*exp((1./distance)))/sum(exp((1./distance)));
          
      end
         
    end
    
end
figure()
g=pcolor(z_bar1)
set(g,'edgecolor','none')
colorbar()

figure()
gh=pcolor(z_bar2)
set(gh,'edgecolor','none')
colorbar()


%% part 2 
xx=[0:1:100];
yy=[0:1:100];
[XX,YY]=meshgrid(xx,yy);
axis([0 100 0 100])
zz=sqrt(XX.^2+YY.^2);

figure()
h=pcolor(zz);

set(h,'edgecolor','none')
colormap('parula')
colorbar()
%% part 3
figure()
ff=pcolor(zz)
set(ff,'edgecolor','none')
colormap('cool')
colorbar()

zzz=zz;
% replacing some random elements of z with NaN's 
zzz(4,5)=NaN;
zzz(14,65)=NaN;
zzz(44,74)=NaN;
zzz(35,57)=NaN;
zzz(76,24)=NaN;
zzz(52,59)=NaN;

figure()
h=pcolor(zzz);
set(h,'edgecolor','none')
colormap('spring')
colorbar()

%% part 4
 %using matlabs griddata function

 % NN 10 random subsamples
 z_bar_nn=griddata(x,y,z,XX,YY,'nearest');

figure()
g=pcolor(z_bar_nn)
set(g,'edgecolor','none')
hold on

 % NN 100 random subsamples
n = rand(100,1)*100;
m = rand(100,1)*100;

l = sqrt(n.*n + m.*m);

l_bar=griddata(n,m,l,XX,YY,'nearest');


figure()
g=pcolor(l_bar)
set(g,'edgecolor','none')
hold on
colorbar()
plot(n,m,'.k')
 % NN 1000 random subsamples
q = rand(1000,1)*100;
r = rand(1000,1)*100;
s = sqrt(q.*q + r.*r);

s_bar=griddata(q,r,s,XX,YY,'nearest');

figure()
g=pcolor(s_bar)
set(g,'edgecolor','none')
hold on 
plot(q,r,'.k')
colorbar()
