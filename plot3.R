# read in data and clean it
power_data <- read.table("household_power_consumption.txt", comment.char = "", 
                         sep = ";", header = TRUE, na.strings = "?",
                         colClasses = c("character", "character", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric",
                                        "numeric"), nrows = 70000)
clean_data <- power_data[grepl("[1-2]/2/2007", power_data$Date),]

clean_data$Date <- strptime(paste(clean_data$Date, clean_data$Time),
                            format = "%d/%m/%Y %H:%M:%S")

final_data <- clean_data[,c(1, 3, 4, 5, 6, 7, 8, 9)]

# create graphics png device in working directory
png(filename = "plot3.png")

# create plots
plot(final_data$Date, final_data$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
lines(final_data$Date, final_data$Sub_metering_1)
lines(final_data$Date, final_data$Sub_metering_2, col = "red")
lines(final_data$Date, final_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"), lwd = 1,
       col = c("black", "red", "blue"))

# turn off graphics device
dev.off()
