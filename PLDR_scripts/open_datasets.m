% EEGLAB history file generated on the 01-Aug-2019
% ------------------------------------------------
close all; clear all; clc

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

sdirs={
 '0027'
};


for i = 1:length(sdirs) %each subject
EEG = eeg_checkset( EEG );
EEG = pop_loadset('filename',[sdirs{i} '_hard_epochs.set'],'filepath',['/Users/lorna.quandt/Dropbox/PLDR/PLDR_data/PLDR_EEGLAB/PLDR_D/BV_files/PLDR_' sdirs{i} '/']);
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);
eeglab redraw;
end;

disp(['Finished with ' sdirs{i}])
