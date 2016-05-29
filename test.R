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

statusColNum <- grep("Status", names(segData))
segData <- segData[, -statusColNum]

print(ggplot(data=segData, aes(segData$AreaCh1)) + geom_histogram())

skewValues <- apply(segData, 2, skewness)

trans <- preProcess(segData, 
                    method = c("BoxCox", "center", "scale"))

transformed <- predict(trans, segData)

print(ggplot(data=transformed, aes(transformed$AreaCh1)) + geom_histogram())
