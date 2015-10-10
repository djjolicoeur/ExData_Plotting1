source("getdata.R")

## Creates the first of the specified graphs
mkPlotOne <- function(){
  ## Pull in data from helper lib
  d <- ensureAndGetData()

  png(filename="plot1.png")

  hist(d$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

  dev.off()
}