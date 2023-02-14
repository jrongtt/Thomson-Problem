%this function simply returns the magnitude of an n-dimensional vector r
function v = vectorMag(r)
    v = sqrt(sum(r.^2));

end