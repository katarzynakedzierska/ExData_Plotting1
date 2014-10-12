data<- read.csv.sql("household_power_consumption.txt", 
                    sql= "select * from file where date in ( '1/2/2007' , '2/2/2007')" ,
                    sep=";" )


data$DIT<-paste(data$Date, data$Time)
data$DIT<-strptime(data$DIT, "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date)
Sys.setlocale("LC_TIME", "en_US.UTF-8")

png("plot2.png", height=480, width=480) 

plot(data$DIT,data$Global_active_power ,xlab="", ylab="Global active power (kilowatts)",
     type="l")

dev.off()


