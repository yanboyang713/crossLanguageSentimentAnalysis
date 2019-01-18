install.packages('VennDiagram')
install.packages('dplyr')
install.packages('rtf')
install.packages('NonCompart')
install.packages('ncar')
install.packages('gsubfn')
library(gsubfn)#multi-argument returns
library(magrittr)
library(dplyr)

library(rtf)
library(NonCompart)
library(ncar)

library(VennDiagram)


data <- read.csv(file="goodDataLatest.csv",head=TRUE,sep=",")
data$ID <- seq.int(nrow(data))

ran = c(0.7, -0.7)

#Google sentiment analysis(Google translation)
googleSentimentAnalysisGoogleTranslation <- data %>% select(ID, Chinese.origin.data, Google.translated.data, Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data., Google.English.sentiment.analysis.score.base.on.Google.translated.data.) %>%
  filter( ((Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. > ran[1]) & (Google.English.sentiment.analysis.score.base.on.Google.translated.data. < ran[2])) | ((Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. < ran[2]) & (Google.English.sentiment.analysis.score.base.on.Google.translated.data. > ran[1])) )


#Google sentiment analysis(Baidu translation)
googleSentimentAnalysisBaiduTranslation <- data %>% select(ID, Chinese.origin.data, Baidu.translated.data, Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data., Google.English.sentiment.analysis.score.base.on.Baidu.translated.data.) %>%
  filter( ((Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. > ran[1]) & (Google.English.sentiment.analysis.score.base.on.Baidu.translated.data. < ran[2])) | ((Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. < ran[2]) & (Google.English.sentiment.analysis.score.base.on.Baidu.translated.data. > ran[1])) )


#Google sentiment analysis(Yandex translation)
googleSentimentAnalysisYandexTranslation <- data %>% select(ID, Chinese.origin.data, Yandex.translated.data, Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data., Google.English.sentiment.analysis.score.base.on.Yandex.translated.data.) %>%
  filter( ((Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. > ran[1]) & (Google.English.sentiment.analysis.score.base.on.Yandex.translated.data. < ran[2])) | ((Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data. < ran[2]) & (Google.English.sentiment.analysis.score.base.on.Yandex.translated.data. > ran[1])) )



grid.newpage()
draw.triple.venn(area1 = nrow(googleSentimentAnalysisGoogleTranslation), area2 = nrow(googleSentimentAnalysisBaiduTranslation), area3 = nrow(googleSentimentAnalysisYandexTranslation), n12 = length(intersect(googleSentimentAnalysisGoogleTranslation$ID, googleSentimentAnalysisBaiduTranslation$ID)), n23 = length(intersect(googleSentimentAnalysisBaiduTranslation$ID, googleSentimentAnalysisYandexTranslation$ID)), n13 = length(intersect(googleSentimentAnalysisGoogleTranslation$ID, googleSentimentAnalysisYandexTranslation$ID)), 
                 n123 = length(intersect(intersect(googleSentimentAnalysisGoogleTranslation$ID, googleSentimentAnalysisBaiduTranslation$ID), googleSentimentAnalysisYandexTranslation$ID)), category = c("Google Translation", "Baidu Translation", "Yandex Translation"), lty = "blank", 
                 fill = c("skyblue", "pink1", "mediumorchid"))


