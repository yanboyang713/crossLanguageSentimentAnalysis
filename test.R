install.packages("magrittr")
install.packages("rtf")
install.packages("NonCompart")
install.packages("ncar")

library(magrittr)
library(dplyr)
library(rtf)
library(NonCompart)
library(ncar)
data <- read.csv(file="goodDataLatest.csv",head=TRUE,sep=",")
#There are several quartiles of an observation variable. The first quartile, or lower quartile, is the value that cuts off the first 25% of the data when it is sorted in ascending order. The second quartile, or median, is the value that cuts off the first 50%. The third quartile, or upper quartile, is the value that cuts off the first 75%.

#Calculate first quartile (Q1), third quartile (Q3) and the interquartile range (IQR=Q3-Q1). 
#Compute Q1–1.5 × IQR and Compute Q3+1.5 × IQR Anything outside this range is an outlier.



#Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.
info <-
  data %>% group_by(ranking) %>% 
  summarise(IQR=IQR(Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.), Mean=mean(Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.), Median=median(Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.), Q1=quantile (Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data., probs=0.25), Q3=quantile(Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data., probs=0.75))

lowerExtreme <- info$Q1 - 1.5 * info$IQR
upperExtreme <- info$Q3 + 1.5 * info$IQR
info <- cbind(info, lowerExtreme, upperExtreme)
rm(lowerExtreme, upperExtreme)

#slope first Argument: vector values of independent variable, usually time. Second argument: vector values of dependent variable, usually concentration
meanSlope <- lm(info$Mean ~ info$ranking)$coeff[2]
medianSlope <- lm(info$Median ~ info$ranking)$coeff[2]

meanSlope
medianSlope
info

write.csv(info, file = "BaiduSentimentAnalysisBaseOnOriginDataInfo.csv", row.names = FALSE, na="")


selectData <- data %>% select(ranking, Chinese.origin.data, Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.) %>%
  filter(ranking == "10")%>%
  filter(Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data. < info$lowerExtreme[1] | Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data. > info$upperExtreme[1])

output <- data.frame(ranking10ChineseOriginData = selectData$Chinese.origin.data,
                     ranking10BaiduChineseSentimentAnalysisPositiveProbabilityBaseOnChineseOriginData = selectData$Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.)

write.csv(output, file = "BaiduSentimentAnalysisBaseOnOriginDataOutliner.csv", row.names = FALSE, na="")




#
#Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.
info <-
  data %>% group_by(ranking) %>% 
  summarise(IQR=IQR(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.), Mean=mean(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.), Median=median(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.), Q1=quantile (Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data., probs=0.25), Q3=quantile(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data., probs=0.75))

lowerExtreme <- info$Q1 - 1.5 * info$IQR
upperExtreme <- info$Q3 + 1.5 * info$IQR
info <- cbind(info, lowerExtreme, upperExtreme)
rm(lowerExtreme, upperExtreme)

#slope first Argument: vector values of independent variable, usually time. Second argument: vector values of dependent variable, usually concentration
meanSlope <- lm(info$Mean ~ info$ranking)$coeff[2]
medianSlope <- lm(info$Median ~ info$ranking)$coeff[2]

meanSlope
medianSlope
info

write.csv(info, file = "BaiduSentimentAnalysisBaseOnGoogleTranslatedDataInfo.csv", row.names = FALSE, na="")

#ranking 10
lowerExtreme <- data %>% select(ranking, Chinese.origin.data, Google.translated.data, Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.) %>%
  filter(ranking == "10")%>%
  filter(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data. < info$lowerExtreme[1])
write.csv(lowerExtreme, file = "BaiduSentimentAnalysisBaseOnGoogleTranslatedDataLowerExtremeOutlinerOnRanking10.csv", row.names = FALSE, na="")

upperExtreme <- data %>% select(ranking, Chinese.origin.data, Google.translated.data, Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.) %>%
  filter(ranking == "10")%>%
  filter(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data. > info$upperExtreme[1])
write.csv(upperExtreme, file = "BaiduSentimentAnalysisBaseOnGoogleTranslatedDataUpperExtremeOutlinerOnRanking10.csv", row.names = FALSE, na="")

#ranking 20
lowerExtreme <- data %>% select(ranking, Chinese.origin.data, Google.translated.data, Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.) %>%
  filter(ranking == "20")%>%
  filter(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data. < info$lowerExtreme[2])
write.csv(lowerExtreme, file = "BaiduSentimentAnalysisBaseOnGoogleTranslatedDataLowerExtremeOutlinerOnRanking20.csv", row.names = FALSE, na="")

upperExtreme <- data %>% select(ranking, Chinese.origin.data, Google.translated.data, Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.) %>%
  filter(ranking == "20")%>%
  filter(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data. > info$upperExtreme[2])
