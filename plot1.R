# plot1.R

# check if data exists, otherwise download and unzip data...
if (!file.exists("household_power_consumption.txt")){
  message("household_power_consumption.txt found in path, checking if the zip file exisits")
  if (!file.exists("household.zip")) {
    message("Data.zip does not exist, attempting to download..")
    fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileurl,"household.zip")
  }
  unzip("household.zip")
} else {message ("   Household Power Consumption Dataset found, proceeding.....")}

if (!exists("hpc")){
    hpc <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors = FALSE, dec =".")
}

hpcsub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
gap <- as.numeric(hpcsub$Global_active_power)
png("plot1.png", width=480, height=480)
hist(gap,col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power",)
dev.off()