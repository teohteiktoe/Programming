text = fileread('Full_Medium.txt');
s = 1;
i=0;

for c = 1:3518
    if text(s)== '~'
        text1(s)=',';
        i=i+1;
    else
        text1(s)=text(s);
    end
    s=s+1;
end 

A=fopen('Full_Medium_CSV.txt', 'w');
fwrite(A,text1);
fclose(A);







