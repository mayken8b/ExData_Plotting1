power_data <- read.table("household_power_consumption.txt", comment.char = "", 
                         sep = ";", header = TRUE, na.strings = "?",
                         colClasses = c("character", "character", "numeric", "numeric",
                                        "numeric", "numeric", "numeric", "numeric",
                                        "numeric"), nrows = 70000)
clean_data <- power_data[grepl("[1-2]/2/2007", power_data$Date),]

clean_data$Date <- strptime(paste(clean_data$Date, clean_data$Time),
                            format = "%d/%m/%Y %H:%M:%S")

final_data <- clean_data[,c(1, 3, 4, 5, 6, 7, 8, 9)]

png(filename = "plot1.png", width = 480, height = 480)

hist (final_data$Global_active_power, col = "red", 
      xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()