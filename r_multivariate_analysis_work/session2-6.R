
#マージ
datA = read.csv("~/R_Multivariate_Analysis0726/第02章/マージデータA.csv", fileEncoding = "shift-jis")
datB = read.csv("~/R_Multivariate_Analysis0726/第02章/マージデータB.csv", fileEncoding = "shift-jis")
datA
datB

merge(datA, datB, by="ID")
merge(datA, datB, by="ID", all=TRUE)



