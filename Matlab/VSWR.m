close all

%period
T = 1;

%wavelength
lambda = 1;

%wave number
B = 2 * pi / lambda;

%angular speed
w = 2 * pi / T;

%time resolution
dt = 0.01;

%line length
l = 0.01 * lambda;

%position
z = 0:0.01:l;

%reflection coefficient
gamma = 1.0

%phase(turns into a sine wave)
phi = 0;

figure()
axis([0 l -2 2])
hold on
for t = 0:dt:2*T
    v = cos( w*t - B*z + phi ) + gamma*cos( w*t + B*z + phi );
    plot(z,v);
end

%plot quarter wavelength lines
for x = 0:0.25:B
    plot([x x],[-2,2], '--')
end

ylabel('Volts')
xlabel('Position(in wavelengths)')
grid on
title('Voltage standing wave visualization')