% Takes a vector r in (x,y,z)  and normalizes the vector such that
% |r_normalized | = 1


function r_normalized = normalize(r)
    r_normalized = zeros(size(r,1), 3);
    for j = 1:size(r, 1)
        mag_r = 0;
        for i = 1:3
            mag_r = mag_r + r(j,i)^2;
        end
        
        mag_r = sqrt(mag_r);
        
        for i = 1:3
            r_normalized(j,i) = r(j,i)/mag_r;
        end
    end
end

