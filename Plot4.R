setwd("D:\\Personal\\ExploratoryDataAnalysis\\Project1\\ExData_Plotting1")
energy <- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = c("?",""))
energy$DateNew <- with(energy, as.Date(as.character(Date), "%d/%m/%Y"))
energyFeb <- subset(energy,DateNew=="2007-02-01" |  DateNew=="2007-02-02")
energyFeb$DateTime <- with(energyFeb,strptime(paste(DateNew,Time), "%Y-%m-%d %H:%M:%S"))
png(filename = "Plot4.png", width = 700, height = 700, units = "px", type = "windows")

#Plot1
par(mfrow=c(2,2))
with(energyFeb, plot(DateTime,Global_active_power,type ="l", xlab = "",main = "",ylab = "Global Active Power"))

#Plot2
with(energyFeb, plot(DateTime,Voltage,type ="l", xlab = "datetime",main = "",ylab = "Voltage"))

#Plot3
with(energyFeb, plot(DateTime,Sub_metering_1,type ="l", xlab = "",ylab = "Energy sub meeting"))
with(energyFeb, points(DateTime,Sub_metering_2,type ="l", col = "red"))
with(energyFeb, points(DateTime,Sub_metering_3,type ="l", col = "blue"))
legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, bty ="n")

#Plot#4
with(energyFeb, plot(DateTime,Global_reactive_power,type ="l", xlab = "datetime"))
dev.off()