%% Signal Processing with MATLAB
%% Lesson 1: Generate a Signal
% TASK 1:
% First, you need to choose the sample times where the signal should get generated. 
% You can choose sample times by specifying the:
% 
% Sample rate fs
% 
% Start time
% 
% End time
% 
% You can create time steps from a to b with the colon operator:
% 
% a:1/fs:b
% 
% The distance between two samples is 1 over the sample rate.
% 
% TASK
% 
% Specify a sample rate of 100 Hz in a variable named fs.
% 
% Then create a signal named t that extends from  0 to 3, with time steps that 
% are 1/fs.

fs=100
t=0:1/fs:3
% TASK 2:
% A straightforward way to make a sine wave is using the sin function:
% 
% s = sin(2*pi*f*t)
% 
% where f is the frequency, and t are the time steps.
% 
% TASK
% 
% Create a sine signal named sig at the sample times in t. Use a frequency of 
% 5 Hz.
% 
% Then create a plot of sig versus t.

sig=sin(2*pi*5*t)
plot(t,sig)
% TASK 3:
% To create a signal with multiple tones, you can add sine waves together.
% 
% TASK
% 
% Create another signal with a tone at 3 Hz. Add it to the 5 Hz tone from the 
% previous task and name the result sig. Then create a plot of sig versus t.

sig=sig+sin(2*pi*3*t)
plot(t,sig)
% Further Practice:
% Try using the pspectrum function to view the spectrum of sig:
% 
% pspectrum(sig,fs)
% 
% Remember that you can execute your script by clicking the Run or Run Section 
% button in the MATLAB Toolstrip.
% 
% When you're finished practicing, you may move on to the next section.

pspectrum(sig,fs)