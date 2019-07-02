%Check every value from 1-155
for r3 = 1:155
    for r4 = 1:155
        if (r3+r4) <= 155 && abs(r3-r4) >= 45
            results = sim('r3r4calc.slx'); 
        end
    end
end
