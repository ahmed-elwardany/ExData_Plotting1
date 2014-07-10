# Household Electric power consumption - Exploratory plots

# Loading data into R, We will only be using data from the dates 2007-02-01 
# and 2007-02-02

data <- read.table("household_power_consumption.txt", sep= ";", header= TRUE, 
                stringsAsFactors = FALSE, na.strings= "?")
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# Change format to useful Date/Time format while adding Weekdays as well

data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$WeekDay <- weekdays(data$DateTime)

# Plot 1
par(bg = "transparent", cex.lab = 0.75)
with (data, hist(Global_active_power, main = "Global Active Power", 
              xlab = "Global Active Power (kilowatts)", col = "Red"))
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()


