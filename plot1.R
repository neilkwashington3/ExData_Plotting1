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
hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
