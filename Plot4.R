## This program reads in the data from household_power_consumption.txt and creates a 
## 2x2 window fram containing 4 (plots 2 and 3 plus Voltage and Global Reactive Power)line graphs and 
## sends it to the png file called Plot4.png

mp4 <- function(){
  
  dfp <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
  rd <- dfp[dfp$Date== "1/2/2007" | dfp$Date== "2/2/2007",c(1,2,3,4,5,7,8,9)]
  
  fp4 <- strptime(paste(rd[,1],rd[,2]),"%d/%m/%Y %H:%M:%S")
  par(mfrow = c(2,2))
  plot(fp4,rd[,3], xlab = "", ylab = "Global Active Power",type = "l")
  plot(fp4,rd[,5], xlab = "datetime", ylab = "Voltage",type = "l")
  plot(fp4,rd[,6], xlab = "", ylab = "Energy sub metering",type = "l", col = "black")
  lines(fp4,rd[,7],col = "red")
  lines(fp4,rd[,8],col = "blue")
  
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1, 1, 1),cex = 0.4) 
  plot(fp4,rd[,4], xlab = "datetime", ylab = "Global_reactive_power",type = "l")
  dev.copy(png,file = "Plot4.png",width=480,height=480)
  dev.off()
 
}

