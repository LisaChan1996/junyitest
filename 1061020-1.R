RE <- read.table("D:/cadata.dat.txt",header=T)
nmissing <- sum(complete.cases(RE)) #檢查遺失值
#RE1 <-na.omit(RE)#檢查遺失值
r1 <- range(RE$MedianHouseValue)#全距
r1

q1 <- quantile(RE$MedianHouseValue)#4分位距
q1

?quantile

q2 <- quantile(RE$MedianHouseValue,probs=0:4/4) #設定切的地方
q3 <- quantile(RE$MedianHouseValue,probs=0:10/10)
q4 <- quantile(RE$MedianHouseValue,probs=0.5)
median(RE$MedianHouseValue)

#分組
x <- rnorm(100) 
c0 <- cut(x,breaks = c(-2,0,1,2))#分3個區間(-2,0)(0,1)(1,2)
c1 <- cut(x,breaks = seq(-5,5,2),include.lowest = T) #-5到5 by 2 #include.lowest左邊變閉區間
levels(c0) <- c("s","m","l")
table(c0)

#
HC <- cut(RE$MedianHouseValue,breaks=quantile(RE$MedianHouseValue),include.lowest = T)
levels(HC) <- c("l","m","h","ve")
table(HC)
mean(RE$MedianHouseValue[HC=="l"])
mean(RE$MedianHouseValue[HC=="m"])
mean(RE$MedianHouseValue[HC=="h"])
mean(RE$MedianHouseValue[HC=="ve"])

plot(RE[,c(9,8)],col=2,pch=16)

#把收入分低中高 算各個的平均值
INC <- cut(RE$MedianIncome,breaks=quantile(RE$MedianIncome,probs = 0:3/3),include.lowest = T)#切3塊
levels(INC) <- c("l","m","h")
mean(RE$MedianHouseValue[INC=="l"])
mean(RE$MedianHouseValue[INC=="m"])
mean(RE$MedianHouseValue[INC=="h"])


aggregate(RE$MedianHouseValue,list(INC),FUN=mean)#所有INC分類一起算
aggregate(RE$MedianHouseValue,list(INC),FUN=median)
aggregate(RE$MedianHouseValue,list(INC),FUN=range)

#
n1 <- 1:10
age1 <- rep("hage",10)
L1 <- paste(age1,n1,sep = "")

#把屋齡分10類算出房價中位數
AC <- cut(RE$MedianHouseAge,breaks=quantile(RE$MedianHouseAge,probs = 0:10/10),include.lowest = T)
levels(AC) <- L1
aggregate(RE$MedianHouseValue,list(AC),FUN=median)

##
