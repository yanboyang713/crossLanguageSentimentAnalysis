library(magrittr)
library(dplyr)
library(rtf)
library(NonCompart)
library(ncar)
install.packages('VennDiagram')
library(VennDiagram)


data <- read.csv(file="goodDataLatest.csv",head=TRUE,sep=",")
data$ID <- seq.int(nrow(data))

#Google sentiment analysis(Google translation)
googleSentimentAnalysisGoogleTranslation <- data %>% select(ID, Chinese.origin.data, Google.translated.data, Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data., Google.English.sentiment.analysis.score.base.on.Google.translated.data.) %>%
  filter( ((Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. > 0.5) & (Google.English.sentiment.analysis.score.base.on.Google.translated.data. < -0.5)) | ((Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. < -0.5) & (Google.English.sentiment.analysis.score.base.on.Google.translated.data. > 0.5)) )


#Google sentiment analysis(Baidu translation)
googleSentimentAnalysisBaiduTranslation <- data %>% select(ID, Chinese.origin.data, Baidu.translated.data, Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data., Google.English.sentiment.analysis.score.base.on.Baidu.translated.data.) %>%
  filter( ((Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. > 0.5) & (Google.English.sentiment.analysis.score.base.on.Baidu.translated.data. < -0.5)) | ((Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. < -0.5) & (Google.English.sentiment.analysis.score.base.on.Baidu.translated.data. > 0.5)) )


#Google sentiment analysis(Yandex translation)
googleSentimentAnalysisYandexTranslation <- data %>% select(ID, Chinese.origin.data, Yandex.translated.data, Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data., Google.English.sentiment.analysis.score.base.on.Yandex.translated.data.) %>%
  filter( ((Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. > 0.5) & (Google.English.sentiment.analysis.score.base.on.Yandex.translated.data. < -0.5)) | ((Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. < -0.5) & (Google.English.sentiment.analysis.score.base.on.Yandex.translated.data. > 0.5)) )

a <- c(1,3,5,7,9)
nrow(googleSentimentAnalysisGoogleTranslation)
googleSentimentAnalysisGoogleTranslation
googleSentimentAnalysisBaiduTranslation
googleSentimentAnalysisYandexTranslation

intersect(intersect(googleSentimentAnalysisGoogleTranslation$ID,googleSentimentAnalysisBaiduTranslation$ID),googleSentimentAnalysisYandexTranslation$ID)
b <- c(3,6,8,9,10)
c <- c(2,3,4,5,7,9)
intersect(intersect(a,b),c)
length(a)
length(intersect(intersect(googleSentimentAnalysisGoogleTranslation$ID, googleSentimentAnalysisBaiduTranslation$ID), googleSentimentAnalysisYandexTranslation$ID))



grid.newpage()
draw.triple.venn(area1 = nrow(googleSentimentAnalysisGoogleTranslation), area2 = nrow(googleSentimentAnalysisBaiduTranslation), area3 = nrow(googleSentimentAnalysisYandexTranslation), n12 = length(intersect(googleSentimentAnalysisGoogleTranslation$ID, googleSentimentAnalysisBaiduTranslation$ID)), n23 = length(intersect(googleSentimentAnalysisBaiduTranslation$ID, googleSentimentAnalysisYandexTranslation$ID)), n13 = length(intersect(googleSentimentAnalysisGoogleTranslation$ID, googleSentimentAnalysisYandexTranslation$ID)), 
                 n123 = length(intersect(intersect(googleSentimentAnalysisGoogleTranslation$ID, googleSentimentAnalysisBaiduTranslation$ID), googleSentimentAnalysisYandexTranslation$ID)), category = c("Google Translation", "Baidu Translation", "Yandex Translation"), lty = "blank", 
                 fill = c("skyblue", "pink1", "mediumorchid"))















grid.newpage()
draw.triple.venn(area1 = 22, area2 = 20, area3 = 13, n12 = 11, n23 = 4, n13 = 5, 
                 n123 = 1, category = c("Dog People", "Cat People", "Lizard People"), lty = "blank", 
                 fill = c("skyblue", "pink1", "mediumorchid"))















source("https://bioconductor.org/biocLite.R")
class(biocLite)
biocLite("limma")
library(limma)
venndata <- cbind(googleSentimentAnalysisGoogleTranslation$ID, googleSentimentAnalysisBaiduTranslation$ID, googleSentimentAnalysisYandexTranslation$ID)
count <- vennCounts(venndata)
count
vennDiagram(count)




hsb2 <- read.csv("https://stats.idre.ucla.edu/wp-content/uploads/2016/02/hsb2-3.csv") 
attach(hsb2)
hw <- (write >= 60)
hm <- (math >= 60)
hr <- (read >= 60)
c3 <- cbind(hw, hm, hr)
a <- vennCounts(c3)
vennDiagram(a)























#Google Sentiment(Google Translated data)
selectData <- data %>% select(Chinese.origin.data, Google.translated.data, Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data., Google.English.sentiment.analysis.score.base.on.Google.translated.data.) %>%
  filter( (Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. > 0) & (Google.English.sentiment.analysis.score.base.on.Google.translated.data. < 0) | (Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. < 0) & (Google.English.sentiment.analysis.score.base.on.Google.translated.data. > 0) )
write.csv(selectData, file = "GoogleSentiment(GoogleTranslatedData)Opposite.csv", row.names = FALSE, na="")



selectData <- data %>% select(Chinese.origin.data, Google.translated.data, Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data., Google.English.sentiment.analysis.score.base.on.Google.translated.data.) %>%
  filter( (Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. > 0.25) & (Google.English.sentiment.analysis.score.base.on.Google.translated.data. < -0.25) | (Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. < -0.25) & (Google.English.sentiment.analysis.score.base.on.Google.translated.data. > 0.25) )
write.csv(selectData, file = "GoogleSentiment(GoogleTranslatedData)OppositePointTwo.csv", row.names = FALSE, na="")





selectData <- data %>% select(Chinese.origin.data, Google.translated.data, Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data., Google.English.sentiment.analysis.score.base.on.Google.translated.data.) %>%
  filter( (Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. > 0.5) & (Google.English.sentiment.analysis.score.base.on.Google.translated.data. < -0.5) | (Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. < -0.5) & (Google.English.sentiment.analysis.score.base.on.Google.translated.data. > 0.5) )
write.csv(selectData, file = "GoogleSentiment(GoogleTranslatedData)OppositePointfive.csv", row.names = FALSE, na="")



selectData <- data %>% select(Chinese.origin.data, Google.translated.data, Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data., Google.English.sentiment.analysis.score.base.on.Google.translated.data.) %>%
  filter( (Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. > 0.75) & (Google.English.sentiment.analysis.score.base.on.Google.translated.data. < -0.75) | (Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. < -0.75) & (Google.English.sentiment.analysis.score.base.on.Google.translated.data. > 0.75) )
write.csv(selectData, file = "GoogleSentiment(GoogleTranslatedData)OppositePointSeven.csv", row.names = FALSE, na="")