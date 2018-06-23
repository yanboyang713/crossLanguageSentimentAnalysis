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
    print ("num = ", num)
    if num == -0.8:
        print ("&&&&&&&&&&&&&&&")
    if num == -1:
        return 0
    elif num == 1:
        return 19
    else:
        return math.floor((num + 1) * 10) - 1
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

    print ("before: ", GooogleScoreOriginData[index])
    GooogleScoreOriginData[index] = divideScoresIntoTwentyRegions(np.around(GooogleScoreOriginData[index], decimals = 1))

    print ("after: ", GooogleScoreOriginData[index])
    if GooogleScoreOriginData[index] == 2:
        print ("*********************")
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
