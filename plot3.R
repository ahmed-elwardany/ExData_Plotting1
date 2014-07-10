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

# Plot 3
png (filename = "plot3.png", width = 480, height = 480)
par(bg = "transparent", cex.lab = 0.8)
with (data,{
      plot(DateTime, Sub_metering_1, xlab="",
                 ylab = "Energy sub metering", type = "l", col="black")
      lines(DateTime,Sub_metering_2, type="l", col="red")
      lines(DateTime,Sub_metering_3, type="l", col="blue")
      
      legend("topright", lty= "solid", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                  
        })
dev.off()


