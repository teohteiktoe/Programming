
B = fopen('Full_Medium.txt', 'r');

s = 1;
i=0;
while ~eof(B)
    line=fgetl(B);
    if text(s)== '~'
        text1(s)=',';
        i=i+1;
    else
        text1(s)=text(s);
    end
    s=s+1;
end 

A=fopen('Full_Medium_CSV.csv', 'w');
fwrite(A,text1);
fclose(A);