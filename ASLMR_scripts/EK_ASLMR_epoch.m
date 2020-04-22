% EEGLAB history file generated on the 13-Nov-2018
% ------------------------------------------------
close all; clear all; clc

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;


sdirs={
 '0008'
 '0017'
 '0021'
 '0029'
 '0035'
 '0042'
 '0044'
 '0045'
 '0049'
 '0055'
 '0057'
 '0059'
 '0062'
 '0064'
 '0065'
 '0066'
 '0071'
};


nsubjs = size(sdirs,2)

for i = 1:length(sdirs) %each subject

%for i = 1:nsubjs
    
    EEG = pop_loadset('filename',[sdirs{i} '_filter.set'],'filepath',['/Volumes/Elements/ASLMR_data_updated/BV/HNF/' sdirs{i} '/']);
    [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
    EEG = eeg_checkset( EEG );
    EEG = pop_epoch( EEG, {  }, [-1           2], 'newname', [sdirs{i} '_epochs'], 'epochinfo', 'yes');
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew',['/Volumes/Elements/ASLMR_data_updated/BV/HNF/' sdirs{i} '/' sdirs{i} '_ALLepochs.set'],'gui','off'); 
    EEG = eeg_checkset( EEG ); 
    EEG = pop_rmbase( EEG, [-1000 0] ,[]);
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'savenew',['/Volumes/Elements/ASLMR_data_updated/BV/HNF/' sdirs{i} '/' sdirs{i} '_ALLepochs.set'],'gui','off'); 
    eeglab redraw;
    disp(['Finished with ' sdirs{i}])
end;

disp('Finished')

