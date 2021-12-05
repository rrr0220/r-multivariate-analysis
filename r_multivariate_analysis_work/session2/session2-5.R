
#sortによる1変数のソート
score = c(1, 5, 2, 10, 8, 2, 1, 4, 3, 3)
sort(score, decreasing=FALSE)
sort(score, decreasing=TRUE)

#orderによるソートされた行番号の取得
sdat = read.csv("~/R_Multivariate_Analysis0726/第02章/ソートデータ.csv", fileEncoding = "shift-jis")
sdat
str(sdat)

posi = order(sdat$協調性)
posi
sdat[posi,]

posi2 = order(sdat$協調性, decreasing=TRUE)
posi2
sdat[posi2,]

#複数変数によるデータフレームのソート
posi3 = order(sdat$協調性, sdat$総合)
sdat[posi3,]
