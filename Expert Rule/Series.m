clear;

Soft1026 = 0.8;
Trojan = 0.7;
Malware = 0.5;
Worm = 0.4;
Virus = 0.3;
Forced_Off = 0.1;
Failed_Login = 0.2;
Severity = 0.5;
Very_High= 0.9;
High=0.7;
Medium=0.5;
Low=0.2;

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
fprintf('\n\n%d\n', i);
score(i)=0;
b2=0;
a2=0;
a2 = strfind(tline, 'soft1026');
b2=numel(a2);
if b2 ~= 0
    score(i) = Soft1026;
    score_series(k,1)=1; 
    fprintf('Soft1026\n');
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
    fprintf('Force Off\n');
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
end

b2=0;
a2=0;
a2 = strfind(tline, 'high');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Severity*High;
    score_series(k,8)=Severity*High;
    fprintf('Severity High\n');
end

b2=0;
a2=0;
a2 = strfind(tline, 'Medium');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Severity*Medium;
    score_series(k,8)=Severity*Medium;
    fprintf('Severity Medium\n');
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
fprintf('J is :%d:\n', j);
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