#######################################################################
#area70
tmp <- setdiff(googleSentimentAnalysisGoogleTranslation$ID, googleSentimentAnalysisBaiduTranslation$ID)
tmp <- setdiff(tmp, googleSentimentAnalysisYandexTranslation$ID)
area70ID <- tmp
#area17
area17ID <- intersect(intersect(googleSentimentAnalysisGoogleTranslation$ID, googleSentimentAnalysisBaiduTranslation$ID), googleSentimentAnalysisYandexTranslation$ID)
#area21
tmp <- intersect(googleSentimentAnalysisGoogleTranslation$ID, googleSentimentAnalysisBaiduTranslation$ID)
area21ID <- setdiff(tmp, area17ID)
#area76
tmp <- setdiff(googleSentimentAnalysisBaiduTranslation$ID, googleSentimentAnalysisGoogleTranslation$ID)
tmp <- setdiff(tmp, googleSentimentAnalysisYandexTranslation$ID)
area76ID <- tmp
#area29
tmp <- intersect(googleSentimentAnalysisGoogleTranslation$ID, googleSentimentAnalysisYandexTranslation$ID)
area29ID <- setdiff(tmp, area17ID)
#area20
tmp <- intersect(googleSentimentAnalysisYandexTranslation$ID, googleSentimentAnalysisBaiduTranslation$ID)
area20ID <- setdiff(tmp, area17ID)
#area63
tmp <- setdiff(googleSentimentAnalysisYandexTranslation$ID, googleSentimentAnalysisBaiduTranslation$ID)
tmp <- setdiff(tmp, googleSentimentAnalysisGoogleTranslation$ID)
area63ID <- tmp
########################################################################
findMax <- function(one, two, three){
  if (one >= two && one >= three ){
    return(one)
  }
  else if(two >= one && two >= three){
    return (two)
  }
  else if (three >= one && three >= two){
    return (three)
  }
}
findRowNumUsingID <- function(dataFrame, ID){
  for (index in seq(1, length (dataFrame$ID))) {
    if (dataFrame$ID[index] == ID){
      return (index)
    }
  }
}
###################################################################################
sententChinese <- c()
sententGoogleTranslation <- c()
sententYandexTranslation <- c()
sententbaiduTranslation <- c()
area <- c()

#area70

for (index in seq(1, length(area70ID))) {
  chineseAlreadyDone <- FALSE
  GoogleRowNum <- findRowNumUsingID(googleSentimentAnalysisGoogleTranslation, area70ID[index])
  BaiduRowNum <- findRowNumUsingID(googleSentimentAnalysisBaiduTranslation, area70ID[index])
  YandexRowNum <- findRowNumUsingID(googleSentimentAnalysisYandexTranslation, area70ID[index])
  #google
  if (!is.null(GoogleRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententGoogleTranslation <- c(sententGoogleTranslation, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 3]))
  }
  else{
    sententGoogleTranslation <- c(sententGoogleTranslation, paste("NULL"))
  }
  #Baidu
  if (!is.null(BaiduRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententbaiduTranslation <- c(sententbaiduTranslation, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 3]))
  }
  else{
    sententbaiduTranslation <- c(sententbaiduTranslation, paste("NULL"))
  }
  #yandex
  if (!is.null(YandexRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententYandexTranslation <- c(sententYandexTranslation, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 3]))
  }
  else{
    sententYandexTranslation <- c(sententYandexTranslation, paste("NULL"))
  }
  area <- c(area, 70)
}


#area21
for (index in seq(1, length(area21ID))) {
  chineseAlreadyDone <- FALSE
  GoogleRowNum <- findRowNumUsingID(googleSentimentAnalysisGoogleTranslation, area21ID[index])
  BaiduRowNum <- findRowNumUsingID(googleSentimentAnalysisBaiduTranslation, area21ID[index])
  YandexRowNum <- findRowNumUsingID(googleSentimentAnalysisYandexTranslation, area21ID[index])
  #google
  if (!is.null(GoogleRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententGoogleTranslation <- c(sententGoogleTranslation, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 3]))
  }
  else{
    sententGoogleTranslation <- c(sententGoogleTranslation, paste("NULL"))
  }
  #Baidu
  if (!is.null(BaiduRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententbaiduTranslation <- c(sententbaiduTranslation, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 3]))
  }
  else{
    sententbaiduTranslation <- c(sententbaiduTranslation, paste("NULL"))
  }
  #yandex
  if (!is.null(YandexRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententYandexTranslation <- c(sententYandexTranslation, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 3]))
  }
  else{
    sententYandexTranslation <- c(sententYandexTranslation, paste("NULL"))
  }
  area <- c(area, 21)
}


