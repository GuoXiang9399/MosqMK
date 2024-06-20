# MosqMK
A R package for analyzing unprocessed data collected by mosquito density monitoring instrument MK 300.

MosqMK是针对由南方医科大学开发的智能化蚊媒监测仪器MK300及相关产品等开发的集“数据整理”模块、“数据可视化”模块和“数据报告”模块工作流为一体的R包

## Installation 安装

安装MosqMK包可通过devtools工具，流程参考如下：

```
library(devtools)
install_github('GuoXiang9399/MosqMK')
```

MosqMK依赖的R包包括readxl, fs, lubridate, tidyr, dplyr, ggplot2, cowplot

加载MosqMK包和依赖的R包如下：

```
library(readxl)
library(fs)
library(lubridate)
library(tidyr)
library(dplyr)
library(ggplot2)
library(cowplot)
library(MosqMK)
```  



## Usage 使用 -- 数据整理模块

1) 函数MK_Data_Collect

可以批量汇总指定文件夹下的MK300原始导出数据

如下图demo文件夹下的多个原始数据文件

<img src="www/demo_files.png" width="100%" style="display: block; margin: auto;" />

使用函数MK_Data_Collect，第一个参数为文件夹路径（Demo），第二个参数为设备ID（用户自己设定，如1223700001264）

```
all_data <- MK_Data_Collect("Demo","1223700001264")
```

汇总后得到的all_data我们预览如下

<img src="www/clean_data.png" width="100%" style="display: block; margin: auto;" />

2) MK_Data_Filter

MK300原始数据中可能存在个别观测时间点有异常数据过大的情况，MosqMK包建议以每小时收集15只蚊虫为限进行数据筛选

使用函数MK_Data_Filter，第一个参数为纳入的数据，第二个参数为筛选限制

```
clean_data <- MK_Data_Filter(all_data,15)
```

## Usage 使用 -- 数据可视化模块

1) MK_Plot_Raw

2) MK_Plot_Factor

```
MK_Plot_Month(clean_data)
```
<img src="www/MK_Plot_Factor.png" width="100%" style="display: block; margin: auto;" />

3) MK_Plot_Week


4) MK_Plot_Month

```
MK_Plot_Month(clean_data)
```

<img src="www/MK_Plot_Month.png" width="100%" style="display: block; margin: auto;" />

(3)数据报告模块


开放中...

##  Contributing 开发
由南方医科大学热带医学研究所，南方医科大学公共卫生学院 郭祥 开发

如发现运行bug，请通过邮箱 guoxiang199399@163.com 联系我
