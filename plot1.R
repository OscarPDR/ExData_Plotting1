# Read the full .txt document, supposing the file its on the same folder as the script
full_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")

# Get only those variables which dates equal the 1st or 2nd of February, 2007
subset_data <- subset(full_data, 
    Date=="1/2/2007" | Date=="2/2/2007", 
    select = Global_active_power
)

# Create the .PNG graphic device
png("plot1.png")

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