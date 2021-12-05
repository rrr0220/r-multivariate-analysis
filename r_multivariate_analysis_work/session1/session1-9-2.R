
#関数effectd2の読み込み
effectd2 = function(x1, x2, clevel=0.95){
  library(MBESS)
  #標本サイズの算出
  n = length(x1-x2)
  #差異の平均v.barの算出
  v.bar = mean(x1-x2)
  #差異の不偏分散の平方根svの算出
  sv.p = sd(x1-x2)
  #効果量の算出
  d.p = v.bar/sv.p 
  #対応のあるt検定の実行と自由度の算出
  rest = t.test(x1, x2, paired=TRUE)
  #効果量の信頼区間の算出
  resconf = conf.limits.nct(t.value=rest$statistic, df=rest$parameter, conf.level=clevel)
  ll = resconf$Lower.Limit/sqrt(n)
  ul = resconf$Upper.Limit/sqrt(n)
  u3 = pnorm(d.p, 0, 1)
  return(list=c(効果量=d.p, 信頼水準=clevel, 区間下限=ll, 区間上限=ul, U3=u3))
}

#対応のあるt検定における効果量の算出
effectd2(jhk$総合, jhk$昨年総合, clevel=0.95)




