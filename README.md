# ECE 2312 project 2

The objective of this course project is to explore how to artificially generated sounds 
using sinusoidal functions such as sin(x) and cos(x), how to include these sounds with 
other sound files, and how to remove these sounds using simple filtering techniques. 
This project will be built on top of the previous project.  

***

 ## Contains functions:
 generate_sin_file(f);
	generates a sine wave of given frequency f
	saves it as a file
	displays a spectrogram for that waveform
	
generate_chirp();
	generates a sine wave that increases in frequency from 0 to 8000 Hz over 5 seconds
	saves it as a file
	displays a spectrogram for that waveform
	
generate_cetk();
	generates an audio waveform to recreate a melody from CETK 
	saves it as a file
	displays a spectrogram for that waveform
	
