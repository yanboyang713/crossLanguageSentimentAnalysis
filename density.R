install.packages("sm")

attach(mtcars)
library(sm)
mtcars
data <- read.csv(file="goodDataLatest.csv",head=TRUE,sep=",")
d <- density(data$ranking)
plot(d, main="Kernel Density of Three different Machine Translation Tools")
polygon(d, col="red", border="blue")


d <- density(data$Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data.)
plot(d, main="Kernel Density of Three different Machine Translation Tools")
polygon(d, border="blue")


d <- density(data$Google.English.sentiment.analysis.score.base.on.Google.translated.data.)
plot(d, main="Kernel Density of Three different Machine Translation Tools")
polygon(d, border="blue")

d <- density(data$Google.English.sentiment.analysis.score.base.on.Yandex.translated.data.)
plot(d, main="Kernel Density of Three different Machine Translation Tools")
polygon(d, border="blue")

d <- density(data$Google.English.sentiment.analysis.score.base.on.Baidu.translated.data.)
plot(d, main="Kernel Density of Three different Machine Translation Tools")
polygon(d, border="blue")




mpg
# create value labels 
cyl.f <- factor(cyl, levels= c(4,6,8),
                labels = c("4 cylinder", "6 cylinder", "8 cylinder")) 

# plot densities 
sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
title(main="MPG Distribution by Car Cylinders")

# add legend via mouse click
colfill<-c(2:(2+length(levels(cyl.f)))) 
legend(locator(1), levels(cyl.f), fill=colfill)
###########################################################################
new <- data.frame(matrix(ncol = 2, nrow = 0))
DFlable <- c("data", "lable")
colnames(new) <- DFlable

#chinese
index <- 1
while (index < length(data$Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data.)) {
  df <- data.frame(data = data$Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data.[index], lable = "Chinese")
  new <- rbind(new, df)
  index = index + 1
}
#Google
index <- 1
while (index < length(data$Google.English.sentiment.analysis.score.base.on.Google.translated.data.)) {
  df <- data.frame(data = data$Google.English.sentiment.analysis.score.base.on.Google.translated.data.[index], lable = "Google")
  new <- rbind(new, df)
  index = index + 1
}
#Yandex
index <- 1
while (index < length(data$Google.English.sentiment.analysis.score.base.on.Yandex.translated.data.)) {
  df <- data.frame(data = data$Google.English.sentiment.analysis.score.base.on.Yandex.translated.data.[index], lable = "Yandex")
  new <- rbind(new, df)
  index = index + 1
}
#Baidu
index <- 1
while (index < length(data$Google.English.sentiment.analysis.score.base.on.Baidu.translated.data.)) {
  df <- data.frame(data = data$Google.English.sentiment.analysis.score.base.on.Baidu.translated.data.[index], lable = "Baidu")
  new <- rbind(new, df)
  index = index + 1
}
write.csv(new, file = "forDensity.csv",row.names=FALSE)

################################################
new <- read.csv(file="forDensity.csv",head=TRUE,sep=",")
# create value labels 
cyl.f <- factor(new$lable, levels= c("Chinese", "Google", "Yandex", "Baidu"),
                labels = c("Origin Chinese Data", "Google Translated Data", "Yandex Translated Data", "Baidu Translated Data")) 

# plot densities
sm.density.compare(c(x,y,z), group = group.index, model = "equal")

sm.density.compare(new, lable, xlab="Google Sentiment Analysis Score")
title(main="Score Distribution by Google Sentiment Analysis")

# add legend via mouse click
colfill<-c(2:(2+length(levels(cyl.f)))) 
legend(locator(1), levels(cyl.f), fill=colfill)
#########################
cyl.f <- factor(new$lable, levels= c("Chinese", "Google", "Yandex", "Baidu"),
                labels = c("Origin Chinese Data", "Google Translated Data", "Yandex Translated Data", "Baidu Translated Data")) 
group.index <- rep(1:4, c(length(data$Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data.), length(data$Google.English.sentiment.analysis.score.base.on.Google.translated.data.), length(data$Google.English.sentiment.analysis.score.base.on.Yandex.translated.data.), length(data$Google.English.sentiment.analysis.score.base.on.Baidu.translated.data.)))
## collect data together and use sm.density.compare()
sm.density.compare(c(data$Google.Chinese.sentiment.analysis.score.base.on.Chinese.origin.data., data$Google.English.sentiment.analysis.score.base.on.Google.translated.data., data$Google.English.sentiment.analysis.score.base.on.Yandex.translated.data., data$Google.English.sentiment.analysis.score.base.on.Baidu.translated.data.), group = group.index, xlab="Google Sentiment Analysis Score")
title(main="Score Distribution by Google Sentiment Analysis")
colfill<-c(2:(2+length(levels(cyl.f)))) 
legend(locator(1), levels(cyl.f), fill=colfill)
###################################
