
generate_sin_file(5000);


function generate_sin_file(f)

t = 0:(1/44100):5;
sine = sin(2*pi*f*t);
sound(sine,44100);

audiowrite('teamG5-sinetone.wav', sine,44100);

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
