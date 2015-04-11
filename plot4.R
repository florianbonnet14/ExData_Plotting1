setwd("C:/Users/Florian Bonnet/Documents/BI/COURSERA/Exploratory/")
power<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
powersub<-subset(power,Date=="1/2/2007" | Date=="2/2/2007")
time<-strptime(paste(powersub$Date,powersub$Time),format='%d/%m/%Y %H:%M:%S')
png(filename="plot4.png")
par(mfrow=c(2,2))

# Plot 1 (upper left)

plot(x=time,y=powersub[,"Global_active_power"],type="l",ylab="Global Active Power (kilowatts)",main="", xlab="")

# Plot 2 (upper right)

plot(x=time,y=powersub[,"Voltage"],type="l",ylab="Voltage",main="",xlab="datetime")

# Plot 3 (lower left)

plot(x=time,y=powersub[,"Sub_metering_1"],type="l",ylab="Energy sub meteringt",main="", xlab="")
lines(x=time,y=powersub[,"Sub_metering_2"],col="red")
lines(x=time,y=powersub[,"Sub_metering_3"],col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub-metering-1","Sub_metering_2","Sub_metering_3"))

# Plot 4 (lower right)

plot(x=time,y=powersub[,"Global_reactive_power"],type="l",ylab="Global_reactive_power",main="",xlab="datetime")
dev.off()
