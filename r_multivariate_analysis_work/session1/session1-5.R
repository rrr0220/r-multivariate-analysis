
#相関関係の分析
#散布図の描画
gino = jhk$技能
chisiki = jhk$知識
plot(gino, chisiki, xlab="技能", ylab="知識")

#散布図行列の描画
kjs = c("協調性", "自己主張", "ストレス")
plot(jhk[, kjs])

#層別散布図の描写
xyplot(知識~技能|年代+部署, data=jhk)

#相関係数の算出
cor(jhk$協調性, jhk$ストレス)

#相関行列の算出
cor(jhk[, kjs])

#共分散行列の算出
cov(jhk[, kjs])

#相関関数の検定
corkekka = corr.test(jhk[, kjs])
corkekka$t
corkekka$p

#連関の分析
#クロス集計表の作成
cross = table(jhk$部署, jhk$年代)
cross

#クロス集計表の割合表記
prop.table(cross)
prop.table(cross, 1) #行方向
prop.table(cross, 2) #列方向

#層別クロス集計表の作成
xtabs(~部署+年代+性別, data=jhk)

#連関係数の算出
assocstats(cross)

#クロス集計表と連関係数の関係
m1 = matrix(c(50, 0, 0, 50), ncol=2)
m1

m2 = matrix(c(10, 100, 20, 200), ncol=2)
m2

assocstats(m1)
assocstats(m2)

#クロス集計表に対するχ2検定
reschisq = chisq.test(cross)
reschisq

#残差分析
reschisq$stdres





