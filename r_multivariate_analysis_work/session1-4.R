
#列（変数）に対する基礎集計
varname = c("協調性", "自己主張", "技能", "知識")
jhk2 = jhk[, varname]
apply(jhk2, 2, mean)
apply(jhk2, 2, sd)

#行（観測対象）に対する基礎集計
apply(jhk2, 1, sum)
apply(jhk2, 1, sd)

#多変数の分布を群間で比較
by(jhk2, jhk$性別, apply, 2, mean)
by(jhk2, jhk$性別, apply, 2, sd)

#標準化の手続き
zscore = scale(jhk2)
head(zscore, 2)

tscore = zscore * 10 + 50
head(tscore)
