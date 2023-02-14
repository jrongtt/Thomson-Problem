%This is the main charges function which takes 5 paramters (r0, tmax, level, gamma, epsec)
% and returns a time vector, position array, potential vector, and an
% equivalecne class vector

function [t, r, v, v_ec] = charges(r0, tmax, level, gamma, epsec)
%function [t,r] = charges(r0, tmax, level, gamma, epsec)
    nc = size(r0,1);
    nt = 2^(level) + 1 ;
    deltat  = tmax/(nt-1);

    % Initiliaze arrays or zeros for t,r,v
    t = linspace(0.0, tmax, nt);
    r = zeros(nc, 3, nt);
    vel = zeros(nc, 3, nt);
    Potential = zeros(1,nt);

    % Set initial conditions for r(1),r(2),v(1)
    r(:,:,1) = normalize(r0);
    vel(:,:,1) = zeros(size(r0,1),3);
    r(:,:,2) = r(:,:,1);
    

    
    % Now do the FDA by iterating through the time meshgrid
 
    for i = 2:nt-1
        curr_potential = 0;
        %Implemtation of r(t) and v(t)

        for j = 1:nc
            r(j,:,i+1) = (2/(2+gamma*deltat))*(-PositionSum(r,j,i)*deltat^2 + gamma*deltat * (r(j,:,i-1)/2) + 2*r(j,:,i) - r(j,:,i-1));
            r(:,:,i+1) = normalize(r(:,:,i+1));


            for k = 1:j-1
                %update potential
                curr_potential = curr_potential + 1/(vectorMag(r(j,:,i) -r(k,:,i)));
            end
            

        end
        Potential(i) = (curr_potential);
        vel(:,:,i) = (r(:,:,i+1) + r(:,:,i-1))/(2*deltat);



        
    end
    Potential(end) = Potential(end-1);

    vel(:,:,nt) = 2 * vel(:,:,(nt-1))- vel(:,:,(nt-2));
    
    %Calculate v_ec in a seperate function:
    v_ec = equivalenceVector(r(:,:,nt), epsec);

    
    v = Potential; % set v to potential



end