function runme_SSEEG(run_number,stimfile)
%% Description
% runme_SSEEG(run_number, stimfile)
%
% EEG Full-field on-off, left/right flicker experiment (steady state)
% ------
%   Run time per experiment = 72 seconds
%   6 cycles at 12 s each
%   6 cycles are randomly orderd full-full-left-left-right-right, with
%       blanks between each
%
% INPUTS
%   n is the runnumber [1 10]
%   stimfile is the prefix for the stimulus fils containing images, and can
%            be either 
%               - onOffLeftRight_600x600params
%               - onOffLeftRight_600x600params_12Hz
% The actual stim files have names like
%   onOffLeftRight_600x600params1.mat
%   onOffLeftRight_600x600params_12Hz9.mat
%   etc
%
%
% Example
%   runme_SSEEG(1, 'onOffLeftRight_600x600params');
%   runme_SSEEG(1, 'onOffLeftRight_600x600params_12Hz');


    %% Synchronize to the connected host. SynchLimit specifies the minimum
    %allowed time differential between host and STIM computer
	NetStation('Synchronize', [SynchLimit]);
    
    %Instruct NetStation to begin recording EEG data
	NetStation ('StartRecording')
    
    %Run experiment    
    EEG_OnOffLeftRight(run_number, stimfile);
    
    %Instruct NetStation to stop recording EEG data
    NetStation ('StopRecording')  
    
return
