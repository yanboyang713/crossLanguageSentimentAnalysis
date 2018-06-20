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
print ("GooogleScoreOriginData with GoogleScoreGoogleTranslatedData Pearson correlation coefficient: ", r, p)

r, p = pearsonr(GooogleScoreOriginData, GoogleScoreYandexTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreYandexTranslatedData Pearson correlation coefficient: ", r, p)

r, p = pearsonr(GooogleScoreOriginData, GoogleScoreBaiduTranslatedData)
print ("GooogleScoreOriginData with GoogleScoreBaiduTranslatedData Pearson correlation coefficient: ", r, p)

r, p = pearsonr(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityGoogleTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityGoogleTranslatedData Pearson correlation coefficient: ", r, p)

r, p = pearsonr(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityYandexTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityYandexTranslatedData Pearson correlation coefficient: ", r, p)

r, p = pearsonr(BaiduPositiveProbabilityOriginData, BaiduPositiveProbabilityBaiduTranslatedData)
print ("BaiduPositiveProbabilityOriginData with BaiduPositiveProbabilityBaiduTranslatedData Pearson correlation coefficient: ", r, p)
