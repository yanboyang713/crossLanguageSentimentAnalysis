install.packages("precrec")
install.packages("knitr")

library(precrec)
library(knitr)

data <- read.csv(file="goodDataLatest.csv",head=TRUE,sep=",")

ref <- seq(0, 1, 1 / 5 )

dataCopy <- data$Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.
trueCount <- 0
falseCount <- 0


f <- function(ranking, index){
  if (ranking == data$ranking[index]){
    dataCopy[index] <<- FALSE#TRUE
    trueCount <<- trueCount + 1
  } else{
    dataCopy[index] <<- TRUE#FALSE
    falseCount <<- falseCount + 1
  }
}

for (x in c(1:length(dataCopy))){
  
  if (dataCopy[x] >= ref[1] && dataCopy[x] < ref[2]){
    f(10, x)
  } else if (dataCopy[x] >= ref[2] && dataCopy[x] < ref[3]) {
    f(20, x)
  } else if ( dataCopy[x] >= ref[3] && dataCopy[x] < ref[4]) {
    f(30, x)
  } else if ( dataCopy[x] >= ref[4] && dataCopy[x] < ref[5]) {
    f(40, x)
  } else if ( dataCopy[x] >= ref[5] && dataCopy[x] <= ref[6]) {
    f(50, x)
  }
}


trueCount
falseCount

ref
dataCopy


#############################################################################################

Google <- data$Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.
Yandex <- data$Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.
Baidu <- data$Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data.
scores <- join_scores(Google, Yandex, Baidu)
scores

GoogleLabels <- dataCopy
YandexLabels <- dataCopy
BaiduLabels <- dataCopy

labels <- join_labels(GoogleLabels, YandexLabels, BaiduLabels)
labels

msmdat <- mmdata(scores, labels, modnames = c("Google Translation", "Yandex Translation", "Baidu Translation"))
mscurves <- evalmod(msmdat)
autoplot(mscurves)
title(main = "Using Baidu Sentiment Analysis")

##############################################################################################################


























sscurves <- evalmod(scores = data$Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data., labels = dataCopy)
autoplot(sscurves)
aucs <- auc(sscurves)
knitr::kable(aucs)

sscurves <- evalmod(scores = data$Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data., labels = dataCopy)
autoplot(sscurves)
aucs <- auc(sscurves)
knitr::kable(aucs)

sscurves <- evalmod(scores = data$Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data., labels = dataCopy)
autoplot(sscurves)
aucs <- auc(sscurves)
knitr::kable(aucs)




rocobj1 <- roc(dataCopy, data$Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.)
plot(rocobj1, print.auc=TRUE, auc.polygon=TRUE, grid=c(0.1, 0.2), grid.col=c("green", "red"), max.auc.polygon=TRUE, auc.polygon.col="skyblue", print.thres=TRUE)

rocobj2 <- roc(dataCopy, data$Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data.)
plot(rocobj2, print.auc=TRUE, auc.polygon=TRUE, grid=c(0.1, 0.2), grid.col=c("green", "red"), max.auc.polygon=TRUE, auc.polygon.col="skyblue", print.thres=TRUE)

rocobj3 <- roc(dataCopy, data$Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.)
plot(rocobj3, print.auc=TRUE, auc.polygon=TRUE, grid=c(0.1, 0.2), grid.col=c("green", "red"), max.auc.polygon=TRUE, auc.polygon.col="skyblue", print.thres=TRUE)


g3 <- ggroc(list(Google=rocobj1, Baidu=rocobj2, Yandex= rocobj3))

g3
