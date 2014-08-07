# Read the full .txt document, supposing the file its on the same folder as the script
full_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

# Get only those variables which dates equal the 1st or 2nd of February, 2007
subset_data <- subset(full_data, Date=="2007-02-01" | Date=="2007-02-02")

# Converting dates
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S", tz="")

# Create the .PNG graphic device, 480x480px is default size, but just in case
png("plot4.png", width=480, height=480)

# Create a 2x2 matrix for plotting each graph in the graphic canvas
par(mfrow=c(2,2))

# Generate the line chart at the top-left corner for plot4
plot(subset_data$Datetime, subset_data$Global_active_power, 
     type="l", # Draw lines instead of dots
     xlab="", # Empty x-label string
     ylab="Global Active Power"
)

# Generate the line chart at the top-right corner for plot4
plot(subset_data$Datetime, subset_data$Voltage, 
     type="l", # Draw lines instead of dots
     xlab="datetime",
     ylab="Voltage"
)

# Generate the line chart at the bottom-left corner for plot4
plot(subset_data$Datetime, subset_data$Sub_metering_1, 
     type="l", # Draw lines instead of dots
     xlab="", # Empty x-label string
     ylab="Energy sub metering"
)

lines(subset_data$Datetime, subset_data$Sub_metering_2, col="red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col="blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), 
       lwd=1, # Line width
       bty="n" # Remove box around the legend
)

# Generate the line chart at the bottom-right corner for plot4
plot(subset_data$Datetime, subset_data$Global_reactive_power, 
     type="l", # Draw lines instead of dots
     xlab="datetime",
     ylab="Global_reactive_power"
)

# Close the .PNG graphic device
dev.off()