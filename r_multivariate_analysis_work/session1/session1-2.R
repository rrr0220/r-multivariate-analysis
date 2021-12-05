
#histogramによるヒストグラムの描画
histogram(~ストレス, data=jhk, breaks=20, type='count')

#代表値の算出
mean(jhk$ストレス)
median(jhk$ストレス)
sort(table(jhk$年代))

#散布度の算出
sd(jhk$ストレス)
var(jhk$ストレス)

#中央値からの平均偏差の算出
mean(abs(jhk$ストレス-median(jhk$ストレス)))
