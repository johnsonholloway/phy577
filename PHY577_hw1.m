 t=[0:1:1000]/100
y=sin(2*pi*t)

plot(t,y)
 
for i= 2:2:20 
    
    plot(t(1:i:end),y(1:i:end),'m')
    pause
    
          
      
end 
 

