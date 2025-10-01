function [err] = err(y1, y2, y_approx, h)

tspan = [0:h:8];
err(1) = double(sum((y_approx(:,1)' - y1(tspan)).^2) / (sum(y1(tspan) .^2)));
err(2) = double(sum((y_approx(:,2)' - y2(tspan)) .^2) / (sum(y2(tspan) .^2)));

end