
library(precrec)
library(knitr)

data <- read.csv(file="goodDataLatest.csv",head=TRUE,sep=",")

ref <- seq(-1, 1, 2 / 5 )
shif <- 0.2
dataCopy <- data$Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data.
trueCount <- 0
falseCount <- 0

for (index in c(1:length(dataCopy) ) )
{
  if (data$ranking[index] == 10){
    if (dataCopy[index] >= ref[1] - shif && dataCopy[index] <= ref[2] + shif){
      dataCopy[index] <- FALSE#TRUE
      trueCount <- trueCount + 1
    }
    else{
      dataCopy[index] <- TRUE#FALSE
      falseCount <- falseCount + 1
    }
  }else if (data$ranking[index] == 20){
    if (dataCopy[index] >= ref[2] - shif && dataCopy[index] <= ref[3] + shif){
      dataCopy[index] <- FALSE#TRUE
      trueCount <- trueCount + 1
    }
    else{
      dataCopy[index] <- TRUE#FALSE
      falseCount <- falseCount + 1
    }
  }
  else if (data$ranking[index] == 30){
    if (dataCopy[index] >= ref[3] - shif && dataCopy[index] <= ref[4] + shif){
      dataCopy[index] <- FALSE#TRUE
      trueCount <- trueCount + 1
    }
    else{
      dataCopy[index] <- TRUE#FALSE
      falseCount <- falseCount + 1
    }
  }
  else if (data$ranking[index] == 40){
    if (dataCopy[index] >= ref[4] - shif && dataCopy[index] <= ref[5] + shif){
      dataCopy[index] <- FALSE#TRUE
      trueCount <- trueCount + 1
    }
    else{
      dataCopy[index] <- TRUE#FALSE
      falseCount <- falseCount + 1530
    }
  }
  else if (data$ranking[index] == 50){
    if (dataCopy[index] >= ref[5] - shif && dataCopy[index] <= ref[6] + shif){
      dataCopy[index] <- FALSE#TRUE
      trueCount <- trueCount + 1
    }
    else{
      dataCopy[index] <- TRUE#FALSE
      falseCount <- falseCount + 1
    }
  }
}

trueCount
falseCount

#ref
#dataCopy







Google <- data$Google.English.sentiment.analysis.score.base.on.Google.translated.data.
Yandex <- data$Google.English.sentiment.analysis.score.base.on.Yandex.translated.data.
Baidu <- data$Google.English.sentiment.analysis.score.base.on.Baidu.translated.data.
#typeof(Google)


scores <- join_scores(Google, Yandex, Baidu)
#scores

GoogleLabels <- dataCopy
YandexLabels <- dataCopy
BaiduLabels <- dataCopy

labels <- join_labels(GoogleLabels, YandexLabels, BaiduLabels)
#labels

msmdat <- mmdata(scores, labels, modnames = c("Google Translation", "Yandex Translation", "Baidu Translation"))
mscurves <- evalmod(msmdat)
autoplot(mscurves)
title(main = "Using Google Sentiment Analysis")

sscurves <- evalmod(scores = Google, labels = dataCopy)
aucs <- auc(sscurves)
knitr::kable(aucs)

sscurves <- evalmod(scores = Yandex, labels = dataCopy)
aucs <- auc(sscurves)
knitr::kable(aucs)

sscurves <- evalmod(scores = Baidu, labels = dataCopy)
aucs <- auc(sscurves)
knitr::kable(aucs)

