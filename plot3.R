# Read the full .txt document, supposing the file its on the same folder as the script
full_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

# Get only those variables which dates equal the 1st or 2nd of February, 2007
subset_data <- subset(full_data, Date=="2007-02-01" | Date=="2007-02-02")

# Converting dates
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S", tz="")

# Create the .PNG graphic device, 480x480px is default size, but just in case
png("plot3.png", width=480, height=480)

# Generate the line chart for plot3
plot(subset_data$Datetime, subset_data$Sub_metering_1, 
     type="l", # Draw lines instead of dots
     xlab="", # Empty x-label string
     ylab="Energy sub metering"
)

# Add lines for Sub_metering_2 data in red color
lines(subset_data$Datetime, subset_data$Sub_metering_2, col="red")

# Add lines for Sub_metering_3 data in blue color
lines(subset_data$Datetime, subset_data$Sub_metering_3, col="blue")

# Add legend
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), 
       lwd=1 # Line width
)

# Close the .PNG graphic device
dev.off()