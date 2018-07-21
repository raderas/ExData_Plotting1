## reading the datafile
data<- read.delim("household_power_consumption.txt",sep=";",colClasses="character")

## converting Date column to Date datatype
data$Date<- as.Date(data$Date,"%d/%m/%Y")

## subsetting records only from February 1st and 2nd, 2007
filtrado<-data[data$Date==as.Date("2007-2-1","%Y-%m-%d")|data$Date==as.Date("2007-2-2","%Y-%m-%d"),]

## plotting to png device
png(filename = "plot1.png", width=480,height = 480,units = "px")
hist(as.numeric(filtrado$Global_active_power),col="red",main ="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()

## freeing up memory
rm(list=ls())