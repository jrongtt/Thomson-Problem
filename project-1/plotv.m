%plotv.m Takes 12 charges with random positions and calculates the
%Potential, and plots the potential versus time graph of the system


r0 = 2*rand(12,3)-1;
nc = 12;
tmax = 10;
level = 12;
gamma = 1;
epsec = 1.0e-5;

[t, r, v, v_ec] = charges(r0, tmax, level, gamma, epsec);

plot(t,v)
title('Potential Versus Time for a 12 Charge system')
xlabel('time') 
ylabel('Potential') 



