s <- readLines('in1.txt')
s[1]
x=strsplit(s,' ')
x[[1]]
x[[1]][2]
unlist(x)
install.packages('tm')
library(tm)
