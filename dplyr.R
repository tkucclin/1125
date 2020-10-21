install.packages("dplyr")
library(dplyr)
strawhat <- data.frame(
  name = c("Monkey D. Luffy", "Roronoa Zoro", "Nami", "Usopp", "Vinsmoke Sanji",
           "Tony Tony Chopper", "Nico Robin", "Franky", "Brook"),
  gender = c("Male", "Male", "Female", "Male", "Male", "Male", "Female", "Male",
             "Male"),
  age = c(19, 21, 20, 19, 21, 17, 30, 36, 90),
  height = c(174, 181, 170, 176, 180, 90, 188, 240, 277),
  stringsAsFactors = FALSE
)
strawhat1 <- data.frame(
  name = c("Monkey D. Luffy", "Roronoa Zoro", "Nami", "Usopp", "Vinsmoke Sanji",
           "Tony Tony Chopper", "Nico Robin", "Franky", "Brook"),
  gender = c("Male", "Male", "Female", "Male", "Male", "Male", "Female", "Male",
             "Male"),
  age = c(19, 21, 20, 19, 21, 17, 30, 36, 90),
  height = c(174, 181, 170, 176, 180, 90, 188, 240, 277),
  stringsAsFactors = T
)
View(strawhat)
#篩選女性船員
#dplyr 使用 filter 函數、base R 使用原生中括號
# dplyr::filter() ---------
strawhat %>%
  filter(gender == "Female")
# base R ------------------
strawhat[strawhat$gender == "Female", ]
a[y,x]
#新增兩年前的年紀
#dplyr 使用 mutate 函數、base R 直接將衍生變數的算式指派給新變數。
# dplyr::mutate() ---------
strawhat %>%
  mutate(age_before = age - 2)

strawhat$age_before <- strawhat$age - 2
strawhat
#以身高遞減排序
#dplyr 使用 arrange 函數、base R 則以 order 函數取得觀測值順序後以原生中括號擺放位置。
# dplyr::arrange() --------
strawhat %>%
  arrange(desc(height))
# base R ------------------
strawhat[rev(order(strawhat$height)), ]
#摘要平均年齡
#dplyr 使用 summarise 函數、base R 直接對變數計算。
# dplyr::summarise() ------
strawhat %>%
  summarise(avg_age = mean(age))
# base R ------------------
avg_age <- mean(strawhat$age)
avg_age
#分性別摘要平均年齡
#dplyr 使用 group_by 函數、base R 則使用 aggregate 函數。
# dplyr::group_by() -------
strawhat %>%
  group_by(gender) %>%
  summarise(avg_age = mean(age))
# base R ------------------
aggregate(strawhat$age, by = list(strawhat$gender), FUN = mean)