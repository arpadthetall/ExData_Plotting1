#plot4
#Course Project 1
#Exploratory Data Analysis

#Reading in whole dataset from file
hpc <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y") #reformat date

#Subsetting the data to desired range
hpcDate <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)

#Converting date and time
dateTime <- paste(as.Date(hpcDate$Date), hpcDate$Time)
hpcDate$dateTime <- as.POSIXct(dateTime)

#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hpcDate, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~dateTime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", cex=0.4, pt.cex = 1.2,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

#Saving to png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()