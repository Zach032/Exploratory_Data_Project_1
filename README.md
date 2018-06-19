# Exploratory_Data_Project_1
This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets.
[Dataset](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
</br>Descirption: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
## [Plot One](https://github.com/Zach032/Exploratory_Data_Project_1/blob/master/plot1.R)
```R
library(data.table)
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(path, "household_power_consumption.zip"))
unzip(zipfile = "household_power_consumption.zip")

#Load data
powerDT <- data.table::fread(file.path(path, "household_power_consumption.txt"))
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#First Data Plot
png("plot1.png", width = 480, height = 480)
hist(powerDT[, Global_active_power], main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.off()
```
![](https://github.com/Zach032/Exploratory_Data_Project_1/blob/master/plot1.png)
## [Plot Two](https://github.com/Zach032/Exploratory_Data_Project_1/blob/master/plot2.R)
```R
library(data.table)
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(path, "household_power_consumption.zip"))
unzip(zipfile = "household_power_consumption.zip")

#Load data
powerDT <- data.table::fread(file.path(path, "household_power_consumption.txt"))
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Data Plot
png("plot2.png", width = 480, height = 480)
plot(x = powerDT[, dateTime], y = powerDT[, Global_active_power], type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
```
![](https://github.com/Zach032/Exploratory_Data_Project_1/blob/master/plot2.png)
## [Plot Three](https://github.com/Zach032/Exploratory_Data_Project_1/blob/master/plot3.R)
```R
library(data.table)
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(path, "household_power_consumption.zip"))
unzip(zipfile = "household_power_consumption.zip")

#Load data
powerDT <- data.table::fread(file.path(path, "household_power_consumption.txt"))
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Data Plot
png("plot3.png", width = 480, height = 480)
plot(x = powerDT[, dateTime], y = powerDT[, Sub_metering_1], type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2], col = "red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3], col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), 
       lty = c(1,1), lwd = c(1,1))

dev.off()
```
![](https://github.com/Zach032/Exploratory_Data_Project_1/blob/master/plot3.png)
## [Plot Four](https://github.com/Zach032/Exploratory_Data_Project_1/blob/master/plot4.R)
```R
library(data.table)
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(path, "household_power_consumption.zip"))
unzip(zipfile = "household_power_consumption.zip")

#Load data
powerDT <- data.table::fread(file.path(path, "household_power_consumption.txt"))
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Data Plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(powerDT[, dateTime], powerDT[, Global_active_power], type = "l", xlab = "", ylab="Global Active Power")
plot(powerDT[, dateTime],powerDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")
plot(x = powerDT[, dateTime], y = powerDT[, Sub_metering_1], type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2], col = "red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3], col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), 
       lty = c(1,1), bty = "n", cex = .5)
plot(powerDT[, dateTime], powerDT[, Global_reactive_power], type = "l",
     xlab = "datetime", ylab="Global_reactive_power" )
dev.off()
```
![](https://github.com/Zach032/Exploratory_Data_Project_1/blob/master/plot4.png)
