###############################################################################
###############################################################################
###############################################################################
#library
  library(ggplot2)
  library(cowplot)
###############################################################################
#function
  MK_Plot_Month <- function(Data){
    PanelTheme <-
    theme(panel.background = element_blank(),
          axis.line = element_line(linewidth=0.25),
          axis.ticks.x = element_line(size=0.25),
          axis.ticks.y = element_line(size=0.25),
          axis.ticks.length = unit(0.15,"lines"),
          axis.text.x = element_text(size=6,angle=90),
          axis.text.y = element_text(size=6),
          axis.title = element_text(size=8),
          legend.position = "none",
          legend.text = element_text(size=4),
          legend.title = element_text(size=6))
    MK300_Day <- unite(Data,ID,Date,col="Abc",sep="%%%") %>%
      group_by(Abc) %>% summarise(Number=sum(Number)) %>%
      separate(Abc,into=c("Machine","Date"),sep="%%%")
    MK300_Day$Date <- as.Date(MK300_Day$Date)
    p1 <- ggplot(MK300_Day)+theme_classic()+PanelTheme+
      ylab("Mosquito Number by day")+xlab("")+
      geom_point(aes(Date,Number),color="#EE2E22",
                 size=1.5,stroke=0.0)+
      geom_line(aes(Date,Number),color="#EE2E22",linewidth=0.25)+
      scale_x_date(expand = c(0,0),date_breaks = "1 day")+
      scale_y_continuous(breaks = c(seq(0,100,by=2)))+
      theme()
    p2 <- ggplot(Data)+theme_classic()+PanelTheme+
      ylab("Mosquito Number by day")+xlab("")+
      geom_point(aes(Time,Temperature),
                 size=0.5,stroke=0.0,color="#00A559")+
      geom_line(aes(Time,Temperature),linewidth=0.25,color="#00A559")+
      scale_x_datetime(expand = c(0,0),date_breaks = "1 day")+
      scale_y_continuous(breaks = c(seq(0,100,by=2)))+
      theme()
    p3 <- ggplot(Data)+theme_classic()+PanelTheme+
      ylab("Mosquito Number by day")+xlab("")+
      geom_point(aes(Time,Humidity),
                 size=0.5,stroke=0.0,color="#FDB439")+
      geom_line(aes(Time,Humidity),linewidth=0.25,color="#FDB439")+
      scale_x_datetime(expand = c(0,0),date_breaks = "1 day")+
      scale_y_continuous(breaks = c(seq(0,100,by=10)))+
      theme()
    plot_grid(p1,p2,p3,ncol=1)
  }








