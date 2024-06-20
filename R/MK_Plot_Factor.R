###############################################################################
###############################################################################
###############################################################################
#library
  library(ggplot2)
  library(cowplot)
###############################################################################
#function
  MK_Plot_Factor <- function(Data){
     DataFactor <- subset(Data, Number>0)
    PanelTheme <-
      theme(panel.background = element_blank(),
            axis.line = element_line(linewidth=0.25),
            axis.ticks.x = element_line(size=0.25),
            axis.ticks.y = element_line(size=0.25),
            axis.ticks.length = unit(0.15,"lines"),
            axis.text.x = element_text(size=6),
            axis.text.y = element_text(size=6),
            axis.title = element_text(size=8),
            legend.position = "none",
            legend.text = element_text(size=4),
            legend.title = element_text(size=6))
    p1 <- ggplot(DataFactor)+theme_classic()+PanelTheme+
      geom_jitter(aes(Hour,Number),
                  alpha = 0.85,size=1.5,
                  stroke=0.0, color="#EE2E22") +
      scale_y_continuous(breaks = c(seq(0,100,by=1)))

    p2 <- ggplot(DataFactor)+theme_classic()+PanelTheme+
      geom_jitter(aes(Temperature,Number),
                  alpha = 0.85,size=1.5,
                  stroke=0.0, color="#00A559") +
      scale_y_continuous(breaks = c(seq(0,100,by=1)))
    p3 <- ggplot(DataFactor)+theme_classic()+PanelTheme+
      geom_jitter(aes(Humidity,Number),
                 alpha = 0.85,size=1.5,
                 stroke=0.0, color="#FDB439") +
      scale_y_continuous(breaks = c(seq(0,100,by=1)))
    plot_grid(p1,p2,p3,ncol=3)
  }







