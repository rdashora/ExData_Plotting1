library(dplyr)
RawData <- read.table("./Datasets/household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?")
PowerConsumption <- subset(RawData, Date=="1/2/2007" | Date == "2/2/2007")
PowerConsumption <- tbl_df(PowerConsumption)
rm(RawData)

PowerConsumption <- mutate(PowerConsumption, DateTime=paste(PowerConsumption$Date, PowerConsumption$Time))

PowerConsumption$Date <- as.Date(PowerConsumption$Date, "%d/%m/%Y")
PowerConsumption$Time <- strptime(PowerConsumption$Time, "%H:%M:%S")
PowerConsumption$DateTime <- strptime(PowerConsumption$DateTime, "%d/%m/%Y %H:%M:%S")

plot(PowerConsumption$DateTime, PowerConsumption$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, "plot2.png", width=480, height=480)
dev.off(which=dev.cur())