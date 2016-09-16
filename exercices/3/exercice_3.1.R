library(mlbench)
library(e1071)
library(reshape2)
library(ggplot2)

data(Glass)

# Remove Type column
glassSubset <- subset(Glass, select = -Type)
skewValues <- apply(glassSubset, 2, skewness)

# Transform to long format
glassMelted <- melt(glassSubset)

# Plot predictor's density function
plot1 <- ggplot(data=glassMelted, aes(glassMelted$value)) + 
  geom_density() +
  facet_wrap(~variable, scales = "free") +
  xlab("predictor")

print(plot1)

#plot2 <- densityplot(~value|variable,
#            data = glassMelted,
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

# Verify the correlation between predictors
correlations <- cor(glassSubset)
plotcorr <- corrplot(correlations, 
                     order = "hclust",
                     method = "pie",
                     addCoefasPercent = TRUE)
print(plotcorr)

highCorr <- findCorrelation( correlations, cutoff = 0.75)
filterredSegdata <- glassSubset[, -highCorr]