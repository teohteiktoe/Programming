clear;
trans = [0.4,0.6;
         0.5,0.5];
%emis = [1/6 1/6 1/6 1/6 1/6 1/6;
  % 1/10 1/10 1/10 1/10 1/10 1/2];
  
  emis = [1/5 1/5 1/5 1/5 1/5;
      1/5 1/5 1/5 1/5 1/5];



%[seq,states] = hmmgenerate(100,trans,emis);
%estimatedStates = hmmviterbi(seq,trans,emis);

%[seq,states] = ...
 %  hmmgenerate(100,trans,emis,...
   %            'Statenames',{'fair';'loaded'});

seq = [1 2 3 4 5 5 4 3 2 1 5 5 5 5 5];
states = [1 2 2 2 2 2 2 2 1 1 2 2 2 2 2];
%estimatedStates = hmmviterbi(seq,trans,emis);

%[seq,states] = ...
%   hmmgenerate(100,trans,emis,...
%               'Statenames',{'fair';'loaded'});
estimatesStates = ...
   hmmviterbi(seq,trans,emis,...
              'Statenames',{'No Attack';'Attack'});