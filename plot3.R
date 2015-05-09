#plot3
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

#Plot 3
with(hpcDate, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, cex = 0.6, pt.cex = 1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Saving to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()