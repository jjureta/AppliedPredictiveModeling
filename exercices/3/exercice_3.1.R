library(mlbench)
library(e1071)
library(reshape2)

data(Glass)

# Remove Type column
glassSubset <- subset(Glass, select = -Type)
skewValues <- apply(glassSubset, 2, skewness)

glassMelt <- melt(glassSubset)

plot1 <- ggplot(data=glassMelt, aes(glassMelt$value)) + 
  geom_freqpoly(bins = 200) +
  facet_wrap(~variable, scales = "free") 

print(plot1)

#plot2 <- densityplot(~value|variable,
#            data = glassMelt,
#            ## Adjust each axis so that the measurement scale is
#            ## different for each panel
#            scales = list(x = list(relation = "free"),
#                          y = list(relation = "free")),
#            ## 'adjust' smooths the curve out
#            adjust = 1.25,
#            ## change the symbol on the rug for each data point
#            pch = "|",
#            xlab = "Predictor")
#print(plot2)
