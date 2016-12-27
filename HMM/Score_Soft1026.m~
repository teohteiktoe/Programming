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
    fprintf('Soft1026\n');
end

b2=0;
a2=0;
a2 = strfind(tline, 'malware');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Malware;
    fprintf('Malware\n');
end

b2=0;
a2=0;
a2 = strfind(tline, 'virus');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Virus;
    fprintf('Virus\n');
end

b2=0;
a2=0;
a2 = strfind(tline, 'worm');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Worm;
    fprintf('Worm\n');
end

b2=0;
a2=0;
a2 = strfind(tline, 'trojan');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Trojan;
    fprintf('Trojan\n');
end

b2=0;
a2=0;
a2 = strfind(tline, 'forced-off');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Forced_Off;
    fprintf('Force Off\n');
end


b2=0;
a2=0;
a2 = strfind(tline, 'Failed Login');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Failed_Login;
    fprintf('Force Off\n');
end

b2=0;
a2=0;
a2 = strfind(tline, 'very-high');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Severity*Very_High;
    fprintf('Severity Very High\n');
end

b2=0;
a2=0;
a2 = strfind(tline, 'high');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Severity*High;
    fprintf('Severity High\n');
end

b2=0;
a2=0;
a2 = strfind(tline, 'Medium');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Severity*Medium;
    fprintf('Severity Medium\n');
end

b2=0;
a2=0;
a2 = strfind(tline, 'Low');
b2=numel(a2);
if b2 ~= 0
    score(i) = score(i) + Severity*Low;
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
i=i+1;
tline = fgets(fid); 
end
fclose(fid);
j=j+1;
end