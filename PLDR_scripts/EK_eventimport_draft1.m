% EEGLAB history file generated on the 12-Nov-2018
% ------------------------------------------------
close all; clear all; clc

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

sdirs={
 '0028'...
 '0029'...
 '0030'...
 '0031'...
 '0032'...
 '0033'...
 '0036'...
 '0037'...
 '0038'...
 '0040'...
 '0041'...
 '0042'...
 '0043'...
 '0044'...
 '0045'...
 '0046'...
 '0047'...
 '0049'...
 '0050'...
 '0051'...
 '0052'
};


nsubjs = size(sdirs,2)

for i = 1:nsubjs,
    EEG = pop_loadset('filename',[sdirs{i} '_filter.set'],'filepath',['/Users/e.kubicek/Documents/PEN/ABL/PLDR/DATA/PLDR_H/BV_files/PLDR_' sdirs{i} '/']);
    [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
    EEG = eeg_checkset( EEG );
    EEG = pop_importevent( EEG, 'append','no','event',['/Users/e.kubicek/Documents/PEN/ABL/PLDR/DATA/PLDR_H/LL_files/PLDR_' sdirs{i}],'fields',{'type' 'latency'},'timeunit',NaN,'optimalign','off');
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG = eeg_checkset( EEG );
    EEG = pop_saveset( EEG, 'filename',[sdirs{i} '_events.set'],'filepath',['/Users/e.kubicek/Documents/PEN/ABL/PLDR/DATA/PLDR_H/BV_files/PLDR_' sdirs{i} '/']);
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    eeglab redraw;

    
    
    
end;

disp('Finished');
