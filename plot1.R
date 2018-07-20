
data<- read.delim("household_power_consumption.txt",sep=";",colClasses="character")

data$Date<- as.Date(data$Date,"%d/%m/%Y")
filtrado<-data[data$Date==as.Date("2007-2-1","%Y-%m-%d")|data$Date==as.Date("2007-2-2","%Y-%m-%d"),]

## plot1.R
png(filename = "plot1.png", width=480,height = 480,units = "px")
hist(as.numeric(filtrado$Global_active_power),col="red",main ="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()

rm(list=ls())