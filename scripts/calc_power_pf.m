function [P, pf] = calc_power_pf(v, i, t)

P = mean(v .* i);

Vrms = rms(v);
Irms = rms(i);

pf = P / (Vrms * Irms);

end