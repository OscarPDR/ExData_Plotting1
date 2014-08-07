# Read the full .txt document, supposing the file its on the same folder as the script
full_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

# Get only those variables which dates equal the 1st or 2nd of February, 2007
subset_data <- subset(full_data, Date=="2007-02-01" | Date=="2007-02-02")

# Converting dates
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S", tz="")

# Create the .PNG graphic device, 480x480px is default size, but just in case
png("plot1.png", width=480, height=480)

# Generate the histogram for plot1
title <- "Global Active Power"
hist(subset_data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab=paste(title, " (kilowatts)"), 
     ylab="Frequency"
)

# Close the .PNG graphic device
dev.off()