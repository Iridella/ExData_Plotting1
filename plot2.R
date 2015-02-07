# Plot the Global Active Power 
plot2 <- function(filename) {
    data <- read_data(filename)

    png("plot2.png")
    plot(data$Global_active_power ~ data$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
}

# Read and subset the data from the txt file "household_power_consumption.txt"
read_data <- function(filename) {
    library(sqldf)
    
    data <- read.csv.sql(filename, header=TRUE, sep=";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
    data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
    
    data
}