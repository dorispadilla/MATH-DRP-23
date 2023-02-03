file0 = open('a.us.txt', 'r')
file1 = open('daily_returns.txt','w')
read = file0.readlines()
file1.write('Date, Daily Return\n')

#Calculates daily return based on the opening prices of the current and next day
for i in range(1, len(read) - 1):
    idx_curr = read[i].index(',', read[i].index(',', 0) + 1)
    idx_next = read[i+1].index(',', read[i].index(',', 0) + 1)
    curr = float(read[i][11:idx_curr])
    next = float(read[i+1][11:idx_next])
    
    file1.write(read[i][:10] + ',' + str(round(next-curr, 5)) + '\n')

#Finds opening and closing prices of last entry
start_idx = read[-1].index(',', read[-1].index(',', read[-1].index(',', read[-1].index(',', 0) + 1)+ 1) + 1) + 1
end_idx = read[-1].index(',', read[-1].index(',', read[-1].index(',', read[-1].index(',', read[-1].index(',', 0) + 1) + 1)+ 1) + 1)
close_price = float(read[-1][start_idx:end_idx])

start_idx = 11
end_idx = read[-1].index(',', read[i].index(',', 0) + 1)
open_price = float(read[-1][start_idx:end_idx])

file1.write(read[-1][:10] + ',' + str(round(close_price - open_price, 5)))

file1.close()