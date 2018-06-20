import csv
import numpy as np
ranking10 = np.array([])
ranking20 = np.array([])
ranking30 = np.array([])
ranking40 = np.array([])
ranking50 = np.array([])
with open('goodDataLatest.csv', "r") as csvfile:
    readCSV = csv.reader(csvfile, delimiter=',')

    index = 0
    for row in readCSV:
        if index != 0:
            ranking = int(row[0])
            value = row[29]
            if ranking == 10:
                ranking10 = np.append( ranking10 , value)
            elif ranking == 20:
                ranking20 = np.append (ranking20, value)
            elif ranking == 30:
                ranking30 = np.append (ranking30, value)
            elif ranking == 40:
                ranking40 = np.append (ranking40, value)
            elif ranking == 50:
                ranking50 = np.append (ranking50, value)
        index += 1
