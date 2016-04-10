# Plot2 - Global Active Power

# Get file
dataFile <- "household_power_consumption.txt"

## Check if file exist in directory
if (file.exists(dataFile)) {
  # Reads a file in table format and creates a data frame from it
  data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  getSubSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

  #Date-time Conversion Functions to and from Character
  getDatetime <- strptime(paste(getSubSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  globalActivePower <- as.numeric(getSubSetData$Global_active_power)
  
  # Plot graph
  png("plot2.png", width=480, height=480)
  plot(getDatetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  # shuts down the specified (by default the current) device
  dev.off()
} else {
  stop("File household_power_consumption.txt cannot be found")
}

# List content of directory
dir()
