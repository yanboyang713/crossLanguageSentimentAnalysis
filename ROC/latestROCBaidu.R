install.packages("pROC") #下载pROC包

install.packages("ggplot2") #下载ggplot2包

library(pROC) #调用pROC包

library(ggplot2) #调用ggplot2包以利用ggroc函数


library(precrec)
library(knitr)
data <- read.csv(file="goodDataLatest.csv",head=TRUE,sep=",")

ref <- seq(0.1, 0.9, 1 / 5 )
range <- 0.2097
dataCopy <- data$Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.
trueCount <- 0
falseCount <- 0

for (index in c(1:length(dataCopy))){
  if (data$ranking[index] == 10){
    if (dataCopy[index] <= ref[1] + range && dataCopy[index] >= ref[1] - range){
      trueCount <- trueCount + 1
      dataCopy[index] <- #TRUE
    }else{
      falseCount <- falseCount + 1
      dataCopy[index] <- #FALSE
    }
  }else if(data$ranking[index] == 20){
    if (dataCopy[index] <= ref[2] + range && dataCopy[index] >= ref[2] - range){
      trueCount <- trueCount + 1
      dataCopy[index] <- #TRUE
    }else{
      falseCount <- falseCount + 1
      dataCopy[index] <- #FALSE
    }
  }else if(data$ranking[index] == 30){
    if (dataCopy[index] <= ref[3] + range && dataCopy[index] >= ref[3] - range){
      trueCount <- trueCount + 1
      dataCopy[index] <- #TRUE
    }else{
      falseCount <- falseCount + 1
      dataCopy[index] <- #FALSE
    }
  }else if(data$ranking[index] == 40){
    if (dataCopy[index] <= ref[4] + range && dataCopy[index] >= ref[4] - range){
      trueCount <- trueCount + 1
      dataCopy[index] <- #TRUE
    }else{
      falseCount <- falseCount + 1
      dataCopy[index] <- #FALSE
    }
  }else if(data$ranking[index] == 50){
    if (dataCopy[index] <= ref[5] + range && dataCopy[index] >= ref[5] - range){
      trueCount <- trueCount + 1
      dataCopy[index] <- #TRUE
    }else{
      falseCount <- falseCount + 1
      dataCopy[index] <- #FALSE
    }
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



































trueV <- c()
falseV <- c()
trueC <- 1
falseC <- 1
for (index in c(1:length(dataCopy))){
  if (dataCopy[index] == TRUE){
    print ("TRUE")
    trueV[trueC] <- data$Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.[index]
    trueC <- trueC + 1
  }else{
    print ("FALSE")
    falseV[falseC] <- data$Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.[index]
    falseC <- falseC + 1
  }
}
trueV
hist(trueV)
hist(falseV)

#roc
rocobj1 <- roc(dataCopy, data$Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.)
plot(rocobj1)


plot(rocobj1, print.auc=TRUE, auc.polygon=TRUE, grid=c(0.1, 0.2), grid.col=c("green", "red"), max.auc.polygon=TRUE, auc.polygon.col="skyblue", print.thres=TRUE)

rocobj2 <- roc(dataCopy, data$Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data.)
plot(rocobj2, print.auc=TRUE, auc.polygon=TRUE, grid=c(0.1, 0.2), grid.col=c("green", "red"), max.auc.polygon=TRUE, auc.polygon.col="skyblue", print.thres=TRUE)

rocobj3 <- roc(dataCopy, data$Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.)
plot(rocobj3, print.auc=TRUE, auc.polygon=TRUE, grid=c(0.1, 0.2), grid.col=c("green", "red"), max.auc.polygon=TRUE, auc.polygon.col="skyblue", print.thres=TRUE)


g3 <- ggroc(list(Google=rocobj1, Baidu=rocobj2, Yandex= rocobj3))

g3



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
