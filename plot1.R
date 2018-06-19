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
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width = 480, height = 480)
hist(powerDT[, Global_active_power], main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.off()