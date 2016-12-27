clear;

Soft1026 = 0.8;
Trojan = 0.7;
Malware = 0.5;
Worm = 0.4;
Virus = 0.3;
Forced_Off = 0.5;
Failed_Login = 0.4;
Severity = 0.5;
Very_High= 0.9;
High=0.7;
Medium=0.5;
Low=0.2;

%HMM
No_Attack_To_Attack = 0.4;
Attack_To_No_Attack = 0.4;
trans = [1-No_Attack_To_Attack, No_Attack_To_Attack;
         Attack_To_No_Attack, 1-Attack_To_No_Attack];
  
emis = [1.5/5 1.25/5 1/5 0.75/5 0.5/5;
      0.5/5 0.75/5 1/5 1.25/5 1.5/5];
j=1;
i=1;
k=1;
while j <= 7
if j==1
    fid = fopen('Forced-off.csv'); 
end
if j==2
    fid = fopen('Trojan.csv'); 
end
if j==3
    fid = fopen('virus.csv'); 
end 
if j==4
    fid = fopen('soft1026.csv'); 
end
if j==5
    fid = fopen('Login_Fail_100.csv'); 
end
if j==6
    fid = fopen('Severity Very High 100.csv'); 
end
if j==7
     fid = fopen('normal_500.csv');  
end

%i=0;    
tline = fgets(fid); %remove title


%i=1;
tline = fgets(fid); 


while tline ~= -1
results(i,1)={'low Severity'};
score(i)=0;
b2=0;
a2=0;
a2 = strfind(tline, 'soft1026');
b2=numel(a2);
if b2 ~= 0
    score(i) = Soft1026;
    score_series(k,1)=1; 
    fprintf('Soft1026\n');
    results(i,1)={'Soft1026'};
elseif b2==0
    score_series(k,1)=0;
end

b2=0;
a2=0;
a2 = strfind(tline, 'malware');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Malware;
    score_series(k,2)=1; 
    fprintf('Malware\n');
    results(i,1)={'Malware'};
elseif b2==0
    score_series(k,2)=0;
end

b2=0;
a2=0;
a2 = strfind(tline, 'virus');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Virus;
    score_series(k,3)=1;
    fprintf('Virus\n');
    results(i,1)={'Virus'};
elseif b2==0
    score_series(k,3)=0;
end

b2=0;
a2=0;
a2 = strfind(tline, 'worm');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Worm;
    score_series(k,4)=1;
    fprintf('Worm\n');
    results(i,1)={'Worm'};
elseif b2==0
    score_series(k,4)=0;
end

b2=0;
a2=0;
a2 = strfind(tline, 'trojan');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Trojan;
    score_series(k,5)=1;
    fprintf('Trojan\n');
    results(i,1)={'Trojan'};
elseif b2==0
    score_series(k,5)=0;
end

b2=0;
a2=0;
a2 = strfind(tline, 'forced-off');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Forced_Off;
    score_series(k,6)=1;
    fprintf('Force Off\n');
    results(i,1)={'Force Off'};
elseif b2==0
    score_series(k,6)=0;
end


b2=0;
a2=0;
a2 = strfind(tline, 'Failed Login');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Failed_Login;
    score_series(k,7)=1;
    fprintf('Failed Login\n');
    results(i,1)={'Failed Login'};
elseif b2==0
    score_series(k,7)=0;
end

score_series(k,8)=0;
b2=0;
a2=0;
a2 = strfind(tline, 'very-high');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Severity*Very_High;
    score_series(k,8)=Severity*Very_High;
    fprintf('Severity Very High\n');
    results(i,1)={'Severity Very High'};
end

b2=0;
a2=0;
a2 = strfind(tline, 'high');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Severity*High;
    score_series(k,8)=Severity*High;
    fprintf('Severity High\n');
    results(i,1)={'Severity High'};
end

b2=0;
a2=0;
a2 = strfind(tline, 'Medium');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Severity*Medium;
    score_series(k,8)=Severity*Medium;
    fprintf('Severity Medium\n');
    results(i,1)={'Severity Medium'};
end

b2=0;
a2=0;
a2 = strfind(tline, 'Low');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Severity*Low;
    score_series(k,8)=Severity*Low;
    fprintf('Severity Low\n');
end

b2=0;
a2=0;
a2 = strfind(tline, 'eventseverity');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Severity*(tline(a2+15)*0.01);
    fprintf('Severity is :%d:\n', tline(a2+15));
end
fprintf('j is :%d: i is :%d:\n', j, i);
fprintf('Total score is :%i:\n', score(i));
fprintf('Series score is :%i: :%i: :%i: :%i: :%i: :%i: :%i: :%f:\n', ...
    score_series(k,1), score_series(k,2), ...
    score_series(k,3), score_series(k,4), ...
    score_series(k,5), score_series(k,6), ...
    score_series(k,7), score_series(k,8));
i=i+1;
k=k+1;
tline = fgets(fid); 
end
fclose(fid);
j=j+1;
end

Num_log = i;

i=1
while i<Num_log
    if score(i)<0.15
        hmm_score(i)=1;
        hmm_state(i) = 1;
    elseif score(i)<0.3
        hmm_score(i)=2;
        hmm_state(i) = 1;
    elseif score(i)<0.45
        hmm_score(i)=3;
        hmm_state(i) = 1;
    elseif score(i)<0.6
        hmm_score(i)=4;
        hmm_state(i)=2;
    else
        hmm_score(i)=5;
        hmm_state(i)=2;
    end
    %fprintf('HMM score is :%i: and hmm state is :%i:\n', hmm_score(i), hmm_state(i));
    i=i+1;
end


estimatesStates = ...
   hmmviterbi(hmm_score,trans,emis,...
              'Statenames',{'No Attack';'Attack'});
          
i=1;
while i<Num_log
    %fprintf(':%i: Total score is :%f: Attack :%s:\n', i, score(i), results(i,2));
    fprintf(':%i: Total score is :%f:\n', i, score(i));
    results(i,2)=estimatesStates(i);
    results(i,1)
    results(i,2)
    i=i+1;
end

