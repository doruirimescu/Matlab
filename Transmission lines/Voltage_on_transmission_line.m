%Transmission line exercise: 
%Given R,L,C,G, V measured at t_i = 0ms, z_i = -50mm, fi = 30 deg 
%What is V measured at t_f ms, z_f mm?

%Initial conditions

V_m = 1;            %measurement at z_i, t_i, fi
z_i = -50 * 10^-3;  %initial z
t_i = 0;            %initial time
fi = deg2rad(0);   %phase in degrees
t_f = 50 * 10^-3;
z_f = -150 * 10^-3;

R = 100;
L = 4*pi*10^-7;
C = 8.95*10^-12;
G = 0;
f = 1*10^6;
w = 2* pi * f;

%Calculate parameters
gamma = sqrt( (R + j*w*L)* (G + j*w*C) );
alfa = real(gamma)
beta = imag(gamma)
vp = w/beta; %phase velocity
lambda = vp/f;

%Find voltage relative to z_i
z_f = abs(z_f - z_i);
z_i = 0;

%Find V+
V_p = V_m/( exp(alfa * t_i) * cos(w*t_i - beta*z_i + fi) );
V_f = V_p * exp( alfa*t_f) * cos(w*t_f-beta*z_f+fi)

%Lambda function that gives V_f for various parameters
V_f_fun = @(V_m, alfa, beta, t_i, t_f, z_i, z_f, w, fi) V_m/( exp(alfa * t_i) * ...
    cos(w*t_i - beta*z_i + fi) ) * exp( alfa*t_f) * cos(w*t_f-beta*z_f+fi) ;

z=0:0.1:lambda/2;
v= V_f_fun( V_m, alfa, beta, t_i, t_f, z_i, z, w, fi );
plot(v)