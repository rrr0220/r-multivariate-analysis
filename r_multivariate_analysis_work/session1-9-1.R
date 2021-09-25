
#関数effectd1の読み込み
effectd1 = function(x1, x2, clevel=0.95){
  library(MBESS)
  #各群の標本サイズの算出
  n1 = length(x1); n2 = length(x2)
  #各群の平均の算出
  m1 = mean(x1); m2 = mean(x2)
  #各群の標本標準偏差の算出
  s1 = sqrt(mean((x1-m1)**2)); s2 = sqrt(mean((x2-m2)**2))
  #母標準偏差の推定値の算出
  sast = sqrt(((n1*s1**2)+(n2*s2**2))/(n1+n2-2))
  #効果量の算出
  d = (m1-m2)/sast
  #独立な2群のt検定の実行（等分散仮定）と自由度の算出
  rest = t.test(x1, x2, paired=FALSE, var.equal=TRUE)
  #効果量の信頼区間の算出
  resconf = conf.limits.nct(t.value=rest$statistic, df=rest$parameter, conf.level=clevel)
  ll = resconf$Lower.Limit*sqrt((n1+n2)/(n1*n2))
  ul = resconf$Upper.Limit*sqrt((n1+n2)/(n1*n2))
  u3 = pnorm(d, 0, 1)
  return(list=c(効果量=d, 信頼水準=clevel, 区間下限=ll, 区間上限=ul, U3=u3))
}

#独立な2群のt検定に対応した効果量の算出
fdat = jhk$協調性[jhk$性別=="F"]
mdat = jhk$協調性[jhk$性別=="M"]
effectd1(fdat, mdat, clevel=0.95)

?conf.limits.nct
?pnorm　#確率変数を受け、確率（-Inf ~ 確率変数）を返す
