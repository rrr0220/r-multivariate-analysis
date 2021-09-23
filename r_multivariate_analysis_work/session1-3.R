
#群別にヒストグラムを描画
histogram(~協調性|年代+性別, data=jhk, breaks=15)

#群間での分布比較
tapply(jhk$協調性, jhk$性別, mean)
tapply(jhk$協調性, jhk$性別, sd)

#箱ヒゲ図の描画
boxplot(jhk$技能)
boxplot(jhk$技能, horizontal=TRUE)
boxplot(協調性~性別, data=jhk, horizontal=TRUE)

#四分位数を含めた要約統計量の算出
summary(jhk$技能)
boxplot(jhk$技能, horizontal=TRUE)
histogram(~技能, data=jhk, breaks=20, type='count')

#等分散性に関するF検定
var.test(協調性~性別, data=jhk)

#独立な2群のt検定（等分散を仮定）
t.test(協調性~性別, data=jhk, var.equal=TRUE)

#Welch法によるt検定
t.test(協調性~性別, data=jhk)

#対応のあるt検定
score = c(jhk$総合, jhk$昨年総合)
year = c(rep("今年", 800), rep("昨年", 800))
t.test(score~year, paired=TRUE)

#群ごとに信頼区間を描画
plotmeans(協調性~性別, data=jhk, p=0.95, ylim=c(49, 54))

#信頼区間の算出
t.test(jhk$協調性[jhk$性別=="F"])
t.test(jhk$協調性[jhk$性別=="M"])
t.test(jhk$協調性[jhk$性別=="F"], conf.level = 0.99)
t.test(jhk$協調性[jhk$性別=="M"], conf.level = 0.99)
