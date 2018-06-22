import math
import numpy as np
import csv

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

def divideScoresIntoTenterRegions(num):
    return math.floor()
    if num >= -1 and num <= -0.6:
        return 10
    elif num > -0.6 and num <= -0.2:
        return 20
    elif num > -0.2 and num < 0.2:
        return 30
    elif num >= 0.2 and num < 0.6:
        return 40
    elif num >= 0.6 and num <= 1:
        return 50
for index in range(0, ranking.size):
    BaiduAnalysisOriginDataGoogleStandard[index] = divideScoresIntoFiveRegions(BaiduAnalysisOriginDataGoogleStandard[index])

list = np.arange(0.0, 3.0, 0.1)
for x in range(0,30):
    print (list[x], " " ,)
