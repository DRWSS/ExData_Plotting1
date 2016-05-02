## This program reads in the data from household_power_consumption.txt and creates a 
## line graph showing Sub_metering usage for each region (1:3) for 01-02/02/2007 and 
## sends it to the png file called Plot3.png

makeplot3 <- function(){
  
  dataforplots <- read.csv2("household_power_consumption.txt")
  reducedata <- dataforplots[dataforplots$Date== "1/2/2007" | dataforplots$Date== "2/2/2007",c(1,2,7,8,9)]
  
  x <- paste(reducedata[,1],reducedata[,2])
  z <- strptime(x,"%d/%m/%Y %H:%M:%S")
  plot(z,as.numeric(reducedata[,3]), xlab = "", ylab = "Energy sub metering",type = "l", col = "black")
  lines(z,as.numeric(reducedata[,4]),col = "red")
  lines(z,as.numeric(reducedata[,5]),col = "blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1, 1, 1),cex = 0.5) 
  dev.copy(png,file = "Plot3.png")
  dev.off()
 
}