write.csv(upperExtreme, file = "BaiduSentimentAnalysisBaseOnGoogleTranslatedDataUpperExtremeOutlinerOnRanking20.csv", row.names = FALSE, na="")

#ranking 30
lowerExtreme <- data %>% select(ranking, Chinese.origin.data, Google.translated.data, Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.) %>%
  filter(ranking == "30")%>%
  filter(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data. < info$lowerExtreme[3])
write.csv(lowerExtreme, file = "BaiduSentimentAnalysisBaseOnGoogleTranslatedDataLowerExtremeOutlinerOnRanking30.csv", row.names = FALSE, na="")

upperExtreme <- data %>% select(ranking, Chinese.origin.data, Google.translated.data, Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.) %>%
  filter(ranking == "30")%>%
  filter(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data. > info$upperExtreme[3])
write.csv(upperExtreme, file = "BaiduSentimentAnalysisBaseOnGoogleTranslatedDataUpperExtremeOutlinerOnRanking30.csv", row.names = FALSE, na="")

#ranking 40
lowerExtreme <- data %>% select(ranking, Chinese.origin.data, Google.translated.data, Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.) %>%
  filter(ranking == "40")%>%
  filter(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data. < info$lowerExtreme[4])
write.csv(lowerExtreme, file = "BaiduSentimentAnalysisBaseOnGoogleTranslatedDataLowerExtremeOutlinerOnRanking40.csv", row.names = FALSE, na="")

upperExtreme <- data %>% select(ranking, Chinese.origin.data, Google.translated.data, Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.) %>%
  filter(ranking == "40")%>%
  filter(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data. > info$upperExtreme[4])
write.csv(upperExtreme, file = "BaiduSentimentAnalysisBaseOnGoogleTranslatedDataUpperExtremeOutlinerOnRanking40.csv", row.names = FALSE, na="")

#ranking 50
lowerExtreme <- data %>% select(ranking, Chinese.origin.data, Google.translated.data, Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.) %>%
  filter(ranking == "50")%>%
  filter(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data. < info$lowerExtreme[5])
write.csv(lowerExtreme, file = "BaiduSentimentAnalysisBaseOnGoogleTranslatedDataLowerExtremeOutlinerOnRanking50.csv", row.names = FALSE, na="")

upperExtreme <- data %>% select(ranking, Chinese.origin.data, Google.translated.data, Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.) %>%
  filter(ranking == "50")%>%
  filter(Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data. > info$upperExtreme[5])
write.csv(upperExtreme, file = "BaiduSentimentAnalysisBaseOnGoogleTranslatedDataUpperExtremeOutlinerOnRanking50.csv", row.names = FALSE, na="")

#Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.
info <-
  data %>% group_by(ranking) %>% 
  summarise(IQR=IQR(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.), Mean=mean(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.), Median=median(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.), Q1=quantile (Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data., probs=0.25), Q3=quantile(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data., probs=0.75))

lowerExtreme <- info$Q1 - 1.5 * info$IQR
upperExtreme <- info$Q3 + 1.5 * info$IQR
info <- cbind(info, lowerExtreme, upperExtreme)
rm(lowerExtreme, upperExtreme)

#slope first Argument: vector values of independent variable, usually time. Second argument: vector values of dependent variable, usually concentration
meanSlope <- lm(info$Mean ~ info$ranking)$coeff[2]
medianSlope <- lm(info$Median ~ info$ranking)$coeff[2]

meanSlope
medianSlope
info

write.csv(info, file = "BaiduSentimentAnalysisBaseOnYandexTranslatedDataInfo.csv", row.names = FALSE, na="")

#ranking 10
lowerExtreme <- data %>% select(ranking, Chinese.origin.data, Yandex.translated.data, Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.) %>%
  filter(ranking == "10")%>%
  filter(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data. < info$lowerExtreme[1])
write.csv(lowerExtreme, file = "BaiduSentimentAnalysisBaseOnYandexTranslatedDataLowerExtremeOutlinerOnRanking10.csv", row.names = FALSE, na="")

upperExtreme <- data %>% select(ranking, Chinese.origin.data, Yandex.translated.data, Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.) %>%
  filter(ranking == "10")%>%
  filter(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data. > info$upperExtreme[1])
write.csv(upperExtreme, file = "BaiduSentimentAnalysisBaseOnYandexTranslatedDataUpperExtremeOutlinerOnRanking10.csv", row.names = FALSE, na="")

#ranking 20
lowerExtreme <- data %>% select(ranking, Chinese.origin.data, Yandex.translated.data, Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.) %>%
  filter(ranking == "20")%>%
  filter(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data. < info$lowerExtreme[2])
