% EEGLAB history file generated on the 25-Feb-2018
% ------------------------------------------------
close all; clear all; clc;

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

nsubjs = size(sdirs,2);

for i = 1:length(sdirs) %each subject
%for i = 1:nsubjs, %each subject
    STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];
    EEG = pop_loadset('filename',[sdirs{i} '_filter.set'],'filepath',['/Volumes/Elements/ASLMR_data_updated/BV/HNF/' sdirs{i} '/']);
    [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
    EEG = eeg_checkset( EEG );
    EEG = pop_importevent( EEG, 'append','no','event',['/Volumes/Elements/ASLMR_data_updated/TL/HNF_TL_correct/ASLMR_' sdirs{i} 'c'],'fields',{'type' 'latency'},'timeunit',NaN,'optimalign','off');
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG = eeg_checkset( EEG );
    EEG = pop_saveset( EEG, 'savemode','resave');
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    eeglab redraw;
    disp(['Finished with ' sdirs{i}]);

end; %end of subject loop

disp('Finished');
