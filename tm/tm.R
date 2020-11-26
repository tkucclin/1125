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
poswords1 <- readLines('positive-words.txt')
identical(poswords,poswords1)
textbag <- unlist(str_split(text,'\\s+'))
negwords <- readLines('negative-words.txt')
textbag[!is.na(match(textbag,poswords))]
sum(!is.na(match(textbag,poswords)))
sum(!is.na(match(textbag,negwords)))

wordcloud(textbag)
wordcloud(textbag,random.order = T,scale = c(3,0.5), colors = rainbow(8))
    