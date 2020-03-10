% EEGLAB history file generated on the 08-Nov-2018
% ------------------------------------------------

close all; clear all; clc;

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;


sdirs={
% '0003'
% '0004'
% '0005'
% '0007'
% '0008'
%'0009'
%'0011'
% '0012'
% '0013'
%'0014'
%'0015'
% '0016'
%'0020'
%'0021'
%'0022'
%'0023'
% '0024'
%'0026'
'0027'
};

nsubjs = size(sdirs,2);

for i = 1:nsubjs %each subject
    this_dir = sdirs{i};
    disp(['Processing subject ' num2str(i) ': ' this_dir ]);

    %import data from .vhdr file
    [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
    EEG = pop_loadbv(['/Users/e.kubicek/Documents/PEN/ABL/PLDR/DATA/PLDR_H/BV_files/PLDR_' sdirs{i} '/'] , ['PLDR_' sdirs{i} '.vhdr'], [], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63]);
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',[sdirs{i} '_eeg'],'gui','off'); 
    
    %add a new channel, name it Cz, declare it as the reference
    EEG=pop_chanedit(EEG, 'append',63,'changefield',{64 'labels' 'Cz'},'lookup','/Users/e.kubicek/EEGLAB/eeglab14_1_2b/plugins/dipfit2.3/standard_BESA/standard-10-5-cap385.elp','setref',{'1:63' 'Cz'});
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG = eeg_checkset( EEG );
    
    
    %rereference to average ref
    EEG = pop_reref( EEG, []);
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = eeg_checkset( EEG );
    
    %rereference to average mastoids and save
    EEG = pop_reref( EEG, [10 21] ,'refloc',struct('labels',{'Cz'},'type',{''},'theta',{0},'radius',{0},'X',{5.2047e-15},'Y',{0},'Z',{85},'sph_theta',{0},'sph_phi',{90},'sph_radius',{85},'urchan',{64},'ref',{''},'datachan',{0}),'keepref','on');
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
    EEG = eeg_checkset( EEG );
    
    %save
    EEG = pop_saveset( EEG, 'filename',[sdirs{i} '_reref.set'],'filepath',['/Users/e.kubicek/Documents/PEN/ABL/PLDR/DATA/PLDR_H/BV_files/PLDR_' sdirs{i} '/'] );
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    eeglab redraw;
    
    disp('Next subject');
    
    clear all;
    
end

disp('Finished')
