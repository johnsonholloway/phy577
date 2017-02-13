% Argo float data 


fnameR='/Users/johnholloway/Dropbox/PHY577/5904496_Rtraj.nc'
fnameD='/Users/johnholloway/Dropbox/PHY577/5904496_Dtraj.nc'
ncdisp(fnameR);


latsR_1=ncread(fnameR,'LATITUDE');

lonsR_1=ncread(fnameR,'LONGITUDE');


datetimeR_1=ncread(fnameR,'JULD')+datenum(1950,1,1);

date_lat_lon=[datetimeR_1,latsR_1,lonsR_1];
date_lat_lon=date_lat_lon(isfinite(date_lat_lon(:,1)),:);
date_lat_lon=date_lat_lon(isfinite(date_lat_lon(:,2)),:);
date_lat_lon=date_lat_lon(isfinite(date_lat_lon(:,3)),:);

date1=date_lat_lon(:,1);
date1=datestr(date1);
lat1=date_lat_lon(:,2);
lon1=date_lat_lon(:,3);
lat1=single(lat1);
lon1=single(lon1);

date1=datevec(date1);
%% calculatting the delta Ts between each interval 
deltaT=[];
len=length(date1);
for i=[1:len-1]
    t1=date1(i,:);
    t2=date1(i+1,:);
    [deltaT(i)]=etime(t2,t1);

end 


%% calculating the distances for each interval 


ARCLEN=[];
AZ=[];
m=length(date_lat_lon); 
for i=[1:m-1]

    [ARCLEN(i),AZ(i)]=distance(lat1(i),lon1(i),lat1(i+1),lon1(i+1));
 
    
    
end

plot(ARCLEN)
%% calculating the velocities for each interval 
velocity=(ARCLEN/DeltaT);
