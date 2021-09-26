
#相関係数の信頼区間
corkekka2 = corr.test(jhk[, kjs], alpha=0.05)
print(corkekka2, short=FALSE)

#クラメールの連関係数Vの信頼区間
#関数effectvの読み込み
effectv = function(x, y, clevel=0.95){
  library(vcd)
  library(MBESS)
  #クロス集計表の算出
  tmpcross = table(x, y)
  #標本サイズの算出
  n = sum(tmpcross)
  #集計表の行数と列数を算出
  size = dim(tmpcross)
  #自由度を算出
  dof = prod(size-1)
  #カイ2乗値と連関係数の算出
  resas = assocstats(tmpcross)
  chi = resas$chisq_tests["Pearson", "X^2"]
  v = resas$cramer
  #カイ2乗値を所与としたときの非心度の上限値、下限値を算出
  resconf = conf.limits.nc.chisq(Chi.Square=chi, df=dof, conf.level=clevel)
  
  if(resconf$Lower.Limit>0){  #下限値が0を超える領域に入った場合
    #信頼区間の下限・上限の算出
    ll = sqrt((dof+resconf$Lower.Limit)/((min(size)-1)*n))
    ul = sqrt((dof+resconf$Upper.Limit)/((min(size)-1)*n))
    return(list=c(効果量V=v, カイ2乗値=chi, 信頼水準=clevel, 区間下限=ll, 区間上限=ul))
  }
  else if(resconf$Lower.Limit==0){  #下限値が負値の場合（λ=0に固定される）
    #信頼区間の下限を0に制約したうえで上限を算出
    resconf = conf.limits.nc.chisq(Chi.Square=chi, df=dof, conf.level=NULL,
                                   alpha.lower=0, alpha.upper=(1-clevel)/2)
    ul = sqrt((dof+resconf$Upper.Limit)/((min(size)-1)*n))
    return(list=list(
      "下限値が負値になったので信頼区間の下限値を0にしました。",
      c(効果量V=v, カイ2乗値=chi, 信頼水準=clevel, 区間下限=0, 区間上限=ul))
      )
  }
}

#連関係数の信頼区間
effectv(jhk$年代, jhk$部署, clevel=0.95)


