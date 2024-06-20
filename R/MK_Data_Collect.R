###############################################################################
###############################################################################
###############################################################################
#library
  library(readxl)
  library(lubridate)
  library(tidyr)
  library(dplyr)
  library(fs)
  #all_data <- MK_Data_Collect("Demo","00054F820441223700001264")
###############################################################################
#function
  mk_read_excel <- function(x){read_excel(x,skip=1)}
  MK_Data_Collect <- function(i,j){
    file_list <- fs::dir_ls(path=i)
    data_list <- lapply(file_list, mk_read_excel)
    all_data <- do.call(rbind, data_list)
     names(all_data) <- c("No","Time","Number","Temperature","Humidity","Illuminance","Battery")
    all_data <- subset(all_data, Time!="合计")
    all_data <- subset(all_data, Battery!=0)
    all_data <- all_data[,-1]
    all_data$ID <- j
    all_data$char <- ":00"
    all_data <- unite(all_data,Time,char,col="Time",sep="")
    all_data$Time <- lubridate::as_datetime(all_data$Time)
    all_data$Number <- as.numeric(all_data$Number)
    all_data$Temperature <- as.numeric(all_data$Temperature)
    all_data$Humidity <- as.numeric(all_data$Humidity)
    all_data$Illuminance <- as.numeric(all_data$Illuminance)
    all_data$Battery <- as.numeric(all_data$Battery)
    all_data$Year <- year(all_data$Time)
    all_data$Month <- month(all_data$Time)
    all_data$Day <- day(all_data$Time)
    all_data$Date <- date(all_data$Time)
    all_data$Hour <- hour(all_data$Time)
    all_data
  }



