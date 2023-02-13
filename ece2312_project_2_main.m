
%generate_sin_file(5000);
%generate_chirp();
generate_ctek();

function generate_ctek

t0 = 0:(1/44100):0.25;
t1 = 0:(1/44100):0.5;
t2 = 0:(1/44100):1;
t3 = 0:(1/44100):2;

f1 = 1864;%B6b
f2 = 2093;%C7
f3 = 1661;%A6b
f4 = 415;%A4b
f5 = 622;%E5b

ctek = sin(.01*t0);
ctek = [ctek sin(2*pi*f1*t1)];
ctek = [ctek sin(2*pi*f2*t1)];
ctek = [ctek sin(2*pi*f3*t2)];
ctek = [ctek sin(2*pi*f4*t1)];
ctek = [ctek sin(2*pi*f5*t3)];
ctek = [ctek sin(.01*t0)];
sound(ctek,44100)

audiowrite('teamG5-ctek.wav',ctek,44100);

makeSpectrogram(ctek);

end

function generate_chirp

t = 0:(1/44100):5;
f = t*800;
chirp = sin(2*pi*f.*t);
sound(chirp,44100);

audiowrite('teamG5-chirp.wav',chirp,44100);

makeSpectrogram(chirp);

end

function generate_sin_file(f)

t = 0:(1/44100):5;
sine = sin(2*pi*f*t);
sound(sine,44100);

audiowrite('teamG5-sinetone.wav',sine,44100);

makeSpectrogram(sine);

end

function makeSpectrogram(audio_data)

% A function to create a spectrogram of an audio recording (with time plot)

window = hamming(512);
N_overlap = 256;
N_fft = 1024;
[~,F,T,P] = spectrogram(audio_data,window,N_overlap,N_fft,44100,'yaxis');
figure
surf(T,F,10*log10(P),'edgecolor','none');
axis tight;
view(0,90);
colormap(jet);
set(gca,'clim',[-80,-20]);
ylim([0 8000]);
title('Spectrogram');xlabel('Time (s)');ylabel('Frequency (Hz)');

end
