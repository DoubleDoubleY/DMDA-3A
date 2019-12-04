# tell R where your file is located
setwd('/Users/mmy/Desktop/SImOut')
# tell R what file to use
mydata <- read.csv("Customers.csv")

# convert to a R data frame
mydata <- data.frame(mydata)

#delete usless column 
mydata <- subset(mydata, select= -c(CustomerID,InboundCalls,BlockedCalls,DroppedCalls))

#delete NA data
mydata<- na.omit(mydata)



#Because MonthlyRevenue should be higher than TotalRecurringCharge
#if not change it
Length<- nrow(mydata)
Num<-1
while(Length+1>Num)  ##loops
  {

   if (mydata[Num,'MonthlyRevenue']<mydata[Num,'TotalRecurringCharge'])        ##比较大小
  {
    temp=mydata[Num,'MonthlyRevenue']
    mydata[Num,'MonthlyRevenue']=mydata[Num,'TotalRecurringCharge']
    mydata[Num,'TotalRecurringCharge']=temp
    mydata[Num,'MonthlyRevenue']
  }
  Num<-Num+1

  }

#set data range of MonthlyRevenue(0,700)
Length<- nrow(mydata)
Num<-1
while(Length+1>Num)  ##loops
  {

   if (mydata[Num,'MonthlyRevenue']<=0&&mydata[Num,'MonthlyRevenue']>=700)  
  {
        mydata=mydata[-Num,]
  }
  Num<-Num+1

  }

#delete data where age <=0
Length<- nrow(mydata)
Num<-1
while(Num+1<Length)  ##loops
  {

   if (mydata[Num,'AgeHH1']<=0)  
  {
        mydata=mydata[-Num,]
  }
  Num<-Num+1

  }



#write data to csv
write.csv(mydata, file="CleanedData.csv", row.names=FALSE) 


