%Check every value from 1-155
i = 1;
for r3 = 1:155
    for r4 = 1:155
        x1 = r3+r4;
        x2 = abs(r3-r4);
        if (x1 <= 155) && (x2 >= 45)
            check1 = (((r3^2) - 2025 - (r4^2))/90/r4)^2;
            check2 = 1 - (((r3^2) - 24025 - (r4^2))/310/r4)^2;

            if abs(check1-check2) < 1
                results(i,1) = r3
                results(i,2) = r4
                i = i+1;
            end
        end
    end
end