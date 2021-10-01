
#欠損箇所が空白の場合
kesson = read.csv("~/R_Multivariate_Analysis0726/第02章/欠損データ.csv")
kesson

#欠損箇所が数値の場合
kesson2 = read.csv("~/R_Multivariate_Analysis0726/第02章/欠損データ2.csv")
kesson2

#na.stringsで欠損値を指定
kesson3 = read.csv("~/R_Multivariate_Analysis0726/第02章/欠損データ.csv", na.strings=c(999, 9999))
kesson3

#na.omitによる完全データの作成
kanzen = na.omit(kesson3)
kanzen

#NAのない行番号を取得する
cind = complete.cases(kesson3)
cind

kanzen2 = kesson3[cind,]
kanzen2
