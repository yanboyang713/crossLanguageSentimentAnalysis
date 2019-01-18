install.packages("ggplot2")

library(ggplot2)
data <- read.csv(file="goodDataLatest.csv",head=TRUE,sep=",")

x <- seq(10, 50, length.out=50)
df <- with(data, data.frame(x = x, y = dnorm(x, mean(ranking), sd(ranking))))

ggplot(data=data, aes(data$ranking)) + 
  geom_histogram(col="red", 
                 aes(fill=..count..),
                 position="identity",
                 binwidth = 10
                 ) +
  scale_fill_gradient("Count", low = "green", high = "red") +
  labs(title="Histogram for User Rating") +
  labs(x="User Rating", y="Count") + 
  theme(plot.title = element_text(hjust = 0.5))

  geom_line(data = df, aes(x = x, y = y), color = "red")




x <- seq(64, 74, length.out=100)
df <- with(Galton, data.frame(x = x, y = dnorm(x, mean(parent), sd(parent))))
p + geom_line(data = data, aes(x = x, y = y), color = "red")
