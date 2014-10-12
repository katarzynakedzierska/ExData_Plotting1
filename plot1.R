data<- read.csv.sql("household_power_consumption.txt", 
                    sql= "select * from file where date in ( '1/2/2007' , '2/2/2007')" ,
                    sep=";" )


data$DIT<-paste(data$Date, data$Time)
data$DIT<-strptime(data$DIT, "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date)

png("plot1.png", height=480, width=480) 

hist(data$Global_active_power, main="Global active power", 
     col="red", xlab="Global active power (kilowatts)", ylim=c(0,1200))

dev.off()
