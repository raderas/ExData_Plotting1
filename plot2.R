
data<- read.delim("household_power_consumption.txt",sep=";",colClasses="character")

data$Date<- as.Date(data$Date,"%d/%m/%Y")
rm(data)

filtrado<-data[data$Date==as.Date("2007-2-1","%Y-%m-%d")|data$Date==as.Date("2007-2-2","%Y-%m-%d"),]

timedata<-with(filtrado[,c("Date","Time")],paste(filtrado$Date,filtrado$Time,sep=" "))
timedata<-as.POSIXlt(timedata,format="%Y-%m-%d %R:%S")

## plot1.R
png(filename = "plot2.png", width=480,height = 480,units = "px")
plot(timedata,filtrado$Global_active_power,xlab="",ylab = "Global Active Power(kilowatts)",type="l")
dev.off()

rm(list=(ls()))