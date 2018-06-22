import scipy
import numpy as np
from scipy.stats import pearsonr
from scipy.stats import spearmanr
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
            ranking = np.append(ranking, row[0])
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

#Pearson correlation coefficient
print ("pearson")
r, p = pearsonr(GooogleScoreOriginData, GoogleScoreGoogleTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreGoogleTranslatedData Pearson correlation coefficient: ", r, "p-vlue: ", p)

r, p = pearsonr(GooogleScoreOriginData, GoogleScoreYandexTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreYandexTranslatedData Pearson correlation coefficient: ", r, "p-vlue: ", p)

r, p = pearsonr(GooogleScoreOriginData, GoogleScoreBaiduTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreBaiduTranslatedData Pearson correlation coefficient: ", r, "p-vlue: ", p)

r, p = pearsonr(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityGoogleTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityGoogleTranslatedData Pearson correlation coefficient: ", r, "p-vlue: ", p)

r, p = pearsonr(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityYandexTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityYandexTranslatedData Pearson correlation coefficient: ", r, "p-vlue: ", p)

r, p = pearsonr(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityBaiduTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityBaiduTranslatedData Pearson correlation coefficient: ", r, "p-vlue: ", p)

#Spearman rank-order correlation coefficient
print ("start spearman")
r, p = spearmanr(GooogleScoreOriginData, GoogleScoreGoogleTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreGoogleTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = spearmanr(GooogleScoreOriginData, GoogleScoreYandexTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreYandexTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = spearmanr(GooogleScoreOriginData, GoogleScoreBaiduTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreBaiduTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = spearmanr(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityGoogleTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityGoogleTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = spearmanr(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityYandexTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityYandexTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = spearmanr(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityBaiduTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityBaiduTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

#point biserial correlation coefficient
print ("start point biserial")
r, p = scipy.stats.pointbiserialr(GooogleScoreOriginData, GoogleScoreGoogleTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreGoogleTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.pointbiserialr(GooogleScoreOriginData, GoogleScoreYandexTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreYandexTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.pointbiserialr(GooogleScoreOriginData, GoogleScoreBaiduTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreBaiduTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.pointbiserialr(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityGoogleTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityGoogleTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.pointbiserialr(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityYandexTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityYandexTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.pointbiserialr(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityBaiduTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityBaiduTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

#Kendall’s tau, a correlation
print ("start kendall")
r, p = scipy.stats.kendalltau(GooogleScoreOriginData, GoogleScoreGoogleTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreGoogleTranslatedData Spearman correlation coefficient: ", float(r), "p-vlue: ", p)

r, p = scipy.stats.kendalltau(GooogleScoreOriginData, GoogleScoreYandexTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreYandexTranslatedData Spearman correlation coefficient: ", float(r), "p-vlue: ", p)

r, p = scipy.stats.kendalltau(GooogleScoreOriginData, GoogleScoreBaiduTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreBaiduTranslatedData Spearman correlation coefficient: ", float(r), "p-vlue: ", p)

r, p = scipy.stats.kendalltau(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityGoogleTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityGoogleTranslatedData Spearman correlation coefficient: ", float(r), "p-vlue: ", p)

r, p = scipy.stats.kendalltau(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityYandexTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityYandexTranslatedData Spearman correlation coefficient: ", float(r), "p-vlue: ", p)

r, p = scipy.stats.kendalltau(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityBaiduTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityBaiduTranslatedData Spearman correlation coefficient: ", float(r), "p-vlue: ", p)

def divideScoresIntoFiveRegions(num):
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
    BaiduAnalysisGoogleTranslatedDataGoogleStandard[index] = divideScoresIntoFiveRegions(BaiduAnalysisGoogleTranslatedDataGoogleStandard[index])
    BaiduAnalysisYandexTranslatedDataGoogleStandard[index] = divideScoresIntoFiveRegions(BaiduAnalysisYandexTranslatedDataGoogleStandard[index])
    BaiduAnalysisBaiduTranslatedDataGoogleStandard[index] = divideScoresIntoFiveRegions(BaiduAnalysisBaiduTranslatedDataGoogleStandard[index])

    GooogleScoreOriginData[index] = divideScoresIntoFiveRegions(GooogleScoreOriginData[index])
    GoogleScoreGoogleTranslatedData[index] = divideScoresIntoFiveRegions(GoogleScoreGoogleTranslatedData[index])
    GoogleScoreYandexTranslatedData[index] = divideScoresIntoFiveRegions(GoogleScoreYandexTranslatedData[index])
    GoogleScoreBaiduTranslatedData[index] = divideScoresIntoFiveRegions(GoogleScoreBaiduTranslatedData[index])

#Pearson correlation coefficient
print ("start sentiment score with ranking")
print ("start pearson")
#google
r, p = pearsonr(GooogleScoreOriginData, ranking)
print ("GooogleScoreOriginData with ranking Pearson correlation coefficient: ", r, "p-vlue: ", p)

r, p = pearsonr(GoogleScoreGoogleTranslatedData, ranking)
print ("GoogleScoreGoogleTranslatedData with ranking Pearson correlation coefficient: ", r, "p-value: ", p)

r, p = pearsonr(GoogleScoreYandexTranslatedData, ranking)
print ("GoogleScoreYandexTranslatedData with ranking Pearson correlation coefficient: ", r, "p-value: ", p)

r, p = pearsonr(GoogleScoreBaiduTranslatedData, ranking)
print ("GoogleScoreBaiduTranslatedData with ranking Pearson correlation coefficient: ", r, "p-value: ", p)
#baidu
r, p = pearsonr(BaiduAnalysisOriginDataGoogleStandard, ranking)
print ("BaiduAnalysisOriginDataGoogleStandard with ranking Pearson correlation coefficient: ", r, "p-vlue: ", p)

r, p = pearsonr(BaiduAnalysisGoogleTranslatedDataGoogleStandard, ranking)
print ("BaiduAnalysisGoogleTranslatedDataGoogleStandard with ranking Pearson correlation coefficient: ", r, "p-value: ", p)

r, p = pearsonr(BaiduAnalysisYandexTranslatedDataGoogleStandard, ranking)
print ("BaiduAnalysisYandexTranslatedDataGoogleStandard with ranking Pearson correlation coefficient: ", r, "p-value: ", p)

r, p = pearsonr(BaiduAnalysisBaiduTranslatedDataGoogleStandard, ranking)
print ("BaiduAnalysisBaiduTranslatedDataGoogleStandard with ranking Pearson correlation coefficient: ", r, "p-value: ", p)


#Spearman rank-order correlation coefficient
print ("start spearman")
#google
r, p = spearmanr(GooogleScoreOriginData, ranking)
print ("GooogleScoreOriginData with ranking Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = spearmanr(GoogleScoreGoogleTranslatedData, ranking)
print ("GoogleScoreGoogleTranslatedData with ranking Spearman correlation coefficient: ", r, "p-value: ", p)

r, p = spearmanr(GoogleScoreYandexTranslatedData, ranking)
print ("GoogleScoreYandexTranslatedData with ranking Spearman correlation coefficient: ", r, "p-value: ", p)

r, p = spearmanr(GoogleScoreBaiduTranslatedData, ranking)
print ("GoogleScoreBaiduTranslatedData with ranking Spearman correlation coefficient: ", r, "p-value: ", p)
#baidu
r, p = spearmanr(BaiduAnalysisOriginDataGoogleStandard, ranking)
print ("BaiduAnalysisOriginDataGoogleStandard with ranking Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = spearmanr(BaiduAnalysisGoogleTranslatedDataGoogleStandard, ranking)
print ("BaiduAnalysisGoogleTranslatedDataGoogleStandard with ranking Spearman correlation coefficient: ", r, "p-value: ", p)

r, p = spearmanr(BaiduAnalysisYandexTranslatedDataGoogleStandard, ranking)
print ("BaiduAnalysisYandexTranslatedDataGoogleStandard with ranking Spearman correlation coefficient: ", r, "p-value: ", p)

r, p = spearmanr(BaiduAnalysisBaiduTranslatedDataGoogleStandard, ranking)
print ("BaiduAnalysisBaiduTranslatedDataGoogleStandard with ranking Spearman correlation coefficient: ", r, "p-value: ", p)


#point biserial correlation coefficient
print ("start point biserial")
#google
r, p = scipy.stats.pointbiserialr(GooogleScoreOriginData, ranking)
print ("GooogleScoreOriginData with ranking point biserial correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.pointbiserialr(GoogleScoreGoogleTranslatedData, ranking)
print ("GoogleScoreGoogleTranslatedData with ranking point biserial correlation coefficient: ", r, "p-value: ", p)

r, p = scipy.stats.pointbiserialr(GoogleScoreYandexTranslatedData, ranking)
print ("GoogleScoreYandexTranslatedData with ranking point biserial correlation coefficient: ", r, "p-value: ", p)

r, p = scipy.stats.pointbiserialr(GoogleScoreBaiduTranslatedData, ranking)
print ("GoogleScoreBaiduTranslatedData with ranking point biserial correlation coefficient: ", r, "p-value: ", p)
#baidu
r, p = scipy.stats.pointbiserialr(BaiduAnalysisOriginDataGoogleStandard, ranking)
print ("BaiduAnalysisOriginDataGoogleStandard with ranking point biserial correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.pointbiserialr(BaiduAnalysisGoogleTranslatedDataGoogleStandard, ranking)
print ("BaiduAnalysisGoogleTranslatedDataGoogleStandard with ranking point biserial correlation coefficient: ", r, "p-value: ", p)

r, p = scipy.stats.pointbiserialr(BaiduAnalysisYandexTranslatedDataGoogleStandard, ranking)
print ("BaiduAnalysisYandexTranslatedDataGoogleStandard with ranking point biserial correlation coefficient: ", r, "p-value: ", p)

r, p = scipy.stats.pointbiserialr(BaiduAnalysisBaiduTranslatedDataGoogleStandard, ranking)
print ("BaiduAnalysisBaiduTranslatedDataGoogleStandard with ranking point biserial correlation coefficient: ", r, "p-value: ", p)


#Kendall’s tau, a correlation
print ("start kendall")
#google
r, p = scipy.stats.kendalltau(GooogleScoreOriginData, ranking)
print ("GooogleScoreOriginData with ranking kendall correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.kendalltau(GoogleScoreGoogleTranslatedData, ranking)
print ("GoogleScoreGoogleTranslatedData with ranking kendall correlation coefficient: ", r, "p-value: ", p)

r, p = scipy.stats.kendalltau(GoogleScoreYandexTranslatedData, ranking)
print ("GoogleScoreYandexTranslatedData with ranking kendall correlation coefficient: ", r, "p-value: ", p)

r, p = scipy.stats.kendalltau(GoogleScoreBaiduTranslatedData, ranking)
print ("GoogleScoreBaiduTranslatedData with ranking kendall correlation coefficient: ", r, "p-value: ", p)
#baidu
r, p = scipy.stats.kendalltau(BaiduAnalysisOriginDataGoogleStandard, ranking)
print ("BaiduAnalysisOriginDataGoogleStandard with ranking kendall correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.kendalltau(BaiduAnalysisGoogleTranslatedDataGoogleStandard, ranking)
print ("BaiduAnalysisGoogleTranslatedDataGoogleStandard with ranking kendall correlation coefficient: ", r, "p-value: ", p)

r, p = scipy.stats.kendalltau(BaiduAnalysisYandexTranslatedDataGoogleStandard, ranking)
print ("BaiduAnalysisYandexTranslatedDataGoogleStandard with ranking kendall correlation coefficient: ", r, "p-value: ", p)

r, p = scipy.stats.kendalltau(BaiduAnalysisBaiduTranslatedDataGoogleStandard, ranking)
print ("BaiduAnalysisBaiduTranslatedDataGoogleStandard with ranking kendall correlation coefficient: ", r, "p-value: ", p)
