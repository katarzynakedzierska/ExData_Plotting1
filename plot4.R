data<- read.csv.sql("household_power_consumption.txt", 
                    sql= "select * from file where date in ( '1/2/2007' , '2/2/2007')" ,
                    sep=";" )


data$DIT<-paste(data$Date, data$Time)
data$DIT<-strptime(data$DIT, "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date)
Sys.setlocale("LC_TIME", "en_US.UTF-8")

png("plot4.png", height=480, width=480) 

par(mfrow=c(2,2))

plot(data$DIT,data$Global_active_power ,xlab="", ylab="Global active power", type="l")

plot(data$DIT,data$Voltage , ylab="Voltage", type="l",xlab="datetime")

plot(data$DIT, data$Sub_metering_1 ,xlab="", ylab="Energy sub matering", type="l") 
lines(data$DIT,data$Sub_metering_2, col="red")
lines(data$DIT,data$Sub_metering_3, col="blue")
legend("topright",c("Sub_matering_1","Sub_matering_2","Sub_matering_3"), lwd=c(1,1,1),col=c("black", "red", "blue") , bty="n")

plot(data$DIT,data$Global_reactive_power , ylab="Global_reactive_power", xlab="datetime", type="l")


dev.off()
