## This program reads in the data from household_power_consumption.txt and creates a 
## line graph showing the Global Active Power usage in kilowatts for 01-02/02/2007 and 
## sends it to the png file called Plot2.png

mp2 <- function(){
  
  
  dfp <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
  rd <- dfp[dfp$Date== "1/2/2007" | dfp$Date== "2/2/2007",1:3]
  fp2 <- strptime(paste(rd$Date,rd$Time),"%d/%m/%Y %H:%M:%S")
  plot(fp2,rd$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)",type = "l")
  dev.copy(png,file = "Plot2.png",width=480,height=480)
  dev.off()
 
}

