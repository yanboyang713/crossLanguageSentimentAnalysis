import math
import numpy as np
import csv

heatmap = np.array([[0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0]])
ranking = np.array([])
GooogleScoreOriginData = np.array([])
GoogleScoreGoogleTranslatedData = np.array([])
GoogleScoreYandexTranslatedData = np.array([])
GoogleScoreBaiduTranslatedData = np.array([])

BaiduPositiveProbabilityOriginData = np.array([])
BaiduPositiveProbabilityGoogleTranslatedData = np.array([])
BaiduPositiveProbabilityYandexTranslatedData = np.array([])
BaiduPositiveProbabilityBaiduTranslatedData = np.array([])

BaiduAnalysisOriginDataGoogleStandard = np.array([])
BaiduAnalysisGoogleTranslatedDataGoogleStandard = np.array([])
BaiduAnalysisYandexTranslatedDataGoogleStandard = np.array([])
BaiduAnalysisBaiduTranslatedDataGoogleStandard = np.array([])

with open('goodDataLatest.csv', "r") as csvfile:
    readCSV = csv.reader(csvfile, delimiter=',')

    index = 0
    for row in readCSV:
        if index != 0:
            ranking = np.append(ranking, float(row[0]))
            GooogleScoreOriginData = np.append(GooogleScoreOriginData, float(row[11]))
            GoogleScoreGoogleTranslatedData = np.append(GoogleScoreGoogleTranslatedData, float(row[13]))
            GoogleScoreYandexTranslatedData = np.append(GoogleScoreYandexTranslatedData, float(row[16]))
            GoogleScoreBaiduTranslatedData = np.append(GoogleScoreBaiduTranslatedData, float(row[19]))

            BaiduPositiveProbabilityOriginData = np.append(BaiduPositiveProbabilityOriginData, float(row[3]))
            BaiduPositiveProbabilityGoogleTranslatedData = np.append(BaiduPositiveProbabilityGoogleTranslatedData, float(row[7]))
            BaiduPositiveProbabilityYandexTranslatedData = np.append(BaiduPositiveProbabilityYandexTranslatedData, float(row[25]))
            BaiduPositiveProbabilityBaiduTranslatedData = np.append(BaiduPositiveProbabilityBaiduTranslatedData, float(row[21]))

            BaiduAnalysisOriginDataGoogleStandard = np.append(BaiduAnalysisOriginDataGoogleStandard, float(row[29]))
            BaiduAnalysisGoogleTranslatedDataGoogleStandard = np.append(BaiduAnalysisGoogleTranslatedDataGoogleStandard, float(row[30]))
            BaiduAnalysisYandexTranslatedDataGoogleStandard = np.append(BaiduAnalysisYandexTranslatedDataGoogleStandard, float(row[31]))
            BaiduAnalysisBaiduTranslatedDataGoogleStandard = np.append (BaiduAnalysisBaiduTranslatedDataGoogleStandard, float(row[32]))


        index += 1

def divideScoresIntoTwentyRegions(num):
    print ("before num = ", num)

    num = np.around(num, decimals = 1)
    print ("after num = ", num)
    if num == -1:
        return 0
    elif num == 1:
        return 19
    elif num == -0.8:
        print ("*******")
    '''
    if num == -0.9 or num == -1:
        return 0
    elif num == -0.8:
        return 1
    elif num == 0.7:
        return 2
    elif num == -0.6:
        return 3
    elif num == -0.5:
        return 4
    elif num == -0.4:
        return 5
    elif num == -0.3:
        return 6
    elif num == -0.2:
        return 7
    elif num == -0.1:
        return 8
    elif num == 0.0:
        return 9
    elif num == 0.1:
        return 10
    elif num == 0.2:
        return 11
    elif num == 0.3:
        return 12
    elif num == 0.4:
        return 13
    elif num == 0.5:
        return 14
    elif num == 0.6:
        return 15
    elif num == 0.7:
        return 16
    elif num == 0.8:
        return 17
    elif num == 0.9:
        return 18
    elif num == 1:
        return 19
    np.around(num, decimals = 1)
    '''
    print ("return = ", int(math.floor((num + 1) * 10)) - 1)
    return np.around((num + 1) * 10 - 1, decimals = 1)
def divedeRanking(ranking):
    if ranking == 10:
        return 0
    elif ranking == 20:
        return 1
    elif ranking == 30:
        return 2
    elif ranking == 40:
        return 3
    elif ranking == 50:
        return 4
    else:
        return -1

for index in range(0, ranking.size):
    temp = divedeRanking(ranking[index])
    if temp != -1:
        ranking[index] = temp

    GooogleScoreOriginData[index] = divideScoresIntoTwentyRegions(GooogleScoreOriginData[index])
    GoogleScoreGoogleTranslatedData[index] = divideScoresIntoTwentyRegions(GoogleScoreGoogleTranslatedData[index])
    GoogleScoreYandexTranslatedData[index] = divideScoresIntoTwentyRegions(GoogleScoreYandexTranslatedData[index])
    GoogleScoreBaiduTranslatedData[index] = divideScoresIntoTwentyRegions(GoogleScoreBaiduTranslatedData[index])

    BaiduAnalysisOriginDataGoogleStandard[index] = divideScoresIntoTwentyRegions(BaiduAnalysisOriginDataGoogleStandard[index])
    BaiduAnalysisGoogleTranslatedDataGoogleStandard[index] = divideScoresIntoTwentyRegions(BaiduAnalysisGoogleTranslatedDataGoogleStandard[index])
    BaiduAnalysisYandexTranslatedDataGoogleStandard[index] = divideScoresIntoTwentyRegions(BaiduAnalysisYandexTranslatedDataGoogleStandard[index])
    BaiduAnalysisBaiduTranslatedDataGoogleStandard[index] = divideScoresIntoTwentyRegions(BaiduAnalysisBaiduTranslatedDataGoogleStandard[index])

tempIndex = ranking.size
for index in range(0, ranking.size):
    heatmap[int(GooogleScoreOriginData[index])][int(ranking[index])] = heatmap[int(GooogleScoreOriginData[index])][int(ranking[index])] + 1

print (heatmap)
