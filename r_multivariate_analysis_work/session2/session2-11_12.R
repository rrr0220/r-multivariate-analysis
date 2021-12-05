# Ctrl＋Shift＋R　セクションの挿入
# Ctrl＋Shift＋C　コメント化

# session2-11 -------------------------------------------------------------

# RFM分析
# 顧客IDごとに最新購買日を求める
R = tapply(posall$購買日, posall$顧客ID, max)
R

# 顧客IDごとに総購買回数を求める
F = tapply(posall$顧客ID, posall$顧客ID, length)
F

# 顧客IDごとに総購買金額を求める
M = tapply(posall$購買金額, posall$顧客ID, sum)
M

# R、F、Mをデータフレームとして統合
rfm = data.frame(R=R, F=F, M=M)

# 優先順位をM＞F＞Rとして降順にソート
tmploc2 = order(rfm$M, rfm$F, rfm$R, decreasing=TRUE)
rfm2 = rfm[tmploc2,]

rfm2[1:7,]


# session2-12 -------------------------------------------------------------

# 全体
t1 = table(posall$顧客ID, posall$商品カテゴリ)
t1

# 店舗別
t2 = xtabs(~顧客ID+商品カテゴリ+店舗, data=posall)
t2

# 購買日別
t3 = xtabs(~顧客ID+商品カテゴリ+購買日, data=posall)
t3

# データ全体のクロス集計表の行数と列数を求める
dim(table(posall[, c("顧客ID", "商品カテゴリ")]))

# 店舗Aにおけるクロス集計表の行数と列数を求める
storeA = subset(posall, 店舗=="A")
dim(table(storeA[, c("顧客ID", "商品カテゴリ")]))

















