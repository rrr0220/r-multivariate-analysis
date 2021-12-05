
#固定長データのハンドリング
itemresp = readLines("~/R_Multivariate_Analysis0726/第02章/項目反応固定長.txt")
itemresp

#変数位置情報の作成
spoint = c(1, seq(7, 11, 1))
epoint = c(6, seq(7, 11, 1))
spoint
epoint

#変数の作成
raw0 = sapply(itemresp, substring, spoint, epoint)
raw0
class(raw0)

#行列の整形
dimnames(raw0)[[1]] = 1:6
dimnames(raw0)[[2]] = 1:5

dimnames(raw0) = list(seq(1, 6, 1), NULL)
dimnames(raw0) = list(NULL, seq(1, 5, 1))

rownames(raw0) = seq(1, 6, 1)
colnames(raw0) = seq(1, 5, 1)

dimnames(raw0) = NULL
raw0

raw1 = t(raw0)
raw1

colnames(raw1) = c("ID", paste("問", 1:5, sep=""))
raw1


#正誤データへの変換
key = read.csv("~/R_Multivariate_Analysis0726/第02章/key.txt", fileEncoding = "shift-jis")
key
key[, 1]

#正答を1、誤答を0に変換
bimat = sweep(raw1[, -1], 2, key[, 1], FUN="==") * 1
bimat







