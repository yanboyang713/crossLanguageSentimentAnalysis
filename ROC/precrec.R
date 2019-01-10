library(precrec)
library(ggplot2)
# Load a test dataset
data(P10N10)
P10N10
# Calculate ROC and Precision-Recall curves
sscurves <- evalmod(scores = P10N10$scores, labels = P10N10$labels)
autoplot(sscurves, "PRC")
autoplot(sscurves)


# 5 data sets with 50000 positives and 50000 negatives
samp1 <- create_sim_samples(5, 50000, 50000)

# Calculate curves
samp1
eval1 <- evalmod(scores = samp1$scores, labels = samp1$labels)
eval1
# Reduced supporting points
system.time(autoplot(eval1))
# Full supporting points
system.time(autoplot(eval1, reduce_points = FALSE))







s1 <- c(1, 2, 3, 4)
s2 <- c(1, 1, 3, 4)

scores1 <- join_scores(s1, s2)
scores1

l1 <- c(1, 0, 1, 1)
l2 <- c(1, 0, 1, 1)

labels1 <- join_labels(l1, l2)
labels1

msmdat1 <- mmdata(scores1, labels1, modnames = c("mod1", "mod2"))
mscurves <- evalmod(msmdat1)
autoplot(mscurves)
title(main = "Stopping Distance versus Speed")