write.csv(lowerExtreme, file = "BaiduSentimentAnalysisBaseOnYandexTranslatedDataLowerExtremeOutlinerOnRanking20.csv", row.names = FALSE, na="")

upperExtreme <- data %>% select(ranking, Chinese.origin.data, Yandex.translated.data, Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.) %>%
  filter(ranking == "20")%>%
  filter(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data. > info$upperExtreme[2])
write.csv(upperExtreme, file = "BaiduSentimentAnalysisBaseOnYandexTranslatedDataUpperExtremeOutlinerOnRanking20.csv", row.names = FALSE, na="")

#ranking 30
lowerExtreme <- data %>% select(ranking, Chinese.origin.data, Yandex.translated.data, Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.) %>%
  filter(ranking == "30")%>%
  filter(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data. < info$lowerExtreme[3])
write.csv(lowerExtreme, file = "BaiduSentimentAnalysisBaseOnYandexTranslatedDataLowerExtremeOutlinerOnRanking30.csv", row.names = FALSE, na="")

upperExtreme <- data %>% select(ranking, Chinese.origin.data, Yandex.translated.data, Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.) %>%
  filter(ranking == "30")%>%
  filter(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data. > info$upperExtreme[3])
write.csv(upperExtreme, file = "BaiduSentimentAnalysisBaseOnYandexTranslatedDataUpperExtremeOutlinerOnRanking30.csv", row.names = FALSE, na="")

#ranking 40
lowerExtreme <- data %>% select(ranking, Chinese.origin.data, Yandex.translated.data, Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.) %>%
  filter(ranking == "40")%>%
  filter(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data. < info$lowerExtreme[4])
write.csv(lowerExtreme, file = "BaiduSentimentAnalysisBaseOnYandexTranslatedDataLowerExtremeOutlinerOnRanking40.csv", row.names = FALSE, na="")

upperExtreme <- data %>% select(ranking, Chinese.origin.data, Yandex.translated.data, Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.) %>%
  filter(ranking == "40")%>%
  filter(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data. > info$upperExtreme[4])
write.csv(upperExtreme, file = "BaiduSentimentAnalysisBaseOnYandexTranslatedDataUpperExtremeOutlinerOnRanking40.csv", row.names = FALSE, na="")

#ranking 50
lowerExtreme <- data %>% select(ranking, Chinese.origin.data, Yandex.translated.data, Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.) %>%
  filter(ranking == "50")%>%
  filter(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data. < info$lowerExtreme[5])
write.csv(lowerExtreme, file = "BaiduSentimentAnalysisBaseOnYandexTranslatedDataLowerExtremeOutlinerOnRanking50.csv", row.names = FALSE, na="")

upperExtreme <- data %>% select(ranking, Chinese.origin.data, Yandex.translated.data, Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.) %>%
  filter(ranking == "50")%>%
  filter(Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data. > info$upperExtreme[5])
write.csv(upperExtreme, file = "BaiduSentimentAnalysisBaseOnYandexTranslatedDataUpperExtremeOutlinerOnRanking50.csv", row.names = FALSE, na="")

#Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data.
info <-
  data %>% group_by(ranking) %>% 
  summarise(IQR=IQR(Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data.), Mean=mean(Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data.), Median=median(Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data.), Q1=quantile (Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data., probs=0.25), Q3=quantile(Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data., probs=0.75))

lowerExtreme <- info$Q1 - 1.5 * info$IQR
upperExtreme <- info$Q3 + 1.5 * info$IQR
info <- cbind(info, lowerExtreme, upperExtreme)
rm(lowerExtreme, upperExtreme)

#slope first Argument: vector values of independent variable, usually time. Second argument: vector values of dependent variable, usually concentration
meanSlope <- lm(info$Mean ~ info$ranking)$coeff[2]
medianSlope <- lm(info$Median ~ info$ranking)$coeff[2]

meanSlope
medianSlope
info

write.csv(info, file = "BaiduSentimentAnalysisBaseOnBaiduTranslatedDataInfo.csv", row.names = FALSE, na="")

#ranking 10
lowerExtreme <- data %>% select(ranking, Chinese.origin.data, Baidu.translated.data, Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data.) %>%
  filter(ranking == "10")%>%
  filter(Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data. < info$lowerExtreme[1])
write.csv(lowerExtreme, file = "BaiduSentimentAnalysisBaseOnBaiduTranslatedDataLowerExtremeOutlinerOnRanking10.csv", row.names = FALSE, na="")

upperExtreme <- data %>% select(ranking, Chinese.origin.data, Baidu.translated.data, Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data.) %>%
  filter(ranking == "10")%>%
  filter(Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data. > info$upperExtreme[1])
