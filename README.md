# ECE 2312 project 2

The objective of this course project is to explore how to artificially generated sounds 
using sinusoidal functions such as sin(x) and cos(x), how to include these sounds with 
other sound files, and how to remove these sounds using simple filtering techniques. 
This project will be built on top of the previous project.  

***

## Contains functions:
Question 1: generate_sin_file(f);
	generates a sine wave of given frequency f
	saves it as a file
	displays a spectrogram for that waveform
	
Question 2: generate_chirp();
	generates a sine wave that increases in frequency from 0 to 8000 Hz over 5 seconds
	saves it as a file
	displays a spectrogram for that waveform
	
Question 3: generate_cetk();
	generates an audio waveform to recreate a melody from CETK 
	saves it as a file
	displays a spectrogram for that waveform
	
Question 4: generate_speechchirp();
	adds a 5000hz sine wave to a previously recorded signal 
	saves it as a file
	displays a spectrogram for that waveform
	
Question 5: gnerate_filteredspeech();
	filters high frequencies (>4000 Hz) from signal generated in q4
	saves it as a file
	displays a spectrogram for that waveform
	
Question 6: generate_stereospeechsine();
	

also: makeSpectrogram();
	reused from project 1 and modified to only graph the spectrogram
	
