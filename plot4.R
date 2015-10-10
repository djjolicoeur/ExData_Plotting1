source("getdata.R")

mkPlotFour <- function(){
  d <- ensureAndGetData()
  
  env <- par()
  
  png(filename="plot4.png")
  
  par(mfrow=c(2,2))
  plot(x=(d$DateTime),y=d$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  
  plot(x = (d$DateTime),y=d$Voltage,type="l",ylab="Voltage",xlab="datetime")
  
  plot(x=(d$DateTime),y=d$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  lines(x=(d$DateTime),y=d$Sub_metering_2,col="red")
  lines(x=(d$DateTime),y=d$Sub_metering_3,col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.4)
  
  plot(d$DateTime, d$Global_reactive_power, type="l", main="", xlab="datetime")
  
  par(env)
  
  dev.off()
}