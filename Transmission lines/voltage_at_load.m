%Voltage at load
zs = 100 + 50*j;
zl = 50  + 50*j;
z0 = 50;

vs = 10;
bl = pi/4;  %beta*L
bz = -bl; %beta*z

format short g
gamma = (zl - z0)/(zl + z0);
zin = z0 * ( zl + j*z0*tan(bl) )/( z0+j*zl*tan(bl) );

va  = vs * zin/( zin + zs );

v_p = va / (exp( -j * bz ) * ( 1 + gamma * exp( 2 * j * bz) ) ); %V+
v_l = v_p * ( 1 + gamma) %V at z
abs(v_l)