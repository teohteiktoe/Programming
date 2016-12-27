fid = fopen('Full_Medium.txt','r');
count = 0;

while ~feof(fid)
    line = fgetl(fid);
    if isempty(line) || strncmp(line,'%',1) || ~ischar(line)
        continue
    end
    count = count + 1;
   
end
count
fclose(fid);