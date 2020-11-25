setwd("~/1091行動商務與網路服務")
# 2020.11.19
text <- readLines('in1.txt')
str(text)
text <- gsub(pattern='\\W',replacement=' ',text)
text <- gsub(pattern='\\d',replacement=' ',text)
text <- tolower(text)
text <- gsub(pattern='\\b[A-z]\\b{1}',text)
library(tm)
stopwords()
text <- removeWords(text,stopwords())
text <- stripWhitespace(text)
#str
#paste與 collapse 參數
#gsub
#install.packages('tm')
#library(tm)
#tolower
#stopwords
#removeWords
#stripWhitespace

