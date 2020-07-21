%prob 2 


theta = linspace(0,10,10001);

delta = 1;
f2 = @(theta) 1/(delta.*exp(theta)-theta); 
SIGMA = [];

SIGMA(1,1) = 0;

h = 0.001;
for i = 1:10000
    k1 = h*f2(theta(1,i));
   
    k2 = h*f2(theta(1,i)+h/2);
   
    k3 = h*f2(theta(1,i)+h/2);
  
    k4 = h*f2(theta(1,i));
  
    SIGMA(1,i+1) = SIGMA(1,i)+1/6*(k1+2*k2+2*k3+k4);
   
end

tspan = [0 10];
y0 = 0;
[t,y] = ode45(@(theta, SIGMA)1/(delta.*exp(theta)-theta) , tspan, y0);

%plot numeric solution along with long time and short time. 
sigmaE = SIGMA(1,10001);
SIGMA_lt = zeros(1,10001);
sig_lt=@(theta) sigmaE-1./(delta.*exp(theta))
SIGMA_lt = sig_lt(theta);

theta_st = linspace(0,1.5, 10);
SIGMA_st = theta_st;
SIGE = sigmaE + zeros(1,10001);
plot(theta,SIGMA,theta,SIGMA_lt,theta_st,SIGMA_st,theta,SIGE);
title('$\delta = 1$','interpreter','latex')
legend('$\frac{d\sigma}{d\theta}=\frac{1}{\delta e^{\theta}-\theta}$, numeric solution','$\sigma=\sigma_e - \frac{1}{\delta e^{\theta}}$, Long Time approx ',...
    '$\sigma=\theta$, short time approx','sigma explosion assymptote','interpreter','latex','interpreter','latex','interpreter','latex','Location','southeast')
xlabel('$\theta$','interpreter','latex')
ylabel('$\sigma$','interpreter','latex')
% Bottom plot
% nexttile
% plot(T,U2,'-o',T,W2,'-o')
% legend('actual solution','RK4','Location','northwest')
% title('u2')
