%% THIS PART GOES TO "APPLYING GAMMATOME FILTERBANK"

%% Applying gammatone filterbank

% genererates conclear transformation, wave form into space 
%( closest filter in F and then spreads in space a little )
disp('Passing the sound through gammatone filterbank ... ')

bm_upsampled = gammatoneFast(s,F,Fs); 
% 16000 timepoints
% 100 frequency lengths 

% HEARING LOSS:

% Values for pure tone audiogram fo SNHL
aud_freq = [250, 500, 1000, 2000, 4000, 8000]; %HZ
aud_hl = [30, 32, 35, 42, 45, 50]; %dB

% Apply hearing loss function

bm_upsampled = hearing_loss(aud_freq, aud_hl, bm_upsampled, F);

% reduce the size of it 

color='k'; figureSpec(1:length(bm_upsampled),F,squeeze(bm_upsampled'),2,'Gammatone filter output',color);

% time response for all filters reflected here 
% mean over time 
% mean over space 



%% THIS IS A FUNCTION
%% Hearing loss function
function bm_hl = hearing_loss(aud_freq, aud_hl, bm, F)

% fit 2nd order polynomial and estimate values  
fit_hl = polyfit(aud_freq,aud_hl,2);
fit_est = fit_hl(1)*F.^2 + fit_hl(2)*F + fit_hl(3);

% Calucalte scalars, to apply to gammatone filterbank output
% power_scalar = 10 .^ (fit_est ./ 10);
scalar = 10 .^ (fit_est ./ 50);
% dB_scalar = fit_est;


% Apply scalar to gammatone filterbank output
bm_hl = rdivide(bm, scalar);  

end
