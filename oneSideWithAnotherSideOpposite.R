library(magrittr)
library(dplyr)
library(rtf)
library(NonCompart)
library(ncar)
data <- read.csv(file="goodDataLatest.csv",head=TRUE,sep=",")


#Google Sentiment(Google Translated data)
selectData <- data %>% select(Chinese.origin.data, Google.translated.data, Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data., Google.English.sentiment.analysis.score.base.on.Google.translated.data.) %>%
  filter(ranking == "10")%>%
  filter(Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data. < info$lowerExtreme[1] | Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data. > info$upperExtreme[1])