#area76
for (index in seq(1, length(area76ID))) {
  chineseAlreadyDone <- FALSE
  GoogleRowNum <- findRowNumUsingID(googleSentimentAnalysisGoogleTranslation, area76ID[index])
  BaiduRowNum <- findRowNumUsingID(googleSentimentAnalysisBaiduTranslation, area76ID[index])
  YandexRowNum <- findRowNumUsingID(googleSentimentAnalysisYandexTranslation, area76ID[index])
  #google
  if (!is.null(GoogleRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententGoogleTranslation <- c(sententGoogleTranslation, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 3]))
  }
  else{
    sententGoogleTranslation <- c(sententGoogleTranslation, paste("NULL"))
  }
  #Baidu
  if (!is.null(BaiduRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententbaiduTranslation <- c(sententbaiduTranslation, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 3]))
  }
  else{
    sententbaiduTranslation <- c(sententbaiduTranslation, paste("NULL"))
  }
  #yandex
  if (!is.null(YandexRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententYandexTranslation <- c(sententYandexTranslation, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 3]))
  }
  else{
    sententYandexTranslation <- c(sententYandexTranslation, paste("NULL"))
  }
  area <- c(area, 76)
}
#area17
for (index in seq(1, length(area17ID))) {
  chineseAlreadyDone <- FALSE
  GoogleRowNum <- findRowNumUsingID(googleSentimentAnalysisGoogleTranslation, area17ID[index])
  BaiduRowNum <- findRowNumUsingID(googleSentimentAnalysisBaiduTranslation, area17ID[index])
  YandexRowNum <- findRowNumUsingID(googleSentimentAnalysisYandexTranslation, area17ID[index])
  #google
  if (!is.null(GoogleRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententGoogleTranslation <- c(sententGoogleTranslation, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 3]))
  }
  else{
    sententGoogleTranslation <- c(sententGoogleTranslation, paste("NULL"))
  }
  #Baidu
  if (!is.null(BaiduRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententbaiduTranslation <- c(sententbaiduTranslation, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 3]))
  }
  else{
    sententbaiduTranslation <- c(sententbaiduTranslation, paste("NULL"))
  }
  #yandex
  if (!is.null(YandexRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententYandexTranslation <- c(sententYandexTranslation, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 3]))
  }
  else{
    sententYandexTranslation <- c(sententYandexTranslation, paste("NULL"))
  }
  area <- c(area, 17)
}
#area29
for (index in seq(1, length(area29ID))) {
  chineseAlreadyDone <- FALSE
  GoogleRowNum <- findRowNumUsingID(googleSentimentAnalysisGoogleTranslation, area29ID[index])
  BaiduRowNum <- findRowNumUsingID(googleSentimentAnalysisBaiduTranslation, area29ID[index])
  YandexRowNum <- findRowNumUsingID(googleSentimentAnalysisYandexTranslation, area29ID[index])
  #google
  if (!is.null(GoogleRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententGoogleTranslation <- c(sententGoogleTranslation, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 3]))
  }
  else{
    sententGoogleTranslation <- c(sententGoogleTranslation, paste("NULL"))
  }
  #Baidu
  if (!is.null(BaiduRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententbaiduTranslation <- c(sententbaiduTranslation, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 3]))
  }
  else{
    sententbaiduTranslation <- c(sententbaiduTranslation, paste("NULL"))
  }
  #yandex
  if (!is.null(YandexRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententYandexTranslation <- c(sententYandexTranslation, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 3]))
  }
  else{
    sententYandexTranslation <- c(sententYandexTranslation, paste("NULL"))
  }
  area <- c(area, 29)
}
#area20
for (index in seq(1, length(area20ID))) {
  chineseAlreadyDone <- FALSE
  GoogleRowNum <- findRowNumUsingID(googleSentimentAnalysisGoogleTranslation, area20ID[index])
  BaiduRowNum <- findRowNumUsingID(googleSentimentAnalysisBaiduTranslation, area20ID[index])
  YandexRowNum <- findRowNumUsingID(googleSentimentAnalysisYandexTranslation, area20ID[index])
  #google
  if (!is.null(GoogleRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententGoogleTranslation <- c(sententGoogleTranslation, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 3]))
  }
  else{
    sententGoogleTranslation <- c(sententGoogleTranslation, paste("NULL"))
  }
  #Baidu
  if (!is.null(BaiduRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententbaiduTranslation <- c(sententbaiduTranslation, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 3]))
  }
  else{
    sententbaiduTranslation <- c(sententbaiduTranslation, paste("NULL"))
  }
  #yandex
  if (!is.null(YandexRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententYandexTranslation <- c(sententYandexTranslation, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 3]))
  }
  else{
    sententYandexTranslation <- c(sententYandexTranslation, paste("NULL"))
  }
  area <- c(area, 20)
}
#area63
for (index in seq(1, length(area63ID))) {
  chineseAlreadyDone <- FALSE
  GoogleRowNum <- findRowNumUsingID(googleSentimentAnalysisGoogleTranslation, area63ID[index])
  BaiduRowNum <- findRowNumUsingID(googleSentimentAnalysisBaiduTranslation, area63ID[index])
  YandexRowNum <- findRowNumUsingID(googleSentimentAnalysisYandexTranslation, area63ID[index])
  #google
  if (!is.null(GoogleRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententGoogleTranslation <- c(sententGoogleTranslation, paste(googleSentimentAnalysisGoogleTranslation[GoogleRowNum, 3]))
  }
  else{
    sententGoogleTranslation <- c(sententGoogleTranslation, paste("NULL"))
  }
  #Baidu
  if (!is.null(BaiduRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententbaiduTranslation <- c(sententbaiduTranslation, paste(googleSentimentAnalysisBaiduTranslation[BaiduRowNum, 3]))
  }
  else{
    sententbaiduTranslation <- c(sententbaiduTranslation, paste("NULL"))
  }
  #yandex
  if (!is.null(YandexRowNum)){
    if (chineseAlreadyDone == FALSE){
      sententChinese <- c(sententChinese, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 2]))
      chineseAlreadyDone <- TRUE
    }
    sententYandexTranslation <- c(sententYandexTranslation, paste(googleSentimentAnalysisYandexTranslation[YandexRowNum, 3]))
  }
  else{
    sententYandexTranslation <- c(sententYandexTranslation, paste("NULL"))
  }
  area <- c(area, 63)
}
#write to data frme
output <- data.frame(
  sententChinese = sententChinese, 
  sententGoogleTranslation = sententGoogleTranslation,
  sententYandexTranslation = sententYandexTranslation,
  sententbaiduTranslation = sententbaiduTranslation,
  areaCode = area
)
# Print the data frame.			
write.csv(output, file = "mistake.csv")

