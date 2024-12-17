function f = ANGLE_CORRECT(x)

    if x > pi
        f = x - 2*pi;
    elseif x < -pi
        f = x + 2*pi;
    else
        f = x;
    end

end


