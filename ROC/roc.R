data <- read.csv(file="goodDataLatest.csv",head=TRUE,sep=",")

ref <- seq(0, 1, 1 / 5 )

dataCopy <- data$Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.
trueCount <- 0
falseCount <- 0

f <- function(ranking, index){
  if (ranking == data$ranking[index]){
    dataCopy[index] <<- TRUE
    trueCount <<- trueCount + 1
  } else{
    dataCopy[index] <<- FALSE
    falseCount <<- falseCount + 1
  }
}

fn <- function(ranking, index){
  if (ranking <= data$ranking[index] + 10 && ranking >= data$ranking[index] ){
    dataCopy[index] <<- TRUE
    trueCount <<- trueCount + 1
  } else{
    dataCopy[index] <<- FALSE
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
  } else if ( dataCopy[x] >= ref[5] && dataCopy[x] < ref[6]) {
    f(50, x)
  }
}

for (x in c(1:length(dataCopy))){
  
  if (dataCopy[x] >= ref[1] && dataCopy[x] < ref[2]){
    fn(10, x)
  } else if (dataCopy[x] >= ref[2] && dataCopy[x] < ref[3]) {
    fn(20, x)
  } else if ( dataCopy[x] >= ref[3] && dataCopy[x] < ref[4]) {
    fn(30, x)
  } else if ( dataCopy[x] >= ref[4] && dataCopy[x] < ref[5]) {
    fn(40, x)
  } else if ( dataCopy[x] >= ref[5] && dataCopy[x] < ref[6]) {
    fn(50, x)
  }
}

for (x in c(1:length(dataCopy))){
  print (dataCopy[x])
  print (data$Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.[x])
  print (data$ranking[x])
  print ("****************")
}
trueCount
falseCount


hist(data$Baidu.Chinese.sentiment.analysis.positive.probability.base.on.Chinese.origin.data.)