#############################################################################################



sententChinese
sententGoogleTranslation




#area70
while (googleIDIndex <= length(area70ID)) {
  for (index in googleSentimentAnalysisGoogleTranslation) {
    if (area70ID[googleIDIndex] == googleSentimentAnalysisGoogleTranslation$ID[index]){
      sententChinese <- c(sententChinese, googleSentimentAnalysisGoogleTranslation$Chinese.origin.data)
      sententGoogleTranslation <- c(sententGoogleTranslation, googleSentimentAnalysisGoogleTranslation$Google.translated.data)
      sententYandexTranslation <- c(sententYandexTranslation, NULL)
      sententbaiduTranslation <- c(sententbaiduTranslation, NULL)
      area <- c(area, 70)
    }
  }
  googleIDIndex <- googleIDIndex + 1
}



for (index in googleSentimentAnalysisGoogleTranslation) {
  
}


FindChineseAndEnglish <- function(ID, data){
  IDindex <- 1
  while (IDindex <= length(ID))
  {
    stop <- FALSE
    dataIndex <- 1
    while (stop == FALSE && dataIndex <= length(data)){
      if (data$ID[dataIndex] == ID[IDindex]){
        sententChinese <<- c(sentent, data$Chinese.origin.data[dataIndex])
        sententEnglish <<- c(sententEnglish, data$)
      }
    }
   
    IDindex <- IDindex + 1
  }
 
}







area17ID
area70
<- c(vector, v)
##########################################################################################


> x <- c(1:5)
> x
[1] 1 2 3 4 5

> y <- c(3:8)
> y
[1] 3 4 5 6 7 8

> union(x,y)
[1] 1 2 3 4 5 6 7 8

> intersect(x,y)
[1] 3 4 5

> setdiff(x,y)
[1] 1 2

> setdiff(y,x)
[1] 6 7 8

> setequal(x,y)
[1] FALSE

> is.element(x,y)
[1] FALSE FALSE  TRUE  TRUE  TRUE










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