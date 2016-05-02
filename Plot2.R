## This program reads in the data from household_power_consumption.txt and creates a 
## line graph showing the Global Active Power usage in kilowatts for 01-02/02/2007 and 
## sends it to the png file called Plot2.png

makeplot2 <- function(){
  
  dataforplots <- read.csv2("household_power_consumption.txt")
  reducedata <- dataforplots[dataforplots$Date== "1/2/2007" | dataforplots$Date== "2/2/2007",1:3]

  
  x <- paste(reducedata[,1],reducedata[,2])
  z <- strptime(x,"%d/%m/%Y %H:%M:%S")
  plot(z,as.numeric(reducedata[,3])/500, xlab = "", ylab = "Global Active Power (kilowatts)",type = "l")
  dev.copy(png,file = "Plot2.png")
  dev.off()
 
}

