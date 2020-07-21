%plot numeric solution along with long time and short time. 
delta = 1/3
st = @(sigma) delta/(delta-1).*(exp((delta-1).*sigma)-1);
