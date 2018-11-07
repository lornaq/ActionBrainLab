% EEGLAB history file generated on the 26-Jul-2017
% ------------------------------------------------
close all; clear all; clc;

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

base_dir = '/Users/lorna.quandt/Dropbox/ABL/P1/P1_EEG/P1_Datasets/'; %%% Where the subjects' data is kept

subj_dirs={

'0044' 

};

num_subjs = size(subj_dirs,2);

for subj_num = 1:num_subjs, %each subject
    
    this_subj_dir = subj_dirs{subj_num};
    disp(['Processing subject ' num2str(subj_num) ': ' this_subj_dir ]);
    
    %     % Select one of the two options below; comment out the other%%
    
    %     %     If you're loading existing EEGLAB file
    %     [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
    %     EEG = pop_loadset('filename',['P1_' subj_dirs{subj_num} '.set'],'filepath',['/Users/lorna.quandt/Dropbox/ABL/P1/P1_EEG/P1_Datasets/P1_' subj_dirs{subj_num} '/']);
    %     [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
    %     eeglab redraw;
    
    %Importing raw EEG data from .vhdr file
    EEG = pop_loadbv(['/Users/lorna.quandt/Dropbox/ABL/P1/P1_EEG/P1_Datasets/P1_' subj_dirs{subj_num} '/'], ['P1_' subj_dirs{subj_num} '.vhdr'], [], [])
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname', [subj_dirs{subj_num} '_eeg'],'gui','off');
    eeglab redraw;

    % Channel Locations
    EEG=pop_chanedit(EEG, 'load',{'/Users/lorna.quandt/Documents/BV_64_updated.ced' 'filetype' 'autodetect'});
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',[subj_dirs{subj_num} '_locs'],'gui','off'); 
    eeglab redraw;
    
    % Rereferencing
    % Add a new channel, name it Cz, declare it as the reference
    EEG=pop_chanedit(EEG, 'append',64,'changefield',{65 'labels' 'Cz'},'lookup','/Users/lorna.quandt/Documents/eeglab14_0_0b/plugins/dipfit2.3/standard_BESA/standard-10-5-cap385.elp','setref',{'1:65' 'Cz'});
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG = eeg_checkset( EEG );
    % Rereference to average ref
    EEG = pop_reref( EEG, [],'refloc',struct('labels',{'Cz'},'type',{''},'theta',{0},'radius',{0},'X',{5.2047e-15},'Y',{0},'Z',{85},'sph_theta',{0},'sph_phi',{90},'sph_radius',{85},'urchan',{65},'ref',{'Cz'},'datachan',{0}));
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off');
    EEG = eeg_checkset( EEG );
    %Rereference to averaged mastoids and save
    EEG = pop_reref( EEG, [10 21] );
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname',[subj_dirs{subj_num} '_reref'],'savenew',['/Users/lorna.quandt/Dropbox/ABL/P1/P1_EEG/P1_Datasets/P1_' subj_dirs{1} '/' subj_dirs{subj_num} '_reref.set'],'saveold',['/Users/lorna.quandt/Dropbox/ABL/P1/P1_EEG/P1_Datasets/P1_' subj_dirs{subj_num} '/' subj_dirs{subj_num} '_data.set'],'gui','off');    
    EEG = eeg_checkset( EEG );
    
    
    %Export event data
    pop_expevents(EEG, ['/Users/lorna.quandt/Dropbox/ABL/P1/P1_EEG/P1_Datasets/P1_' subj_dirs{subj_num} '/' subj_dirs{subj_num} '_event_exp.csv'], 'samples');
    
    disp('Next subject');
    
    clear all;
    
end; %end of subject loop

disp('Finished');
