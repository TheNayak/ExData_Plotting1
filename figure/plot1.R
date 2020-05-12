##reading the data
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")

#getting reqd data [converted data colomn into date format using lubridate package]
library(lubridate)
date<-dmy(data$Date)
data_reqd<-data[date=="2007-02-01"|date=="2007-02-02",]

##creating the first plot [Plot 1]- A histogram of Global_Active_Power
#the typeof Global_active_power is "integer", for hist() to work the data should be "numeric"
hist(type.convert(data_reqd$Global_active_power,numerals = "no.loss"),col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")

