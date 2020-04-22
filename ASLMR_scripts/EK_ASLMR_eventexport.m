 % EEGLAB history file generated on the 15-Jul-2019
% ------------------------------------------------
% EEGLAB history file generated on the 25-Feb-2018
% ------------------------------------------------
close all; clear all; clc;

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

sdirs={
 '0038'
 '0039'
 '0043'
 '0048'
 '0050'
 '0054'
 '0058'
 '0061'
 '0063'
 '0069'
 '0070'
 '0072'
 '0073'
 '0074'
 '0075'
};

nsubjs = size(sdirs,2);

for i = 1:length(sdirs), %each subject
    
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset('filename',[sdirs{i} '_filter.set'],'filepath',['/Volumes/Elements/ASLMR_data_updated/BV/HNS/' sdirs{i} '/']);
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
EEG = eeg_checkset( EEG );
pop_expevents(EEG, ['/Volumes/Elements/ASLMR_data_updated/BV/HNS/' sdirs{i} '/' sdirs{i} '_latency.csv'], 'samples');
eeglab redraw;
    
end; %end of subject loop

disp('Finished');

