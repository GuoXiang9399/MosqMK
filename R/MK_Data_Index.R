###############################################################################
###############################################################################
###############################################################################
#library
  library(dplyr)
###############################################################################
#function
  MK_Data_Index <- function(all_data){
    Data <- aggregate(all_data$Number,by=list(type=all_data$Date),sum)
    names(Data) <- c("Date","Number")
    Data <- mutate(Data, MS_index = ceiling(Number/1.5) )
    Data
  }
