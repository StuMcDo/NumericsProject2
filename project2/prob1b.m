%use root finding scheme to find the value of theta_fiz from the 
%large time approximation. 
%exp(theta_fiz)/theta_fiz= 1/delta
%delta = 1/3
%Sigma goes to infinity theta goes to infinity.
%dtheta/dsigma approximately zero 
%dtheta/dsigma = delta*exp(theta)-theta

f = @(theta) 1/3.*exp(theta)-theta;

X = linspace(0,2,201);
Z = zeros(1,201);
Y = f(X);
%initial guess 0.5

guess = [0.5 0.75];
[p,steps,FP] = FalsePosition(f,guess,1000,0.000001);
p;
z = 0;
plot(X,Y,X,Z,p,z,'o')
xlabel('$\theta$','interpreter','latex')
ylabel('$\frac{d\theta}{d\sigma}$','interpreter','latex')
title('$\frac{d\theta}{d\sigma}=\delta e^{\theta}-\theta$','interpreter','latex')
legend('$\frac{d\theta}{d\sigma}=\delta e^{\theta}-\theta$','$\theta$ axis',...
    '$\frac{d\theta}{d\sigma}=0$','interpreter','latex','interpreter','latex','interpreter','latex')