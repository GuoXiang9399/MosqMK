# MosqMK
A R package for analyzing unprocessed data collected by mosquito density monitoring instrument MK 300.

MosqMK是针对由南方医科大学开发的智能化蚊媒监测仪器MK300及相关产品等开发的集“数据整理”模块、“数据可视化”模块和“数据报告”模块工作流为一体的R包。

## Installation 安装

Dependency r-package: readxl, tidyr, dplyr, ggplot2, cowplot

MosqMK依赖的R包如下： readxl, tidyr, dplyr, ggplot2, cowplot

安装MosqMK包流程参考如下

```
library(devtools)
install_github('GuoXiang9399/MosqMK')
```

## Usage 使用

###（1）数据整理模块

MK_Data_Collect

<img src="www/demo_files.png" width="100%" style="display: block; margin: auto;" />

MK_Data_Filter

###(2)数据可视化模块

MK_Plot_Raw


MK_Plot_Week


MK_Plot_Month

###(3)数据报告模块

开放中...

##  Contributing 开发
Xiang Guo  Southern Medical University, China
南方医科大学热带医学研究所，南方医科大学公共卫生学院 郭祥

Please contact me by email guoxiang199399@163.com for submitting bugs.
如发现运行bug，请通过邮箱 guoxiang199399@163.com 联系我