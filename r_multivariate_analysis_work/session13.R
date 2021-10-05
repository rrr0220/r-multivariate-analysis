
# session13-1 -------------------------------------------------------------

# 3重クロス集計表
b3dat = read.csv("~/R_Multivariate_Analysis0726/第13章/自転車データ3.csv", row.names=1, fileEncoding = "shift-jis")
head(b3dat)
str(b3dat)

# 3重クロス集計表の作成
xtabs(~メーカー+ブランド力+技術力, data=b3dat)


# session13-2 -------------------------------------------------------------

b2dat = read.csv("~/R_Multivariate_Analysis0726/第13章/自転車データ2.csv", row.names=1, fileEncoding = "shift-jis")
head(b2dat)
str(b2dat)

# コレスポンデンス分析の実行
library(FactoMineR)
resb2dat = CA(b2dat)

# 固有値の出力
resb2dat$eig

# 行スコアと列スコアの出力
resb2dat$row$coord
resb2dat$col$coord

summary(resb2dat)


# session13-4 -------------------------------------------------------------

# メーカーのクラスター分析
# 列方向にz得点化
z = scale(b2dat)

# 平方ユークリッド距離
D0 = dist(z, method="euclidean")
D = (1/2) * D0 ** 2

# 階層的クラスター分析
resclust = hclust(D, method="ward.D")
plot(resclust)

# クラスターの解釈
# クラスター番号の取得
clus = cutree(resclust, k=2)
clus

b2dat$cluster = clus
# クラスター別の平均値の算出
by(b2dat[, -6], b2dat$cluster, apply, 2, mean)


# session13-5 -------------------------------------------------------------

# 多重コレスポンデンス分析
# データ行列の変換
library(dummies)
db3dat = dummy.data.frame(b3dat, sep=":")
head(db3dat)

# 関数CAによる（多重）コレスポンデンス分析の実行
resdb3dat = CA(db3dat)
# 固有値出力
resdb3dat$eig

# 列カテゴリのみをプロット
plot(resdb3dat, invisible="row")
plot(resdb3dat, invisible="col")


# 関数MCAによる多重コレスポンデンス分析の実行
resb3dat = FactoMineR::MCA(b3dat)

# 多重クロス集計表の作成
crosb3dat = xtabs(~メーカー+ブランド力+コスパ+技術力+レース実績+デザイン, data=b3dat)
crosb3dat

# データフレームへの変換
crosdf = as.data.frame(crosb3dat)
head(crosdf)
nrow(crosdf)

# 度数が0のセルを除外
crosdf2 = crosdf[which(crosdf[, 7]>=1),]
head(crosdf2)
nrow(crosdf2)

# 関数MCAによる多重コレスポンデンス分析の実行(2)
rescrosdf2 = FactoMineR::MCA(crosdf2, quanti.sup=7, row.w=crosdf2$Freq)








