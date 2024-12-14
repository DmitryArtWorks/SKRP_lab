
function f = ANGLE_CORRECT(x)

    if x > pi
        f = x - 2*pi;
    else
        f = x;
    end
    if x < - pi
        f = x + 2*pi;
    else
        f = f;
    end

end


