
#置換を行うデータ
vec = c(2, 3, 4, 5, 1, 2, 3, 1, 2)
tmat = matrix(vec, ncol=3)
tmat

tmat2 = matrix(vec, nrow=3)
tmat2

?matrix
tmat3 = matrix(vec, ncol=3, byrow=TRUE)
tmat3

#whichによる置換対象要素の座標の取得
loc2 = which(tmat==2, arr.ind=TRUE)
loc4 = which(tmat==4, arr.ind=TRUE)
loc2
loc4

#数値の置換
tmatc = tmat
tmatc[loc4] = 2
tmatc[loc2] = 4
tmatc
