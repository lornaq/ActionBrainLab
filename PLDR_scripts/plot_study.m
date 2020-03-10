% EEGLAB history file generated on the 13-Aug-2019
% ------------------------------------------------
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
[STUDY ALLEEG] = pop_loadstudy('filename', 'Study_Hard_only.study', 'filepath', '/Users/lorna.quandt/Dropbox/PLDR/PLDR_data/PLDR_EEGLAB/PLDR_D');
CURRENTSTUDY = 1; EEG = ALLEEG; CURRENTSET = [1:length(EEG)];
[STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, {},'savetrials','on','interp','on','recompute','on','ersp','on','erspparams',{'cycles' [4 0.8]  'nfreqs' 100 'freqs' [3 30]  'ntimesout' 200});
EEG = eeg_checkset( EEG );
[STUDY EEG] = pop_savestudy( STUDY, EEG, 'savemode','resave');
CURRENTSTUDY = 1; EEG = ALLEEG; CURRENTSET = [1:length(EEG)];
EEG = eeg_checkset( EEG );
[STUDY EEG] = pop_savestudy( STUDY, EEG, 'savemode','resave');
CURRENTSTUDY = 1; EEG = ALLEEG; CURRENTSET = [1:length(EEG)];
eeglab redraw;
