setwd("~/Cursos/DataScience/exploratory1/ExData_Plotting1")

data<- read.delim("household_power_consumption.txt",sep=";",colClasses="character")

data$Date<- as.Date(data$Date,"%d/%m/%Y")
filtrado<-data[data$Date==as.Date("2007-2-1","%Y-%m-%d")|data$Date==as.Date("2007-2-2","%Y-%m-%d"),]

rm(data)

timedata<-with(filtrado[,c("Date","Time")],paste(filtrado$Date,filtrado$Time,sep=" "))
timedata<-as.POSIXlt(timedata,format="%Y-%m-%d %R:%S")

png(filename = "plot3.png", width=480,height = 480,units = "px")
plot(timedata,filtrado$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
lines(timedata,filtrado$Sub_metering_2,col="red", type="l")
lines(timedata,filtrado$Sub_metering_3,col="blue", type="l")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"),lty = 1)
dev.off()

rm(list=ls())