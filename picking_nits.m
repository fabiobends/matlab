function [v_clean, nits] = picking_nits(v)
v_clean_log = (abs(v)>=0.01);
v_clean = v(v_clean_log);
nits = v(~v_clean_log);
