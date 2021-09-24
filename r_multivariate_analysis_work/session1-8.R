
#順序カテゴリカル変数を含めたデータフレームの作成
#2値カテゴリカル変数化するための階級幅を作成する
sogoc = c(-Inf, mean(jhk$総合), Inf)
sogoc

#階級幅を利用してデータを0と1に変換する
scat = cut(jhk$総合, breaks=sogoc, right=FALSE, labels=c(0, 1))
scat

#多値カテゴリカル変数化するための階級幅を作成する
ginoc = c(-Inf, summary(jhk$技能)[c(2, 5)], Inf)
ginoc

#階級幅を利用してデータを0と1と2に変換する
gcat = cut(jhk$技能, breaks=ginoc, right=FALSE, labels=c(0, 1, 2))
gcat


#順序カテゴリカル変数を含めた相関行列の算出
#量的変数「知識」も含めてデータフレームを作成
jhk4 = data.frame(総合カテ=scat, 技能カテ=gcat, 知識=jhk$知識)

#最尤法で相関行列の算出
hetcor(jhk4, ML=TRUE)
