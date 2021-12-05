

# session2-9 --------------------------------------------------------------

#フォルダ内のファイルの確認
fname = dir("~/R_Multivariate_Analysis0726/第02章/POSフォルダ")
fname

fname2 = paste("~/R_Multivariate_Analysis0726/第02章/POSフォルダ", fname, sep="/")
fname2

#ID-POSデータの一例
pos0 = read.csv("~/R_Multivariate_Analysis0726/第02章/POSフォルダ/201301.csv", fileEncoding = "shift-jis")
head(pos0, 3)  
str(pos0)

#複数のデータを一度に読み込む
# tmp = lapply(fname, read.csv, stringsAsFactors=FALSE)
tmp = lapply(fname2, function(i){read.csv(i, fileEncoding = "shift-jis")})
str(tmp[[1]])
str(tmp[[2]])

#複数のデータフレームを縦に繋げる
posall = do.call(rbind, tmp)
str(posall)
?do.call

#Factor型への変換
locv = c("顧客ID", "店舗", "商品カテゴリ")
posall[, locv] = lapply(posall[, locv], as.factor)
str(posall)

posall$商品カテゴリ = factor(posall$商品カテゴリ, levels=paste("C", 1:30, sep=""))
table(posall$商品カテゴリ)
str(posall)



# sesseion2-10 ------------------------------------------------------------



#「顧客ID」によるソート
tmploc = order(posall$顧客ID, posall$購買日, posall$購買時間)
pos = posall[tmploc,]
head(pos)







