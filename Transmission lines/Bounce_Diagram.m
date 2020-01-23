%Bounce diagram
close all
clear all
format long

zo = 75;    %characteristic impedance
rs = 50;    %source impedance
vs = 10;    %source voltage
rl = 216;   %load impedance

gi = (rs - zo)/(rs + zo);%generator gamma
gl = (rl - zo)/(rl + zo);%load gamma

vg = vs*zo/(zo+rs);     %total voltage at generator
vl = 0;                 %total voltage at load
vgr = vg;               %reflected from generator
vlr = 0;                %reflected from load

T = 10; %change according to timesteps needed

for t = 1:T
    if mod( t, 2 ) == 0
        %We are at generator side
        vgr = vlr * gi;
        vg = vg + vgr + vlr
    else
        %We are at load side
        vlr = vgr * gl;
        vl = vl + vlr + vgr;
    end
    vg_plot(t)  = vg;
    vl_plot(t)  = vl;
    vgr_plot(t) = vgr;
    vlr_plot(t) = vlr
end

plot([1:T],vg_plot,'-o')
xlim([0 T])
ylim([min(vg_plot)*0.9 max(vg_plot)*1.1])
title("V_g_e_n_e_r_a_t_o_r")
xlabel("Time")
ylabel("Voltage")
grid on

figure()
plot([1:T],vl_plot,'-o')
xlim([0 T])
ylim([min(vl_plot)*0.9 max(vl_plot)*1.1])
title("V_l_o_a_d")
xlabel("Time")
ylabel("Voltage")
grid on

figure()
hold on
x = [0 1;1 0];
for i = T:-1:1
    line( x( mod(i,2)+1,:), [i+1, i] )
    ind = T - i + 1
    if mod( i, 2 ) == 0 
        text(-0.27, i , num2str(vg_plot(ind) ) )
        text(0.5, i + 0.65, num2str(vgr_plot(ind) ) )
    else
        text(1.15, i , num2str(vl_plot(ind) ) )
        text(0.1, i + 0.65, num2str(vlr_plot(ind) ) )
    end
end
text(1.15, T + 1 , num2str( 0 ) )

xlim([-0.15 1.15])
grid on
set(gca,'yticklabel',{[]})
title("Bounce diagram")
