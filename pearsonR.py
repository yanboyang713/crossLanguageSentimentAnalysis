import scipy
import numpy as np
from scipy.stats import pearsonr
from scipy.stats import spearmanr

x = scipy.array([-0.7,  2.0, 3.0])
y = scipy.array([-0.6,  2.0, 3.0])

a = np.array([0, 0, 0, 1, 1, 1, 1])
b = np.array([0, 0, 0, 1, 1, 1, 1])
#Pearson correlation coefficient
r_row, p_value = pearsonr(x, y)
print (pearsonr([1,2,3,4,5],[1,2,3,4,5]))
print (r_row, p_value)


#Spearman rank-order correlation coefficient
#spearmanCorrelation, spearmanPvalue = spearmanr([1,2,3,4,5],[1,2,3,4,5])
#spearmanCorrelation, spearmanPvalue = spearmanr(x,y)
spearmanCorrelation, spearmanPvalue = spearmanr(a,b)
print (spearmanCorrelation, spearmanPvalue)
print (spearmanr([1,2,3,4,5],[1,2,3,4,5]))

#point biserial correlation coefficient
pointBiserialCorrelation, pointBiserialPvalue = scipy.stats.pointbiserialr(x, y)
print (pointBiserialCorrelation, pointBiserialPvalue)
print (scipy.stats.pointbiserialr([1,2,3,4,5],[1,2,3,4,5]))

#Kendall’s tau, a correlation
kendallTau, kendallPvalue = scipy.stats.kendalltau(x, y)
print (float(kendallTau), kendallPvalue)

slope, intercept, r_value, p_value, std_err = scipy.stats.linregress(x,y)
print (slope)
