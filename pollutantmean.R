pollutantmean <- function(directory, pollutant, id=1:332) 
        {
        mydata<-str(read.csv(paste("D:/Arjun/Desktop/Learning/Coursera/R Programming/Week2/",directory, "/001",
                                     ".csv", sep = ""),header=T))
        for(i in id)
                {
                fileStr <- paste("D:/Arjun/Desktop/Learning/Coursera/R Programming/Week2/",directory, "/", sprintf("%03d", as.numeric(i)),
                                 ".csv", sep = "")
                temp<-read.csv(fileStr,header=T)
                mydata<-rbind(mydata,temp)
        }
        
        round(mean(mydata[,pollutant],na.rm=TRUE),3)
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

#source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
#submit()
