
# session3-2 --------------------------------------------------------------

csdat = read.csv("~/R_Multivariate_Analysis0726/第03章/顧客満足度データ.csv", fileEncoding = "shift-jis")
head(csdat)
str(csdat)

# 重回帰分析の実行
res1 = lm(顧客数~立地満足度+設備満足度+店舗面積満足度+トレーナー満足度, data=csdat)
summary(res1)

# 多重共線性のチェック
cor(csdat$トレーナー満足度, csdat$トレーナー数)

# 説明変数間の相関が高い場合の重回帰分析の出力
# 単回帰分析
resm1 = lm(顧客数~トレーナー満足度, data=csdat)
summary(resm1)

# 重回帰分析
resm2 = lm(顧客数~トレーナー満足度+トレーナー数, data=csdat)
summary(resm2)

# VIFの算出例
library(car)
vif(resm2)

# 顧客満足度の4変数に関するVIFの算出
vif(res1)


# session3-3 --------------------------------------------------------------

# 切片と偏回帰係数の信頼区間の算出
confint(res1, level=0.95)

# 標準回帰係数の算出
scsdat = as.data.frame(scale(csdat))
head(scsdat)

# 標準回帰係数の推定
res2 = lm(顧客数~立地満足度+トレーナー数, data=scsdat)
summary(res2)


# session3-5 --------------------------------------------------------------

# 質的変数も含めた重回帰分析
res3 = lm(顧客数~立地満足度+設備満足度+店舗面積満足度+トレーナー満足度+接客研修+入会特典, data=csdat)
summary(res3)


# session3-6 --------------------------------------------------------------

# AICの算出
extractAIC(res1)
extractAIC(res3)

# BICの算出
extractAIC(res1, k=log(30))
extractAIC(res3, k=log(30))






