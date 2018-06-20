import scipy
import numpy as np
from scipy.stats import pearsonr
from scipy.stats import spearmanr
import csv

GooogleScoreOriginData = np.array([])
GoogleScoreGoogleTranslatedData = np.array([])
GoogleScoreYandexTranslatedData = np.array([])
GoogleScoreBaiduTranslatedData = np.array([])

BaiduPositiveProbabilityOriginData = np.array([])
BaiduPositiveProbabilityGoogleTranslatedData = np.array([])
BaiduPositiveProbabilityYandexTranslatedData = np.array([])
BaiduPositiveProbabilityBaiduTranslatedData = np.array([])

with open('goodDataLatest.csv', "r") as csvfile:
    readCSV = csv.reader(csvfile, delimiter=',')

    index = 0
    for row in readCSV:
        if index != 0:
            GooogleScoreOriginData = np.append(GooogleScoreOriginData, float(row[11]))
            GoogleScoreGoogleTranslatedData = np.append(GoogleScoreGoogleTranslatedData, float(row[13]))
            GoogleScoreYandexTranslatedData = np.append(GoogleScoreYandexTranslatedData, float(row[16]))
            GoogleScoreBaiduTranslatedData = np.append(GoogleScoreBaiduTranslatedData, float(row[19]))

            BaiduPositiveProbabilityOriginData = np.append(BaiduPositiveProbabilityOriginData, float(row[3]))
            BaiduPositiveProbabilityGoogleTranslatedData = np.append(BaiduPositiveProbabilityGoogleTranslatedData, float(row[7]))
            BaiduPositiveProbabilityYandexTranslatedData = np.append(BaiduPositiveProbabilityYandexTranslatedData, float(row[25]))
            BaiduPositiveProbabilityBaiduTranslatedData = np.append(BaiduPositiveProbabilityBaiduTranslatedData, float(row[21]))

        index += 1

#Pearson correlation coefficient
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

#until there
#Kendall’s tau, a correlation
r, p = scipy.stats.kendalltau(x, y)
print (float(kendallTau), kendallPvalue)

r, p = scipy.stats.(GooogleScoreOriginData, GoogleScoreGoogleTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreGoogleTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.(GooogleScoreOriginData, GoogleScoreYandexTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreYandexTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.(GooogleScoreOriginData, GoogleScoreBaiduTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreBaiduTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityGoogleTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityGoogleTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityYandexTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityYandexTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)

r, p = scipy.stats.(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityBaiduTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityBaiduTranslatedData Spearman correlation coefficient: ", r, "p-vlue: ", p)
