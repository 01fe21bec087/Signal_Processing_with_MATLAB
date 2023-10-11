%% Module 2: Generating Signals and Common Signal Operations
%% Lesson 1: Digital Watermarking
% TASK 1:
% The signal that you'll watermark in this module is a recording of a flute 
% playing one note. Before you watermark the signal, you can visualize the signal 
% in this activity.
% 
% Recall that you can import audio files into with audioread, using separate 
% variables for the signal data and the sample rate:
% 
% [sig,fs] = audioread("filename")
% 
% To see which file formats are supported, check the documentation.
% 
% TASK
% 
% Import "NoisyFlute.wav". Name the signal flute and the sample rate fs.

[flute,fs] = audioread("NoisyFlute.wav");
% TASK 2:
% A strip plot is a wraparound plot that's convenient for viewing the entire 
% duration of a signal.
% 
% strips(sig,n,fs)
% 
% n is the number of seconds per strip and fs is the sample rate.
% 
% TASK
% 
% Plot the flute signal in 2 second strips.

strips(flute,2,fs)
% TASK 3:
% The end of the signal has a large amplitude sound. It makes it difficult to 
% see the rest of the signal.
% 
% You can extract portions of a signal using array indexing:
% 
% sig = sig(n:m)
% 
% where n and m are the starting and ending indices, respectively.
% 
% To get the first k seconds of audio, you can use the sample rate to calculate 
% the ending index:
% 
% sig = sig(1:k*fs)
% 
% TASK
% 
% Modify flute so that it only contains the first 7 seconds of audio.
% 
% Add the code above the strips command so that the plot updates.

flute=flute(1:7*fs)
% TASK 4:
% TASK
% 
% Plot the spectrum using pspectrum.

pspectrum(flute,fs)
% Further Practice
% In the spectrum, you can see that there's a tone around 0.520 kHz. The other 
% spikes are harmonics, or multiples, of the 520 Hz tone. For example, the second 
% spike is around 1.040 kHz.
% 
% Listen to the recording before moving on to the next lesson.
% 
% soundsc(flute,fs)

soundsc(flute,fs)
%%