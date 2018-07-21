## Reading the datafile
data<- read.delim("household_power_consumption.txt",sep=";",colClasses="character")

## Converting the Date column to Date type
data$Date<- as.Date(data$Date,"%d/%m/%Y")
## subsetting only records corresponding to February 1st and 2nd, 2007
filtrado<-data[data$Date==as.Date("2007-2-1","%Y-%m-%d")|data$Date==as.Date("2007-2-2","%Y-%m-%d"),]

## freeing memory used on the full data frame since it will no longer be used
rm(data)

## generating a vector with POSIXlt dates from the Date and Time columns of the data
timedata<-with(filtrado[,c("Date","Time")],paste(filtrado$Date,filtrado$Time,sep=" "))
timedata<-as.POSIXlt(timedata,format="%Y-%m-%d %R:%S")

## plotting to a png device
png(filename = "plot3.png", width=480,height = 480,units = "px")
plot(timedata,filtrado$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
lines(timedata,filtrado$Sub_metering_2,col="red", type="l")
lines(timedata,filtrado$Sub_metering_3,col="blue", type="l")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"),lty = 1)
dev.off()

## freeing up memory
rm(list=ls())