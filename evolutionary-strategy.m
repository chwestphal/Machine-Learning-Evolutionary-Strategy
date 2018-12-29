cars = dlmread("cars.csv", ",", 1, 1);matrix = cars(:,1:6);mpg = cars(:,7);i = 0;j = 0;bestK = [0, 0, 0, 0, 0, 0]';generations = 300;offsprings = 3;steps = 0.1;bestRmse = 10;function [normX] =  normalize(x)normX = (x .- min(x)) ./ (max(x) .- min(x));endfunctionnormMpg = normalize(mpg);normMatrix = normalize(matrix);function [k] = randomArray(steps, bestK)  k = -steps + (steps + steps)*rand(6,1) + bestK;endfunctionwhile (i < generations)  while (j < offsprings)    k = randomArray(steps, bestK);    y = sum(normMatrix .* k', 2);    rmse = sqrt(sum((y .- normMpg) .^2) / length(y));        if (bestRmse > rmse)        bestRmse = rmse;        bestK = k;        j++;      else        j++;      end  endwhile  j = 0;  i++;endwhiley = sum(normMatrix .* bestK', 2);denorm = y * (max(mpg) - min(mpg)) + min(mpg);rmse = sqrt(sum((denorm .- mpg) .^2) / length(denorm));rmse = min(rmse);disp(['Run ', num2str(generations), ' round(s) ES(children:', num2str(offsprings), ' parents:1)'])disp(['best RMSE: ', num2str(rmse)])disp(['Line 4:    mpg is ', num2str(mpg(4,1)), ' prediction was ', num2str(denorm(4,1))])disp(['Line 57:   mpg is ', num2str(mpg(57,1)), ' prediction was ', num2str(denorm(57,1))])disp(['Line 117:  mpg is ', num2str(mpg(117,1)), ' prediction was ', num2str(denorm(117,1))])disp(['Line 219:  mpg is ', num2str(mpg(219,1)), ' prediction was ', num2str(denorm(219,1))])