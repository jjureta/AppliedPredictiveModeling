library(AppliedPredictiveModeling)
library(caret)
library(corrplot)
library(e1071)
library(lattice)

data("segmentationOriginal")

segData <- subset(segmentationOriginal, Case == "Train")

cellId <- segData$Cell
class <- segData$Class
case <- segData$Case

# remove the columns
segData <- segData[, -(1:3)]
