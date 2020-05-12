#reading the data
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
#getting reqd data [converted data colomn into date format using lubridate package]
library(lubridate)
date<-dmy(data$Date)
data_reqd<-data[date=="2007-02-01"|date=="2007-02-02",]

##creating the second plot [Plot 2]- A line graph of 
##Global_Active_Power (vs) Day of the week[a POSIXct vatiable that contains both date and time]
#the typeof Global_active_power is "integer", for plot() to work the data should be "numeric"

day_time<-paste(data_reqd$Date,data_reqd$Time,sep = " ")
day_time<-dmy_hms(day_time)
plot(day_time,type.convert(data_reqd$Global_active_power,numerals = "no.loss"),type = "l", col="black",ylab = "Global Active Power (kilowatts)",xlab = "")
