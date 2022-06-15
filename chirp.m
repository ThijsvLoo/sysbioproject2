open_system('dspcochlear');


chirp_mat=zeros(8,16008);
chirp_mat(1,:)=SynSignal; %chirp wo noise, wo noise correction, w FIR
chirp_mat(2,:)=SynSignal; %chirp wo noise, wo noise correction, w IIR
chirp_mat(3,:)=SynSignal; %chirp wo noise, with noise correction, w FIR
chirp_mat(4,:)=SynSignal; %chirp wo noise, with noise correction, w IIR

chirp_mat(5,:)=SynSignal; %chirp with noise, wo noise correction, w FIR
chirp_mat(6,:)=SynSignal; %chirp with noise, wo noise correction, w IIR
chirp_mat(7,:)=SynSignal; %chirp with noise, with noise correction, w FIR
chirp_mat(8,:)=SynSignal; %chirp with noise, with noise correction, w IIR

save('chirp.mat','chirp_mat')
