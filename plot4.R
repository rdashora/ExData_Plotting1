library(dplyr)
RawData <- read.table("./Datasets/household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?")
PowerConsumption <- subset(RawData, Date=="1/2/2007" | Date == "2/2/2007")
PowerConsumption <- tbl_df(PowerConsumption)
rm(RawData)

PowerConsumption <- mutate(PowerConsumption, DateTime=paste(PowerConsumption$Date, PowerConsumption$Time))

PowerConsumption$Date <- as.Date(PowerConsumption$Date, "%d/%m/%Y")
PowerConsumption$Time <- strptime(PowerConsumption$Time, "%H:%M:%S")
PowerConsumption$DateTime <- strptime(PowerConsumption$DateTime, "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
plot(PowerConsumption$DateTime, PowerConsumption$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(PowerConsumption$DateTime, PowerConsumption$Voltage, type="l", xlab="DateTime", ylab="Voltage")
plot(PowerConsumption$DateTime, PowerConsumption$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
lines(PowerConsumption$DateTime, PowerConsumption$Sub_metering_2, type="l", xlab="", ylab="", col="Red")
lines(PowerConsumption$DateTime, PowerConsumption$Sub_metering_3, type="l", xlab="", ylab="", col="Blue")
plot(PowerConsumption$DateTime, PowerConsumption$Global_reactive_power, type="l", xlab="DateTime", ylab="Global Reactive Power")
dev.copy(png,filename="plot4.png", height=480, width=480)
dev.off(which=dev.cur())









