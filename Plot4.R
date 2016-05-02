## This program reads in the data from household_power_consumption.txt and creates a 
## 2x2 window fram containing 4 (plots 2 and 3 plus Voltage and Global Reactive Power)line graphs and 
## sends it to the png file called Plot4.png

makeplot4 <- function(){
  
  dataforplots <- read.csv2("household_power_consumption.txt")
  reducedata <- dataforplots[dataforplots$Date== "1/2/2007" | dataforplots$Date== "2/2/2007",c(1,2,3,4,5,7,8,9)]
  
  x <- paste(reducedata[,1],reducedata[,2])
  z <- strptime(x,"%d/%m/%Y %H:%M:%S")
  par(mfrow = c(2,2))
  plot(z,as.numeric(reducedata[,3]), xlab = "", ylab = "Global Active Power",type = "l")
  plot(z,as.numeric(reducedata[,5]), xlab = "datetime", ylab = "Voltage",type = "l")
  plot(z,as.numeric(reducedata[,6]), xlab = "", ylab = "Energy sub metering",type = "l", col = "black")
  lines(z,as.numeric(reducedata[,7]),col = "red")
  lines(z,as.numeric(reducedata[,8]),col = "blue")
  
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1, 1, 1),cex = 0.4) 
  plot(z,as.numeric(reducedata[,4]), xlab = "datetime", ylab = "Global_reactive_power",type = "l")
  dev.copy(png,file = "Plot4.png")
  dev.off()
 
}

