
#男性のデータのみ抽出する
mdat = subset(jhk, 性別=="M")
head(mdat)

mdat2 = subset(jhk, 性別!="F")
head(mdat2)

#協調性が50点未満の行を抽出する
cope1 = subset(jhk, 協調性<50)
head(cope1)


#subsetを利用しない場合の条件抽出
cond = (jhk$性別=="M")&((jhk$年代=="中堅")|(jhk$年代=="熟練"))
head(cond)

m4 = jhk[cond,]
head(m4)
