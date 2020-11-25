s <- readLines('in1.txt')
s[1]
x=strsplit(s,' ')
str(x)
x[[1]]
x[[1]][2]
y=unlist(x)
length(y)
y <- tolower(y)
z <- removeWords(y,stopwords())
nchar(z)>0
z1 <- z[nchar(z)>0]
gsub('\\W','',z1)
tolower(y)
length(z)
install.packages('tm')
install.packages('stringr')
install.packages('wordcloud')
library(tm)
library(stringr)
library(wordcloud)
stopwords()

poswords <- scan('postive-words.txt',what='character')
poswords1 <- readLines('postive-words.txt')
identical(poswords,poswords1)
negwords <- readLines('negative-words.txt')
sum(!is.na(match(z1,poswords)))
sum(!is.na(match(z1,negwords)))
wordcloud(z1)
wordcloud(z1,random.order = T,scale = c(3,0.5), colors = rainbow(8))
    