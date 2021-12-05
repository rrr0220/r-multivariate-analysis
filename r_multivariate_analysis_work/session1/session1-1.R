
#データの読み込み
jhk = read.csv("~/R_Multivariate_Analysis0726/第01章/人事評価結果.csv", fileEncoding = "shift-jis")

#データの確認
dim(jhk)
colnames(jhk)
head(jhk, 3)

