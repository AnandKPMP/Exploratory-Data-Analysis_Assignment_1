#plot1.R
#Step-1 Read Data
#setwd("YOUR CUURENT WORKING DIRECTORY that the Assignment household_power_consumption.txt ")
power_d <- read.csv2(".\\household_power_consumption.txt"
                     ,header = FALSE, sep = ";"
                     ,stringsAsFactors = FALSE
)
#Set Column Names
colnames(power_d ) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Convert Date and Time to R class

power_d$Date<-as.Date(power_d$Date, "%d/%m/%Y")

#Filter data rows based on dates
power_data1 <- subset(power_d,power_d$Date >= "2007-02-01")
power_data1 <-subset(power_data1,power_data1$Date <= "2007-02-02")
remove(power_d)

power_data1 <-subset(power_data1,power_data1$Global_active_power != "?")

#Add the Date part to Time
power_data1$Time<- strptime( paste((power_data1$Date), power_data1$Time, sep=" "), "%Y-%m-%d %H:%M:%S")


# Open the PNG device
png(filename = ".\\plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"), antialias = "cleartype")

# Draw the plot
plot(power_data1$Time, power_data1$Global_active_power,ylab = "Global Active Power(Kilowatts)",type = "l" )


# Close the device
dev.off()