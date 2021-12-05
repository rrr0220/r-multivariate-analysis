
# session2-13 -------------------------------------------------------------

# 顧客ID別に月ごとの総購買金額を算出
cid = posall$顧客ID
buym = substr(posall$購買日, 1, 6)
# resmat = tapply(vector, index, function)
resmat = tapply(posall$購買金額, list(cid, buym), sum)

# 該当データが存在せず、NAとなっている部分に0を代入する
resmat[is.na(resmat)] = 0
head(resmat)


# session2-14 -------------------------------------------------------------

# ベクトルxに対して、その要素が1以上の場合に、その要素名を返す
res2 = apply(t1, 1, function(x){names(which(x >= 1))})
head(res2)


?sweep
