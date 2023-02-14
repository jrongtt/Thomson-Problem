%A function that calculates the maxmimum euivalence class

function max_eq = maxEqc(r, epsec)
   nc =  size(r,1);
   maxd =0;
   for i = 1: nc
       for j = 1:nc
           if (i>j)
               i
               j
               if (i == 4 && j == 3)
                   vvv = vectorMag(r(i,:) - r(j,:))
               end
               vmag = vectorMag(r(i,:) - r(j,:));
               if (maxd < vmag)
                   maxd = vmag
               end
           end
       end
   end
  maxd
   max_eq = 1 + (maxd - mod(maxd,epsec))/epsec
end