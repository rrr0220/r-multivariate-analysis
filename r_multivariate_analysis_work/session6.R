

# session6-2 --------------------------------------------------------------

shp = read.csv("~/R_Multivariate_Analysis0726/第06章/失敗.csv", fileEncoding = "shift-jis")
head(shp)

# モデルの記述
shp.model = '
  失敗不安~叱責
  学習意欲~励まし
  学業成績~失敗不安+学習意欲
  '

# 母数の推定
library(lavaan)
shp.fit = sem(shp.model, data=shp)

# パス解析の結果の出力
summary(shp.fit, standardized=TRUE, rsquare=TRUE)

# 信頼区間の出力
summary(shp.fit, standardized=TRUE, rsquare=TRUE, ci=TRUE)


# session6-3 --------------------------------------------------------------

# 適合度指標の出力
summary(shp.fit, standardized=TRUE, rsquare=TRUE, ci=TRUE, fit.measures=TRUE)

# 全ての適合度指標の出力
fitmeasures(shp.fit)

# 修正指標の出力
modindices(shp.fit)

# 誤差変数の間に相関を仮定したモデルの記述
shp.model2 = '
  失敗不安~叱責
  学習意欲~励まし
  学業成績~失敗不安+学習意欲
  失敗不安~~学習意欲
  '

# 誤差変数の間に相関を仮定したモデルでの母数推定
shp.fit2 = sem(shp.model2, data=shp)
summary(shp.fit2, standardized=TRUE, rsquare=TRUE, ci=TRUE, fit.measures=TRUE)


# session6-5 --------------------------------------------------------------

# 標本共分散行列の算出
shp.cov = cov(shp)

# 標本共分散行列をもとにした母数の推定
shp.cov.fit = sem(shp.model2, sample.cov=shp.cov, sample.nobs=500)
summary(shp.cov.fit, standardized=TRUE, rsquare=TRUE, ci=TRUE, fit.measure=TRUE)





