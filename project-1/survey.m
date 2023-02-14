%survery file that creates a table for V(tmax) and equivlence class vectors
%for more information refer to the write up
tmax = 500
level = 12;
gamma = 1;
epsec = 10^(-5);
potentials = [];


fid_v = fopen('vsurvey.dat','w');

fid_ec = fopen('ecsurvey.dat','w');

for N = 2:20
    N
    r0 = 2*rand(N,10)-1;
    nc = N;
    
    [t, r, v, v_ec] = charges(r0, tmax, level, gamma, epsec);
    
    potentials(end+1) = v(end);

    fprintf(fid_v, '%3d %16.10f\n', nc, v(end));
    fprintf(fid_ec, '%3d ', nc);
    fprintf(fid_ec, '%d ', v_ec);
    fprintf(fid_ec, '\n');





end