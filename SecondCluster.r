#######################################
###  This cluster model is updated  ###
###  to inlude feature exclusion    ###
###  for irrelevant features.       ###
#######################################


# tell R where your file is located
#setwd('C:/Users/metl013/Desktop/SImOut')

# tell R what file to use
mydata <- read.csv("mobel_device.csv")

# convert to a R data frame
mydata <- data.frame(mydata)

# exclude unimportant variables
exclude <- c("Channel", "Region")
mydata <- mydata[ , !(names(mydata) %in% exclude)]

# fit the K-means model to mydata
fit <- kmeans(mydata, 3) #3 cluster solution

# get cluster means
means <- aggregate(mydata, by=list(fit$cluster), FUN=mean)

# append cluster assignment
mydata <- data.frame(mydata, fit$cluster)

# write the data back out to Excel
write.csv(mydata, file="SecondCluster.csv", row.names=FALSE) # full data file with cluster assignments
write.csv(means, file="SecondClusterMeans.csv", row.names=FALSE) # list of means by cluster

#end