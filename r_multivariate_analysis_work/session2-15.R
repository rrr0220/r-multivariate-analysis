
# session2-15 -------------------------------------------------------------

# 来店日をdate形式に変換
# 関数as.Dateの引数として使えるように、来店日を文字列に変換
tmpdate = paste(substr(posall$購買日, 1, 4), "-",
                substr(posall$購買日, 5, 6), "-",
                substr(posall$購買日, 7, 8), sep="")
tmpdate[1:5]

# 文字列をdate形式に変換する
ndate = as.Date(tmpdate)
restime = tapply(ndate, posall$顧客ID, diff)
head(restime)

# 顧客ID別に来店間隔の分布を描写
restime2 = lapply(restime, as.numeric)
par(mfrow=c(2, 3))
lapply(restime2[1:6], hist, breaks=10, xlab="diff", main="")

# 顧客ID別に来店間隔の分布を要約
resd = lapply(restime2, describe)
resd[1:5]
