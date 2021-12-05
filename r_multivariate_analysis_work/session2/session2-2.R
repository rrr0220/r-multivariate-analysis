
#データフレームの構造の表示
jhk = read.csv("~/R_Multivariate_Analysis0726/第01章/人事評価結果.csv")
str(jhk)

#実数型の確認
#「総合平均」をデータフレームに追加
jhk$総合平均 = apply(jhk[, 10:11], 1, mean)
str(jhk)

#度数分布表
score = c(1, 5, 2, 10, 8, 2, 1, 4, 3, 3)
table(score)

#Factor型への変換と度数分布表
#関数factorによって変換
fscore = factor(score, levels=seq(0, 10, 1))

#構造の把握
str(fscore)

#度数分布表
table(fscore)

table(jhk$年代)
jhk$年代 = factor(jhk$年代, levels=c("若手", "中堅", "熟練"))
str(jhk)


