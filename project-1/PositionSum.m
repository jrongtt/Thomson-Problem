% Calculates the Position Sum (on Equation 2 of the write up)
% r is the position vector, and k_t is the time iteration
% and n is the charge number

function S = PositionSum(r, n, k_t)
  S = 0;
    
  for j = 1:size(r, 1)
    if (n ~=  j)
        S = S + (r(j,:,k_t) -r(n,:,k_t))/((vectorMag(r(j,:,k_t) -r(n,:,k_t)))^3);
    end
  end
end
