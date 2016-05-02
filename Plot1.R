## This program reads in the data from household_power_consumption.txt and creates a 
## histogram showing the distribution of Global Active Power for 01-02/02/2007 and 
## sends it to the png file called Plot1.png

makeplot1 <- function(){

dataforplots <- read.csv2("household_power_consumption.txt")
reduceda <- dataforplots[dataforplots$Date== "1/2/2007",3]
reducedb <- dataforplots[dataforplots$Date== "2/2/2007",3]
forplot1 <- c(reduceda,reducedb)
hist(forplot1/500,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col = "red")
dev.copy(png,file = "Plot1.png")
dev.off()

}


