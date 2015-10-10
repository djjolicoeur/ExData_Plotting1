source("getdata.R")

mkPlotTwo <- function(){
  d <- ensureAndGetData()
  
  png(filename="plot2.png")
  
  plot(x=(d$DateTime), y=d$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  dev.off()
}