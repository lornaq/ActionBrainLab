% EEGLAB history file generated on the 11-Jul-2019
% ------------------------------------------------
% filter
close all; clear all; clc; clear variables

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

sdirs={
     '0038'
     '0039'
    };


nsubjs = size(sdirs,2);

for i = 1:length(sdirs) %each subject
    %this_dir = sdirs{i};
    %disp(['Filtering subject ' num2str(i) ': ' this_dir ]);
    
 sdirs={
     '0038'
     '0039'
    };

    
    
    [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
    EEG = pop_loadset('filename', [sdirs{i} '_reref.set'],'filepath',['/Volumes/Elements/ASLMR_data_updated/BV/HNS/' sdirs{i} '/']);
    [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
    EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',100,'plotfreqz',1);
    [ALLEEG EEG CURRENTSET] = pop_newset( ALLEEG, EEG, 1,'setname', [sdirs{i} '_filter'],'savenew',['/Volumes/Elements/ASLMR_data_updated/BV/HNS/' sdirs{i} '/' sdirs{i} '_filter.set','gui','off']); 
    eeglab redraw;

    disp('Next participant')
    
    clear all;
end
