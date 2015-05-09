#plot1
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

#Plot 1 to screen
hist(hpcDate$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Saving plot 1 to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
