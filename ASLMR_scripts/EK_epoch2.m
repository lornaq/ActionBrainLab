% EEGLAB history file generated on the 13-Nov-2018
% ------------------------------------------------
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset('filename','0012_events.set','filepath','/Users/e.kubicek/Documents/PEN/ABL/PLDR/DATA/PLDR_D/BV_files/PLDR_0012/');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'GO_S_0'  'GO_S_45'  'GO_S_90'  'HI_S_0'  'HI_S_45'  'HI_S_90'  'JJ_S_0'  'JJ_S_45'  'JJ_S_90'  'JO_S_0'  'JO_S_45'  'JO_S_90'  'JU_S_0'  'JU_S_45'  'JU_S_90'  'UN_S_0'  'UN_S_45'  'UN_S_90'  }, [-1.5           3], 'newname', '0012_S_epochs', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew','/Users/e.kubicek/Documents/PEN/ABL/PLDR/DATA/PLDR_D/BV_files/PLDR_0012/0012_S_epochs.set','gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-1500     0]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'overwrite','on','gui','off'); 
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);
eeglab redraw;
