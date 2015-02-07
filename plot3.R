# Plot the Global Active Power 
plot3 <- function(filename) {
    data <- read_data(filename)
    
    png("plot3.png")
    plot(data$Sub_metering_1 ~ data$DateTime, type="l", xlab="", ylab="Energy sub metering")
    lines(data$Sub_metering_2 ~ data$DateTime, col="red")
    lines(data$Sub_metering_3 ~ data$DateTime, col="blue")
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))
    dev.off()
}

# Read and subset the data from the txt file "household_power_consumption.txt"
read_data <- function(filename) {
    library(sqldf)
    
    data <- read.csv.sql(filename, header=TRUE, sep=";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
    data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
    
    data
}