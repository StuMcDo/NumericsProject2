sigma = linspace(0,10,101);

delta = 1/3;
f1 = @(theta) delta.*exp(theta)-theta; 
THETA = [];

THETA(1,1) = 0;

h = 0.1;
for i = 1:100
    k1 = h*f1(THETA(1,i));
   
    k2 = h*f1(THETA(1,i)+1/2.*k1);
   
    k3 = h*f1(THETA(1,i)+1/2.*k2);
  
    k4 = h*f1(THETA(1,i)+k3);
  
    THETA(1,i+1) = THETA(1,i)+1/6*(k1+2*k2+2*k3+k4);
   
end

tspan = [0 10];
y0 = 0;
[t,y] = ode45(@(sigma, theta)1/3.*exp(theta)-theta , tspan, y0);

%plot numeric solution along with long time and short time. 
delta = 1/3;
st = @(sigma) delta/(delta-1).*(exp((delta-1).*sigma)-1);
THETA_st = st(sigma);
% Top plot
%nexttile
root = 0.619061291714738;
THETA_fiz =root + zeros(1,101);
plot(sigma,THETA,sigma,THETA_st,sigma,THETA_fiz)
title('$\delta = 1/3$','interpreter','latex')
legend('$\frac{d\theta}{d\sigma}=\delta e^{\theta}-\theta$ numeric solution'...
    ,'$\theta =\frac{\delta}{\delta-1}[e^{(\delta-1)\sigma}-1]$short time solution','$\frac{e^{\theta_{fiz}}}{\theta_{fiz}}=\frac{1}{\delta}$ long time','interpreter','latex','Location','southeast')
xlabel('$\sigma$','interpreter','latex')
ylabel('$\theta$','interpreter','latex')
% Bottom plot
% nexttile
% plot(T,U2,'-o',T,W2,'-o')
% legend('actual solution','RK4','Location','northwest')
% title('u2')
