

# session4-2 --------------------------------------------------------------

sts = read.csv("~/R_Multivariate_Analysis0726/第04章/ストレス.csv", fileEncoding = "shift-jis")
head(sts)
str(sts)

# ステップ1の回帰分析

res1 = lm(バーンアウト2~バーンアウト1, data=sts)
summary(res1)

# ステップ2の回帰分析

res2 = lm(バーンアウト2~バーンアウト1+ストレス+サポート, data=sts)
summary(res2)

# 決定係数の増分の検定
# F値の算出
((0.4168-0.4039)/(3-1))/((1-0.4168)/(300-3-1))

# p値の算出
1-pf(3.273663, 2, 296)

# 関数anovaを用いた決定係数の増分の検定
anova(res1, res2)

predict(res1)
residuals(res1)

# 残差平方和
sum((residuals(res1)-mean(residuals(res1)))^2)
sum((residuals(res2)-mean(residuals(res2)))^2)
sum((residuals(res1)-mean(residuals(res1)))^2) - sum((residuals(res2)-mean(residuals(res2)))^2)

# 決定係数
sum((predict(res1)-mean(predict(res1)))^2)/sum((sts$バーンアウト2-mean(sts$バーンアウト2))^2)
sum((predict(res2)-mean(predict(res2)))^2)/sum((sts$バーンアウト2-mean(sts$バーンアウト2))^2)

# AICとBICの算出
extractAIC(res1)
extractAIC(res2)

extractAIC(res1, k=log(300))
extractAIC(res2, k=log(300))


# session4-3 --------------------------------------------------------------

# 中心化
sts$ストレス.c = sts$ストレス - mean(sts$ストレス)
sts$サポート.c = sts$サポート - mean(sts$サポート)
sts$バーンアウト1.c = sts$バーンアウト1 - mean(sts$バーンアウト1)

# 中心化前後での相関係数の確認
sts$交互作用 = sts$ストレス * sts$サポート
sts$交互作用.c = sts$ストレス.c * sts$サポート.c

# 中心化前後での相関行列
cor(sts[, c("ストレス", "サポート", "交互作用")])
cor(sts[, c("ストレス.c", "サポート.c", "交互作用.c")])

# 交互作用効果の検討
res3 = lm(バーンアウト2~バーンアウト1.c+ストレス.c+サポート.c+交互作用.c, data=sts)
summary(res3)

# 決定係数の増分の検定
anova(res2, res3)

# 標準偏回帰係数の算出
z.sts = as.data.frame(scale(sts))
# z.sts = scale(sts)

res3.z = lm(バーンアウト2~バーンアウト1.c+ストレス.c+サポート.c+交互作用.c, data=z.sts)
summary(res3.z)


# session4-4 --------------------------------------------------------------

# ソーシャルサポートが多い場合のバーンアウトに対するアウトレス経験の効果
sts$サポート.h = sts$サポート.c - sd(sts$サポート.c)

res3.h = lm(バーンアウト2~バーンアウト1.c+ストレス.c+サポート.h+ストレス.c*サポート.h, data=sts)
summary(res3.h)  

# ソーシャルサポートが少ない場合のバーンアウトに対するアウトレス経験の効果
sts$サポート.l = sts$サポート.c + sd(sts$サポート.c)

res3.l = lm(バーンアウト2~バーンアウト1.c+ストレス.c+サポート.l+ストレス.c*サポート.l, data=sts)
summary(res3.l) 

# 95%信頼区間の算出
confint(res3)


# session4-6 --------------------------------------------------------------

bsb = read.csv("~/R_Multivariate_Analysis0726/第04章/野球.csv", fileEncoding = "shift-jis")
head(bsb)

# ステップワイズ法による変数選択
library(MASS)
base = lm(年俸~1, data=bsb)
step.res = stepAIC(base, direction="both",
                   scope=list(upper=~打数+安打+本塁打+四球+死球+三振+打率))
summary(step.res)

?stepAIC
step.res2 = stepAIC(base, direction="both",
                   scope=list(upper=~打数+安打+本塁打+四球+死球+三振+打率),
                   k=log(150))
summary(step.res2)



