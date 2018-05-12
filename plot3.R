# plot3.R

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

# Only load the data if not in workspace to save time on multiple plots
if (!exists("hpc")){
    hpc <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors = FALSE, dec =".")
}

hpcsub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
gap <- as.numeric(hpcsub$Global_active_power)
sub1 <- as.numeric(hpcsub$Sub_metering_1)
sub2 <- as.numeric(hpcsub$Sub_metering_2)
sub3 <- as.numeric(hpcsub$Sub_metering_3)

datetime <- strptime(paste(hpcsub$Date, hpcsub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png("plot3.png", width=480, height=480)
plot(datetime,sub1, type="l",xlab="",ylab="Energy sub metering")
lines(datetime,sub2,col="red")
lines(datetime,sub3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()