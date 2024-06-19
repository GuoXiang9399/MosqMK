###############################################################################
###############################################################################
###############################################################################
#library
  library(ggplot2)
  library(cowplot)
###############################################################################
#function

  library(ggplot2)
  library(cowplot)

  PanelTheme <- theme(panel.background = element_rect(fill = "#F5FAFB"),
        panel.grid.major.x = element_line(color = "gray60",linetype = "dashed"),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_line(size=0.5),
        axis.text.x = element_text(size=6),
        axis.text.y = element_text(size=6),
        axis.title = element_text(size=8),
        strip.background = element_rect(fill = "gray70",color=NA),
        strip.text = element_text(size=8))
  p1 <- ggplot(Data)+PanelTheme+
    geom_line(aes(Time,Number),color="#DB291A",size=0.5)+
    scale_x_datetime(date_breaks = "3 hour",
                     date_labels = "%H",minor_breaks = "1 hour")+
    scale_y_continuous(breaks = seq(0,100,by=2),limits = c(0,10))+
    xlab("")+ylab("Mosquito Number by hour")+
    facet_wrap(vars(Date),scales="free_x",ncol=7)+
    theme()
  p2 <- ggplot(Data,aes(Time,Temperature))+PanelTheme+
    geom_line(color="#00A559",linetype=1,size=0.5)+
    scale_x_datetime(date_breaks = "3 hour",
                     date_labels = "%H")+
    scale_y_continuous(breaks = c(seq(0,50,by=2)) )+
    xlab("")+ylab("Temperature")+
    facet_wrap(vars(Date),scales="free_x",ncol=7)+
    theme()
  p3 <- ggplot(Data,aes(Time,Humidity))+PanelTheme+
    geom_line(color="#3679BA",size=0.5)+
    scale_x_datetime(date_breaks = "3 hour",
                     date_labels = "%H")+
    scale_y_continuous(limits = c(30,100))+
    xlab("")+ylab("Humidity")+
    facet_wrap(vars(Date),scales="free_x",ncol=7)+
    theme()
  p4 <- ggplot(Data,aes(Time,Illuminance))+
    geom_line(color="#4D4D4D",size=0.5)+PanelTheme+
    scale_x_datetime(date_breaks = "3 hour",
                     date_labels = "%H")+
    scale_y_log10()+
    facet_wrap(vars(Date),scales="free_x",ncol=7)+
    theme()
  plot_grid(p1,p2,p3,p4,
            ncol=1,align="h")




