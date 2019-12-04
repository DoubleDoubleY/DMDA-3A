# tell R where your file is located
setwd('C:/Users/metl013/Desktop/SImOut')

# tell R what file to use
mydata <- read.csv("mobel_device.csv")

# convert to a R data frame
mydata <- data.frame(mydata)

# fit the K-means model to mydata
fit <- kmeans(mydata, 3) #3 cluster solution

# get cluster means
means <- aggregate(mydata, by=list(fit$cluster), FUN=mean)

# append cluster assignment
mydata <- data.frame(mydata, fit$cluster)

# write the data back out to Excel
write.csv(mydata, file="FirstCluster.csv", row.names=FALSE) # full data file with cluster assignments
write.csv(means, file="FirstClusterMeans.csv", row.names=FALSE) # list of means by cluster

#end

