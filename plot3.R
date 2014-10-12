data<- read.csv.sql("household_power_consumption.txt", 
                    sql= "select * from file where date in ( '1/2/2007' , '2/2/2007')" ,
                    sep=";" )


data$DIT<-paste(data$Date, data$Time)
data$DIT<-strptime(data$DIT, "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date)
Sys.setlocale("LC_TIME", "en_US.UTF-8")

png("plot3.png", height=480, width=480) 

plot(data$DIT, data$Sub_metering_1 , xlab="", ylab="Energy sub matering", type="l") 
lines(data$DIT,data$Sub_metering_2, col="red")
lines(data$DIT,data$Sub_metering_3, col="blue")
legend("topright",c("Sub_matering_1","Sub_matering_2","Sub_matering_3"), lwd=c(2,2,2),col=c("black", "red", "blue") )


dev.off()

