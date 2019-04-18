%function mix_sines(f1,f2)
%sine1 = 2*sin(2*pi*f1);
%sine2 = 2*sin(2*pi*f2);
%hold on;
%plot(sine1,1:2*pi*f1:6*pi*f1);
%plot(sine2,1:2*pi*f2:6*pi*f2);

function mix_sines(f1, f2)
t = 0:0.02:6*pi;
v = sin(f1 * t) + sin(f2 * t + pi);
plot(t,v);