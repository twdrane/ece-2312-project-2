close all

%generate_sin_file(5000);
%generate_chirp();
%generate_cetk();
%generate_speechchirp();
generate_filteredspeech()

function generate_filteredspeech

[audioFile,Fs] = audioread('teamG5-speechchirp.wav');
F = [0 3700/Fs 4300/Fs 1];
A = [1 1 0 0];
[fil1, fil2] = firls(255,F,A);
filteredAudio = filter(fil1,fil2,audioFile);

makeSpectrogram(audioFile);
makeSpectrogram(filteredAudio);

audiowrite('teamG5-filteredspeechsine.wav',filteredAudio,44100);

end

function generate_speechchirp

[audioFile,Fs] = audioread('thequickbrownfox.wav');
[sinewave,Fs] = audioread('teamG5-sinetone.wav');
%length(sinewave)
%length(audioFile)
audioFile = audioFile + sinewave;
%length(audioFile)
sound(audioFile,Fs);

audiowrite('teamG5-speechchirp.wav',audioFile,44100);

makeSpectrogram(audioFile);

end 

function generate_cetk

t0 = 0:(1/44100):0.25;
t1 = 0:(1/44100):0.5;
t2 = 0:(1/44100):1;
t3 = 0:(1/44100):2;

f1 = 1864;%B6b
f2 = 2093;%C7
f3 = 1661;%A6b
f4 = 415;%A4b
f5 = 622;%E5b

cetk = sin(.01*t0);
cetk = [cetk sin(2*pi*f1*t1)];
cetk = [cetk sin(2*pi*f2*t1)];
cetk = [cetk sin(2*pi*f3*t2)];
cetk = [cetk sin(2*pi*f4*t1)];
cetk = [cetk sin(2*pi*f5*t3)];
cetk = [cetk sin(.01*t0)];
sound(cetk,44100)

audiowrite('teamG5-cetk.wav',cetk,44100);

makeSpectrogram(cetk);

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

t = 0:(1/44100):4.99999;
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
