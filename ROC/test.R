data <- read.csv(file="goodDataLatest.csv",head=TRUE,sep=",")

dataCopy <- data$Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.
trueCount <- 0
falseCount <- 0

test <- seq(6500, 9000, 1)
min <- 99999
record <- 0

minAndmaxNormalization <- function(value, oldMin, oldMax, newMax, newMin){
  newValue <- ((value - oldMin) / (oldMax - oldMin)) * (newMax - newMin) + newMin
  #print (newValue)
  return (newValue)
}


for (x in c(1:length(test))){
  #print (x)
  #print (":")
  for (index in c(1:length(dataCopy))){
    tmp <- minAndmaxNormalization(data$Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.[index], 0, 1, 10000, 0)
    ranking <- minAndmaxNormalization(data$ranking[index], 10, 50, 10000, 0)
    
    if (abs(tmp - ranking) < x){
      dataCopy[index] <- TRUE
      trueCount <- trueCount + 1
    }
    else{
      dataCopy[index] <- FALSE
      falseCount <- falseCount + 1
    }
    
  }
  
  #print ("****")
  #print (trueCount)
  #print (falseCount)
  #print (abs(trueCount - falseCount))
  #print (min)
  #print ("****")
  
  if (abs(trueCount - falseCount) < min){
    
    min <- abs(trueCount - falseCount)
    record <- test[x]
  }
  trueCount <- 0
  falseCount <- 0
}

record







trueCount <- 0
falseCount <- 0
for (index in c(1:length(dataCopy))){
  tmp <- minAndmaxNormalization(data$Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.[index], 0, 1, 10000, 0)
  ranking <- minAndmaxNormalization(data$ranking[index], 10, 50, 10000, 0)
  
  if (abs(tmp - ranking) < 2151){
    dataCopy[index] <- TRUE
    trueCount <- trueCount + 1
  }
  else{
    dataCopy[index] <- FALSE
    falseCount <- falseCount + 1
  }
  #dataCopy[index] <- tmp
 
}
trueCount
falseCount
abs(trueCount - falseCount)

hist(data$Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.)
hist(data$Baidu.English.sentiment.analysis.positive.probability.base.on.Google.translated.data.)
hist(data$Baidu.English.sentiment.analysis.postitive.probability.base.on.Baidu.translated.data.)
hist(data$Baidu.English.sentiment.analysis.postitive.probability.base.on.Yandex.translated.data.)
hist(dataCopy)

dataCopy











############################################################################################################
samps <- create_sim_samples(4, 100, 100, "good_er")
mdat <- mmdata(samps[["scores"]], samps[["labels"]],
               modnames = samps[["modnames"]],
               dsids = samps[["dsids"]])

samps
## Generate an smcurve object that contains ROC and Precision-Recall curves
smcurves <- evalmod(mdat)
smcurves

