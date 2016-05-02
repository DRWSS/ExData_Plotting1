## This program reads in the data from household_power_consumption.txt and creates a 
## line graph showing Sub_metering usage for each region (1:3) for 01-02/02/2007 and 
## sends it to the png file called Plot3.png

mp3 <- function(){
  
  dfp <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
  rd <- dfp[dfp$Date== "1/2/2007" | dfp$Date== "2/2/2007",c(1,2,7,8,9)]
  
  fp3 <- strptime(paste(rd[,1],rd[,2]),"%d/%m/%Y %H:%M:%S")
  plot(fp3,rd[,3], xlab = "", ylab = "Energy sub metering",type = "l", col = "black")
  lines(fp3,rd[,4],col = "red")
  lines(fp3,rd[,5],col = "blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1, 1, 1),cex = 0.5) 
  dev.copy(png,file = "Plot3.png",width=480,height=480)
  dev.off()
 
}

