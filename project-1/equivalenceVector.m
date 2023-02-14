%Function that  the equaivalnce class vector given the last nc by x array of
%charges and epsec the equivalence tolerance

function v_eq = equivalenceVector(r, epsec)
    nc = size(r,1);
    dist_array = zeros(nc,nc);
    %First create a sorted distance array of size nc by nc
    for i = 1:nc
        for j = 1:nc
            if (i~=j)
               dist_array(i,j) = vectorMag(r(i,:)- r(j,:));
            end
        end
        dist_array(i,:) = sort(dist_array(i,:));

    end
    dist_array



    % Now calculate equiv   alence class vector

    v_eq = zeros(1,nc);

    for i = 1:nc
        to_remove = [];
        
    
        for j = i:nc
            if (j <= size(dist_array,1) && i <= size(dist_array,1) )
                
                if (i ~= j)
                vmag = vectorMag(dist_array(i,:) - dist_array(j,:));
                epsec;
                    if (vmag <= epsec)
                        v_eq(i) = v_eq(i) + 1;
                        to_remove(end + 1) = j;
                        
        
                    end
                else
                    v_eq(j) = v_eq(j) + 1;

                end
            end
        end
        to_remove = sort(to_remove, 'descend');
        for k = to_remove
            dist_array(k,:) = [];
        end
    end

    v_eq = nonzeros(v_eq)';


    
end