setwd("C:/1021/youbike")
library('jsonlite')
#ubikeNTP='youbike.csv'
#download.file('https://quality.data.gov.tw/dq_download_csv.php?nid=123026&md5_url=4d8de527a0bcd8a7b1aeae91120f021d',ubikeNTP)
#ubike <-  read.csv(ubikeNTP,header=T,fileEncoding = 'UTF-8',stringsAsFactors = F)
# New Taipei City Youbike
ubike.json <- 'youbike.json'
download.file('https://quality.data.gov.tw/dq_download_json.php?nid=123026&md5_url=4d8de527a0bcd8a7b1aeae91120f021d',ubike.json)
ubike <- fromJSON(ubike.json)
ubike$tot <- as.numeric(ubike$tot) 
x <- table(ubike$sarea)
sort(x)
a <- sort(x,decreasing = T)
b <- as.data.frame(a)
names(b) <- c('Area','Count')
write.csv(b,file="NTP.csv",fileEncoding = "UTF-8",row.names = F)
sum(b$Count)
boxplot(b$Count)


library(dplyr)
ubike$tot <- as.numeric(ubike$tot) 
c <- ubike %>%
  group_by(sarea) %>%
  summarise(across(tot, sum)) %>%
  arrange(desc(tot))

boxplot(c$tot)

#[How to sum a variable by group](https://stackoverflow.com/questions/1660124/how-to-sum-a-variable-by-group)

DF <-  data.frame(Categ1=factor(c('A','A','B','B','A','B','A')),
             Categ2=factor(c('X','Y','X','X','X','Y','Y')),
             Samples=c(1,2,4,3,5,6,7),
             Freq=c(10,30,45,55,80,65,50))

DF %>% group_by(Categ1,Categ2) %>% summarise(across(Freq, sum))

# Taipei Youbike
install.packages('data.table')
library(data.table)
download.file("https://tcgbusfs.blob.core.windows.net/blobyoubike/YouBikeTP.json",ubike.json)
ubike <- fromJSON(ubike.json)
ubike <- rbindlist(ubike$retVal)
y <- table(ubike$sarea)
sort(y)
sort(y,decreasing = T)

