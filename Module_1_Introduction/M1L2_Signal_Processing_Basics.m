%% Signal Processing with MATLAB
%% Lesson 2: Signal Processing Basics
% TASK 1:
% This course uses a clip from a humpback whale recording from the Monterey 
% Bay Aquarium Research Institute. You can find the sound used in this lesson 
% here.
% 
% You can import audio files into MATLAB. The signal data and the sample rate 
% are stored in separate variables.
% 
% [sig,fs] = audioread("filename")
% 
% TASK
% 
% Import "mbari-mars.wav". Name the signal whale and the sample rate fs.

[whale,fs]=audioread("mbari-mars.wav")
% TASK 2:
% TASK
% 
% Plot whale to visualize the time domain of the signal.

plot(whale)
% TASK 3:
% To view the frequency content of a signal, you can calculate the power spectrum 
% with the pspectrum function.
% 
% pspectrum(mysig,fs)
% 
% If you don't use any output arguments, pspectrum creates a plot.
% 
% TASK
% 
% Plot the power spectrum of the whale signal. Specify the sample rate fs.

pspectrum(whale,fs)
% TASK 4:
% You can also create a spectrogram with the pspectrum function by including 
% the input "spectrogram".
% 
% pspectrum(mysig,fs,"spectrogram")
% 
% TASK
% 
% Create a spectrogram of the whale signal. Specify the sample rate fs.

pspectrum(whale,fs,"spectrogram")
% TASK 5:
% You can lowpass filter with the lowpass function.
% 
% lowpass(mysig,pass,fs)
% 
% If you don't use any output arguments, lowpass creates a plot.
% 
% TASK
% 
% Lowpass filter the whale signal at 0.3 Hz. Specify the sample rate fs.

lowpass(whale,0.3,fs)
% TASK 6:
% With |pspectrum| and filtering functions like |lowpass|, you can use output 
% arguments to save the result to a variable. Then you can perform further processing 
% or customize the visualizations.
% 
% *TASK*
% 
% Repeat the command from Task 5, but this time, use one output variable named 
% |whalefilt|.

whalefilt=lowpass(whale,0.3,fs)
% Further Practice:
% You can listen to the original signal with
% 
% |soundsc(whale,fs)|
% 
% The |soundsc| command scales the signal before playing it, as opposed to the 
% |sound| command, which does not.
% 
% Then wait until the first signal has finished playing before listening to 
% the filtered signal.
% 
% |soundsc(whalefilt,fs)|

soundsc(whale,fs)
%% 
% .

soundsc(whalefilt,fs)