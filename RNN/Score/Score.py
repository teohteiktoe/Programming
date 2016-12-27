print ("RNN Start\n")

Soft1026 = 0.8
Trojan = 0.7
Malware = 0.5
Worm = 0.4
Virus = 0.3
Forced_Off = 0.7
Failed_Login = 0.4
Severity = 0.8
Very_High = 0.9
High = 0.7
Medium = 0.5
Low = 0.2

j = 1
i = 1
k = 0

score = {}
#score_readback={}
word_found = {}
label={}
score_series = {}
score_2_input = {}
results = {}
# import numpy as np
# a = np.ones((865,1))

# print (score[1])

while j <= 7:
    print (j)
    if j == 1:
        print ("\nForce-off\n")
        file = open('Forced-off.csv', "r")
        #file = open('RNN.csv', "r")
    # file.close
    # print file_text
    if j == 2:
        print ('\nTrojan\n')
        file = open('trojan.csv', "r")
    # file_text = file.read()
    # file.close
    # print file_text
    if j == 3:
        print ('\nVirus\n')
        file = open('virus.csv', "r")
    # file_text = file.read()
    # print file_text
    if j == 4:
        file = open('soft1026.csv', "r")
        print ('Soft1026')
    # print file_text
    if j == 5:
        file = open("Login_Fail_100.csv", "r")
        print ('Login Fail')
    if j == 6:
        file = open("Severity Very High 100.csv", "r")
        print ('Severity High')
    if j == 7:
        file = open("Normal_500.csv", "r")
        print ('Normal')

    for tline in file:
        tline = tline[:-1]
        score_2_input[i - 1, i - 1] = [0, 0]
        score[i - 1] = 0
        word_found [i-1]=0
        results[i, 1] = "low Severity"

        b2 = 0
        a2 = 0
        a2 = tline.find('soft1026')
        b2 = a2
        if b2 != -1:
            score[i - 1] = Soft1026
            word_found[i-1]=1
            score_series[k, 1] = 1
            score_2_input[i - 1, i - 1] = [1, score[i - 1]]
            print ('Soft1026\n')
            results[i, 1] = "Soft1026"
        elif b2 == -1:
            score_series[k, 1] = 0

        b2 = 0
        a2 = 0
        a2 = tline.find('malware')
        b2 = a2
        if b2 != -1:
            score[i - 1] = score[i - 1] + Malware
            word_found[i - 1] = 1
            score_series[k, 2] = 1
            score_2_input[i - 1, i - 1] = [1, score[i - 1]]
            print ('malware\n')
            results[i, 1] = "malware"
        elif b2 == -1:
            score_series[k, 2] = 0

        b2 = 0
        a2 = 0
        a2 = tline.find('virus')
        b2 = a2
        if b2 != -1:
            score[i - 1] = score[i - 1] + Virus
            word_found[i - 1] = 1
            score_series[k, 3] = 1
            score_2_input[i - 1, i - 1] = [1, score[i - 1]]
            print ('Virus\n')
            results[i, 1] = "Virus"
        elif b2 == -1:
            score_series[k, 3] = 0

        b2 = 0
        a2 = 0
        a2 = tline.find('worm')
        b2 = a2
        if b2 != -1:
            score[i - 1] = score[i - 1] + Worm
            word_found[i - 1] = 1
            score_series[k, 4] = 1
            score_2_input[i - 1, i - 1] = [1, score[i - 1]]
            print ('Worm\n')
            results[i, 1] = "Worm"
        elif b2 == -1:
            score_series[k, 4] = 0

        b2 = 0
        a2 = 0
        a2 = tline.find('trojan')
        b2 = a2
        if b2 != -1:
            score[i - 1] = score[i - 1] + Trojan
            word_found[i - 1] = 1
            score_series[k, 5] = 1
            score_2_input[i - 1, i - 1] = [1, score[i - 1]]
            print ('Trojan\n')
            results[i, 1] = "Trojan"
        elif b2 == -1:
            score_series[k, 5] = 0

        b2 = 0
        a2 = 0
        a2 = tline.find('forced-off')
        b2 = a2
        if b2 != -1:
            score[i - 1] = score[i - 1] + Forced_Off
            word_found[i - 1] = 1
            score_series[k, 6] = 1
            score_2_input[i - 1, i - 1] = [1, score[i - 1]]
            print ('Forced Off\n')
            results[i, 1] = "Forced Off"
        elif b2 == -1:
            score_series[k, 6] = 0

        b2 = 0
        a2 = 0
        a2 = tline.find('Failed Login')
        b2 = a2
        if b2 != -1:
            score[i - 1] = score[i - 1] + Failed_Login
            word_found[i - 1] = 1
            score_series[k, 7] = 1
            score_2_input[i - 1, i - 1] = [1, score[i - 1]]
            print ('Failed Login\n')
            results[i, 1] = "Failed Logoin"
        elif b2 == -1:
            score_series[k, 7] = 0

        score_series[k, 8] = 0
        b2 = 0
        a2 = 0
        print
        a2 = tline.find('very-high')
        b2 = a2
        if b2 != -1:
            score[i - 1] = score[i - 1] + Severity * Very_High
            word_found[i - 1] = 1
            score_series[k, 8] = Severity * Very_High
            score_2_input[i - 1, i - 1] = [0, score[i - 1]]
            print ('Severity Very High\n')
            results[i, 1] = "Severity Very High"

        b2 = 0
        a2 = 0
        print
        a2 = tline.find('very-high')
        b2 = a2
        if b2 != -1:
            score[i - 1] = score[i - 1] + Severity * Very_High
            score_series[k, 8] = Severity * Very_High
            score_2_input[1, i - 1] = score[i - 1]
            print ('Severity Very High\n')
            results[i, 1] = "Severity Very High"

        b2 = 0
        a2 = 0
        print
        a2 = tline.find('high')
        b2 = a2
        if b2 != -1:
            score[i - 1] = score[i - 1] + Severity * High
            score_series[k, 8] = Severity * High
            score_2_input[1, i - 1] = [1, score[i - 1]]
            print ('Severity High\n')
            results[i, 1] = "Severity High"

        b2 = 0
        a2 = 0
        print
        a2 = tline.find('Medium')
        b2 = a2
        if b2 != -1:
            score[i - 1] = score[i - 1] + Severity * Medium
            score_series[k, 8] = Severity * Medium
            score_2_input[1, i - 1] = [0, score[i - 1]]
            print ('Severity Medium\n')
            results[i, 1] = "Severity Medium"

        b2 = 0
        a2 = 0
        print
        a2 = tline.find('Low')
        b2 = a2
        if b2 != -1:
            score[i - 1] = score[i - 1] + Severity * Low
            score_series[k, 8] = Severity * Low
            score_2_input[1, i - 1] = [0, score[i - 1]]
            print ('Severity Low\n')
            results[i, 1] = "Severity Low"
        if score[i-1] > 0.7 and word_found[i-1]==1:
            label[i-1]=1
        elif score[i-1] > 0.15 and word_found[i-1]==0:
            label[i-1]=0.5
        else:
            label[i-1]=0
        i = i + 1
        k = k + 1
        print (i)
    #file.close()
    j = j + 1
f = open("Score.txt", "w")
f.write(str(score));
f.close()
f = open("Word.txt", "w")
f.write(str(word_found));
f.close()
f = open("Label.txt", "w")
f.write(str(label));
f.close()

print ("Program End")