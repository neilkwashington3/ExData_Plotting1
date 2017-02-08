setwd("C:/Users/Neil/Desktop/Coursera")


power<- read.csv("C:/Users/Neil/Desktop/Coursera/exdata/household_power_consumption.txt", header=TRUE, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

power<-power[power$Global_active_power!="?",]

df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Time<-as.POSIXct(paste(df$Date,df$Time))


df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

plot(df$Time,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

lines(df$Time,df$Sub_metering_2,col="red")
lines(df$Time,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1       ","Sub_metering_2       ", "Sub_metering_3       "),lty=1,cex=.8)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
