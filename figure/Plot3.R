#reading the data
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
#getting reqd data [converted data colomn into date format using lubridate package]
library(lubridate)
date<-dmy(data$Date)
data_reqd<-data[date=="2007-02-01"|date=="2007-02-02",]

##creating the third plot [Plot 3]- A line graph of 
##Energy sub metering (vs) Day of the week[a POSIXct vatiable that contains both date and time]

day_time<-paste(data_reqd$Date,data_reqd$Time,sep = " ")
day_time<-dmy_hms(day_time)

{plot(day_time,type.convert(data_reqd$Sub_metering_1,numerals = "no.loss"),type = "l",ylab = "Energy sub metering",xlab = "")
lines(day_time,type.convert(data_reqd$Sub_metering_2,numerals = "no.loss"),type = "l",col="red")
lines(day_time,type.convert(data_reqd$Sub_metering_3,numerals = "no.loss"),type = "l",col="blue")

legend("topright",col=c("black","red","blue"),legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),lty = 1)}
