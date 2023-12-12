% Create window function comparsion.
clear

L    = 200;
beta = 2.5;
alpha= 2.5;
r_w  = rectwin(L);
k_w  = kaiser(L,beta);
g_w  = gausswin(L,alpha);
% wvtool(r_w);
% wvtool(k_w);
% wvtool(g_w);
nfft = 7*L;
fft_r_w = db(abs(fftshift(fft(r_w,nfft))));
fft_k_w = db(abs(fftshift(fft(k_w,nfft))));
fft_g_w = db(abs(fftshift(fft(g_w,nfft))));
db_length = length(fft_g_w);
x_axis = db_length/2:1:db_length/2+120;
x_axis = x_axis-db_length/2;
hold on
plot(x_axis,fft_r_w(db_length/2:db_length/2+120),LineWidth=2);
plot(x_axis,fft_k_w(db_length/2:db_length/2+120),LineWidth=2);
plot(x_axis,fft_g_w(db_length/2:db_length/2+120),LineWidth=2);
axis([0 120 -50 50]);
title('Windows Frequency Spectrum');
xlabel('Frequency');
ylabel('Magnitude dB');
legend('Rectangle','Kaiser','Gaussian')
ax = gca;
ax.FontSize = 24;
hold off