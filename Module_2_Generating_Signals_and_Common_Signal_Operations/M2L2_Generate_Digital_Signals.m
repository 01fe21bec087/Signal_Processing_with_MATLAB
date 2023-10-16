%% Module 2: Generating Signals and Common Signal Operations
%% Lesson 2: Generate Digital Signals
% Vary sine Parameters:
% You can create your audio watermark using a variety of methods. In this lesson, 
% you'll begin by exploring different things to consider when generating digital 
% signals.
% 
% You're probably already familiar with sine wave parameters, but you can use 
% this script to visualize how different parameters affect the sine wave. Try 
% changing the amplitude, frequency, and phase.
% 
% If you want to see the code used to create the plot, you can change the output 
% view from Hide code  to Output on right  using these icons at the top-right 
% of the script.
% View Sample Points:
% TASK 1:
% This script generates a sine wave with a single tone at |f| Hz. In this activity, 
% you'll modify the frequency value and sample rate to see effects of aliasing.
% 
% In the time-domain plot, the blue line shows a smooth, curved sine wave. This 
% might be how you are accustomed to seeing sine waves.
% 
% Discrete-time signals in the time domain can look strange. In the plot, the 
% red points are the sampled points, and the black lines connect them. You may 
% not recognize the sampled points as a sine wave. But if you sample fast enough, 
% the frequency-domain plot will still show the correct frequency.
% 
% *TASK*
% 
% Modify the slider values so that the sample rate (|fs|) is greater than the 
% Nyquist rate (2_fmax_).

f =1;
fs =2.1;

tfixed = 0 : 1/100 : 100;
yfixed = sin(2*pi*f*tfixed);
plot(tfixed, yfixed)

tmoving = 0 : 1/fs : 100;
ymoving = sin(2*pi*f*tmoving);
%% 
% Time-domain plot

hold on
movingStems = plot(tmoving, ymoving, "ro");
movingLine  = plot(tmoving, ymoving, "k--");
hold off
xlim([0 10])
t = title("fs = " + fs + " Hz");
%% 
% Frequency-domain plot

pspectrum(ymoving,fs)
% Generate Tone:
% TASK 1:
% In this activity, you'll generate a simple watermark for the flute recording. 
% You will add the watermark signal with the audio signal, so signals need to 
% have the same length. To ensure both signals have the same length, you can create 
% a time vector for the flute recording. Start by creating a vector of sample 
% indices:
% 
% |0:n-1|
% 
% where |n| is the length of the signal. You can use the |numel| function to 
% find the number of elements.
% 
% The colon (|:|) operator creates an equally spaced row vector. Signals are 
% conventionally stored in MATLAB as column vectors, so you can can transpose 
% the result with the transpose operator (|'|).
% 
% 
% 
% This code imports the audio file.

[flute,fs] = audioread("NoisyFlute.wav");
flute = flute(1:7*fs);
pspectrum(flute,fs)
%% 
% *TASK*
% 
% Calculate a column vector that contains the sample index of each element in 
% |flute|. Store the result in a variable named |t|.

n = numel(flute)
t = (0:n-1)'
% TASK 2:
% To convert from the sample index to the time value in seconds, you can use 
% |t/fs|.
% 
% *TASK*
% 
% Convert |t| from sample index to time in seconds.

t=t/fs
% TASK 3:

f=6000;
wm=sin(2*pi*f*t)
pspectrum(wm,fs)
% TASK 4:
% Now you can combine the audio with the watermark.
% 
% *TASK*
% 
% Add the audio and watermark signals. Name the result |marked| and plot the 
% spectrum.

marked=wm+flute
pspectrum(marked,fs)
% Further Practice:
% You can clearly see the watermark at 6 kHz, but it also overpowers the flute 
% spectrum. Ideally, the watermark would be identifiable in the spectrum without 
% altering the quality of the audio. Play |marked| with the |soundsc| command. 
% The watermark is much louder than the flute.
% 
% 
% 
% Try scaling the watermark so that isn't audible, but the tone is still visible 
% in the spectrum. For example, scale the watermark by 0.001:

marked = 0.001*wm + flute
pspectrum(marked,fs)
soundsc(marked,fs)
% Generate Chirp:
% TASK 1:
% The audio spectrum has a lot of frequency spikes. You want the watermark to 
% be easily recognizable in the spectrum, but a single tone can be difficult to 
% differentiate from the harmonics. Instead, you can try another common signal, 
% such as a chirp signal.
% 
% |y = chirp(t,f0,t1,f1)|
% 
% The frequency at time |0| is |f0| and the frequency at time |t1| is |f1|.
% 
% This code imports the audio file and generates the time vector.

[flute,fs] = audioread("NoisyFlute.wav");
flute = flute(1:7*fs);
n = numel(flute);
t = (0:n-1)'/fs;
pspectrum(flute,fs)
%% 
% *TASK*
% 
% Create a chirp signal |wm| using the time vector |t|. The frequency _t_=0 
% should be 6000 Hz and the frequency at _t_=|t(end)| should be 7000 Hz.
% 
% Then display the spectrum.

wm=chirp(t,6000,t(end),7000)
pspectrum(wm,fs)
% TASK 2:
% Instead of a spike, the chirp creates a block of power in the spectrum. This 
% is because chirp sweeps across the frequencies from |f0| to |f1|. Try listening 
% to |wm| with the |soundsc| function.
% 
% *TASK*
% 
% Plot the spectrogram of the chirp signal using |pspectrum|.

pspectrum(wm,fs,"spectrogram")
% TASK 3:
% *TASK*
% 
% Combine the watermark and the audio. Name the result |marked| and plot the 
% spectrum.

marked=wm+flute
pspectrum(marked,fs)