write.csv(upperExtreme, file = "BaiduSentimentAnalysisBaseOnBaiduTranslatedDataUpperExtremeOutlinerOnRanking10.csv", row.names = FALSE, na="")





































lowerExtreme$ranking <- NULL
colnames(upperExtreme$ranking) <- "newname2"
#rename col name
names(upperExtreme)[names(upperExtreme) == 'ranking'] <- 'newName'


test <- merge(lowerExtreme, upperExtreme, all=TRUE)



write.csv(BaiduSentimentAnalysisBaseOnGoogleTranslatedData, file = "BaiduSentimentAnalysisBaseOnGoogleTranslatedDataOutliner.csv", row.names = FALSE, na="")
rm(BaiduSentimentAnalysisBaseOnGoogleTranslatedData)























ranking <- c(10, 20, 10, 10)
data <- c("a", "b", "c", "d")
num <- c(1, 2, 3, 4)

test <- cbind(ranking, data, num)
test

test$ranking <- as.numeric(test$ranking)
test$num <- as.numeric(test$num)

filter(data, ranking == 10, Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data. > 0)



hi <- data %>% select(ranking, Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.) %>%
  filter(ranking == "10")%>%
  filter(Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data. < 0.5)
hi


IQRAndQuantile <- function(data)
{
  value = a
  largeVals = b
  list(stat=value,number=largeVals)
}







good <-
  d %>% group_by(A) %>% 
  summarise(IQR=IQR(B), M=mean(B), Med=median(B), Q1=quantile (B, probs=0.25), Q2=quantile (B, probs=0.50), Q3=quantile(B, probs=0.75))
grouped_df(data = data, data$ranking, drop = TRUE)



require(dplyr)    
df <- data.frame(A = c(1, 1, 2, 3, 3), B = c(2, 3, 3, 5, 6))
df %>% group_by(A) %>% summarise(B = sum(B))
summarise(df, B = sum(B))

sample <- function(a,b)
{
  value = a
  largeVals = b
  list(stat=value,number=largeVals)
}
hi <- sample(200,-10)
hi$stat

out <- data.frame()
df <- data.frame(A = c(1, 1, 2, 3, 3), B = c(2, 3, 3, 5, 6))
df %>%
  group_by(A) %>%
  summarise(quantile = quantile(B)) 

d <- data.frame(A = c(1, 1, 2, 3, 3), B = c(2, 3, 3, 5, 6))

good <-
d %>% group_by(A) %>% 
  summarise(IQR=IQR(B), M=mean(B), Med=median(B), Q1=quantile (B, probs=0.25), Q2=quantile (B, probs=0.50), Q3=quantile(B, probs=0.75))



test<-
  d %>% group_by(A) %>%
  summarise_each (funs(getQuantile) , mean_mpg = B)



quantile (d$B)

summarise(df)
getQuantile <- function(data)
{
  quantileTable <- quantile(test)
  Q1 <- quantileTable[["25%"]]
  Q2 <- quantileTable[["50%"]]
  Q3 <- quantileTable[["75%"]]
  IQR <- Q3 - Q1
  lowerExtreme <- Q1 - 1.5 * IQR
  upperExtreme <- Q3 + 1.5 * IQR
  
  v = c(Q1, Q2, Q3, IQR, lowerExtreme, upperExtreme) 
  names(v) = c("Q1", "Q2", "Q3", "IQR", "lowerExtreme", "upperExtreme")
  Q1
  #list(Q1=Q1, Q2=Q2, Q3=Q3, IQR, lowerExtreme, upperExtreme)
}
data$ranking <- as.numeric(data$ranking)
data$ranking <- toString(data$ranking)
test <- aggregate(Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data. ~ ranking, data = data, getQuantile)



test <- data$Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data. %>% group_by(data$ranking) %>% getQuantile()
test










(x <- c(sort(sample(1:20, 9)), NA))
(y <- c(sort(sample(3:23, 7)), NA))

intersect(x, y)
setdiff(x, y)
setdiff(y, x)

(test <- c(-9999, 1, 2,3,5))


summary(test)[["1st Qu."]]

summary(test)[["3rd Qu."]]

median(test)

#There are several quartiles of an observation variable. The first quartile, or lower quartile, is the value that cuts off the first 25% of the data when it is sorted in ascending order. The second quartile, or median, is the value that cuts off the first 50%. The third quartile, or upper quartile, is the value that cuts off the first 75%.

#Calculate first quartile (Q1), third quartile (Q3) and the interquartile range (IQR=Q3-Q1). 
#Compute Q1–1.5 × IQR and Compute Q3+1.5 × IQR Anything outside this range is an outlier.