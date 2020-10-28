setwd("C:/1021/youbike")
library('jsonlite')
#ubikeNTP='youbike.csv'
#download.file('https://quality.data.gov.tw/dq_download_csv.php?nid=123026&md5_url=4d8de527a0bcd8a7b1aeae91120f021d',ubikeNTP)
#ubike <-  read.csv(ubikeNTP,header=T,fileEncoding = 'UTF-8',stringsAsFactors = F)
# New Taipei City Youbike
ubike.json <- 'youbike.json'
download.file('https://quality.data.gov.tw/dq_download_json.php?nid=123026&md5_url=4d8de527a0bcd8a7b1aeae91120f021d',ubike.json)
ubike <- fromJSON(ubike.json)
x <- table(ubike$sarea)
sort(x)
sort(x,decreasing = T)

# Taipei Youbike
install.packages('data.table')
library(data.table)
download.file("https://tcgbusfs.blob.core.windows.net/blobyoubike/YouBikeTP.json",ubike.json)
ubike <- fromJSON(ubike.json)
ubike <- rbindlist(ubike$retVal)
y <- table(ubike$sarea)
sort(y)
sort(y,decreasing = T)

