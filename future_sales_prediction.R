install.packages("dplyr")
install.packages("magrittr")
install.packages("lubridate")
install.packages("ggplot2")
install.packages("ggthemes")
install.packages("gridExtra")
install.packages("caret")
install.packages("reader")
install.packages("datasets")
install.packages("data.table")
install.packages("corrplot")




library(dplyr)
library(magrittr)
library(lubridate)
library(ggplot2)
library(ggthemes)
library(caret)
library(data.table)
library(reader)
library(datasets)


# import data
calendar <- read.csv("C:/Users/Eric/Desktop/capstone/data.sales/calendar.csv",header = T,sep = ',')
saledata <- read.csv("C:/Users/Eric/Desktop/capstone/data.sales/sales_train_v2.csv",header = T,sep = ',')
shops <- read.csv("C:/Users/Eric/Desktop/capstone/data.sales/shops-translated.csv",header = T,sep = ',')
items <- read.csv("C:/Users/Eric/Desktop/capstone/data.sales/items-translated.csv",header = T,sep = ',')
item.categories <- read.csv("C:/Users/Eric/Desktop/capstone/data.sales/item_categories-translated.csv",header = T,sep = ',')
item.categories1 <- read.csv("C:/Users/Eric/Desktop/capstone/data.sales/item_categories.csv",header = T,sep = ',')
items1 <-read.csv("C:/Users/Eric/Desktop/capstone/data.sales/items.csv",header = T,sep = ',')

head(saledata)
head(shops)
head(items)
head(items1)
head(item.categories)
head(calendar)
#translated data missed item_id. add item_id from russian
items2 <-merge(items,items1, by ="item_id")

items2$item_name <- NULL

head(items2)

#merged master data and shops data
salesdata1<-merge(saledata, shops, by = "shop_id")
head(salesdata1)

#merged master data and items data 
salesdata2<-merge(salesdata1,items2, by="item_id")
head(salesdata2)


#merged masterdata and item.category data
salesdatafinal <- merge(salesdata2,item.categories, by ="item_category_id")
head(salesdatafinal)

#changed column names 
colnames(salesdatafinal)[8]<-"shop_name"
colnames(salesdatafinal)[9]<-"item_name"
colnames(salesdatafinal)[10]<-"item_category_name"

#add columns each date, year, month and day
salesdatafinal$date<-dmy(salesdatafinal$date)
salesdatafinal$year<-year(salesdatafinal$date)
salesdatafinal$month<-month(salesdatafinal$date)
salesdatafinal$day<-day(salesdatafinal$date)

#checking any n/a or missing values in dataset 
colSums(is.na(salesdatafinal))
colSums(salesdatafinal=='')


#navigated master data 
head(salesdatafinal)
str(salesdatafinal)
summary(salesdatafinal)

glimpse(salesdatafinal)

#grouped by numeric datas for checking relationships  
monthlysales<-salesdatafinal %>%
  group_by(date_block_num, shop_id,item_id,item_category_id,item_price) %>%
  summarise(month_sale=sum(item_cnt_day))

summary(monthlysales)

cor(monthlysales)

library(corrplot)

#checked relationships shops, items and monthly sales
# monthly sales are not dirrectly related with shop and items. 
plot <- cor(monthlysales)
corrplot(plot,type = "full")

#most selling item_category
salesdatafinal%>%
  group_by(item_category_name) %>%
  summarise(count = n()) %>%
  arrange(desc(count))


#most selling shop name 

salesdatafinal %>%
  group_by(shop_name) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

#most selling items. 
salesdatafinal %>%
  group_by(item_name) %>%
  summarise(count = n()) %>%
  arrange(desc(count))








