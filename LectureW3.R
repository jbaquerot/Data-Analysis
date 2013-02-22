#Examples Lecture Week 4


pdata <- read.csv("./data/ss06pid.csv")

# Exploratory Graphs 1
boxplot(pdata$AGEP, col="blue")
boxplot(pdata$AGEP ~ factor(pdata$DDRS), col="blue")
boxplot(pdata$AGEP ~ factor(pdata$DDRS), col=c("blue","orange"),
        names=c("yes", "no"), varwidth=TRUE)
barplot(table(pdata$CIT), col="blue")

hist(pdata$AGEP, col="blue")

hist(pdata$AGEP, col="blue", breaks=100, main="Age")

dens <- density(pdata$AGEP)
plot(dens, lwd=3, col="blue")

dens <- density(pdata$AGEP)
densMales <- density(pdata$AGEP[which(pdata$SEX==1)])
plot(dens, lwd=3, col="blue")
lines(densMales, lwd=3, col="orange")

# Exploratory Graphs 2
plot(pdata$JWMNP,pdata$WAGP, pch=19, col="blue")
plot(pdata$JWMNP,pdata$WAGP, pch=19, col="blue", cex=0.5)
plot(pdata$JWMNP,pdata$WAGP, pch=19, col=pdata$SEX, cex=0.5)

percentMaxAge <- pdata$AGEP/max(pdata$AGEP)
plot(pdata$JWMNP,pdata$WAGP, pch=19, 
     cex=0.5*percentMaxAge)

plot(pdata$JWMNP,pdata$WAGP, pch=19, col="blue")
lines(rep(100, dim(pdata)[1]), pdata$WAGP, col="grey",lwd=5)
points(seq(0,200,length=100), seq(0,20e5,length=100),
       col="red", pch=19)

library(Hmisc)
ageGroups <- cut2(pdata$AGEP,g=5)
plot(pdata$JWMNP,pdata$WAGP, pch=19, col=ageGroups, cex=0.5)

x<-rnorm(1e5)
y<-rnorm(1e5)
plot(x,y,pch=19)

sampledValues <- sample(1:1e5, size=1000, replace=FALSE)
plot(x[sampledValues], y[sampledValues], pch=19)

smoothScatter(x,y)

install.packages("hexbin")
library(hexbin)
hbo <- hexbin(x,y)
plot(hbo)

x <- rnorm(20); y<-rnorm(20)
qqplot(x,y)
abline(c(0,1))

X <- matrix(rnorm(20*5), nrow=20)
matplot(X, type="b")

image(1:10, 161:236, as.matrix(pdata[1:10, 161:236]))

newMatrix <- as.matrix(pdata[1:10, 161:236])
newMatrix <- t(newMatrix)[,nrow(newMatrix):1]
image(161:236, 1:10, newMatrix)

install.packages("maps")
library(maps)
map("world")
lat <- runif(40,-180,180); lon <- runif(40,-90,90)
points(lat,lon,col="blue",pch=19)


x <- c(NA,NA,NA,4,5,6,7,8,9,10)
y <- 1:10
plot(x,y, pch=19, xlim=c(0,11), ylim=c(0,11))

x <- rnorm(100)
y <- rnorm(100)
y[x < 0] <- NA
boxplot(x ~ is.na(y))

# Exploratory Graphs

plot(pdata$JWMNP,pdata$WAGP,pch=19,col="blue",cex=0.5,
     xlab="Travel time (min)",
     ylab="Last month wages (dollars)")

plot(pdata$JWMNP,pdata$WAGP,pch=19,col="blue",cex=0.5,
     xlab="Travel time (min)",
     ylab="Last month wages (dollars)",
     cex.lab=2,
     cex.axis=1.5)

plot(pdata$JWMNP,pdata$WAGP,pch=19,col="blue",cex=0.5,
     xlab="TT (min)",
     ylab="Wages (dollars)")
legend(100,200000, legend="All surveyed", col="blue",
       pch=19,cex=0.5)

plot(pdata$JWMNP,pdata$WAGP,pch=19,cex=0.5,
     col=pdata$SEX,
     xlab="TT (min)",
     ylab="Wages (dollars)",
     main="Waged earned versus commute time")
legend(100,200000, legend=c("men","woman"), 
       col=c("black","red"),
       pch=c(19,19),
       cex=c(0.5,0.5))


par(mfrow=c(1,2))
hist(pdata$JWMNP,xlab="CT (min)", col="blue", 
     breaks=100,
     main="")
mtext(text="(a)", side=3, line=1)
plot(pdata$JWMNP, pdata$WAGP,pch=19,cex=0.5,
     xlab="CT (min)",
     ylab="Wages (dollars)",
     col=pdata$SEX)
legend(100,200000,legend=c("men","woman"),
       col=c("black","red"),
       pch=c(19,19),
       cex=c(0.5,0.5))
mtext(text="(b)",side=3,line=1)



pdf(file="towPanel.pdf", height=4, width=8)
par(mfrow=c(1,2))
hist(pdata$JWMNP,xlab="CT (min)", col="blue", 
     breaks=100,
     main="")
mtext(text="(a)", side=3, line=1)
plot(pdata$JWMNP, pdata$WAGP,pch=19,cex=0.5,
     xlab="CT (min)",
     ylab="Wages (dollars)",
     col=pdata$SEX)
legend(100,200000,legend=c("men","woman"),
       col=c("black","red"),
       pch=c(19,19),
       cex=c(0.5,0.5))
mtext(text="(b)",side=3,line=1)

dev.off()



png(file="towPanel.png", height=480, width=480*2)
par(mfrow=c(1,2))
hist(pdata$JWMNP,xlab="CT (min)", col="blue", 
     breaks=100,
     main="")
mtext(text="(a)", side=3, line=1)
plot(pdata$JWMNP, pdata$WAGP,pch=19,cex=0.5,
     xlab="CT (min)",
     ylab="Wages (dollars)",
     col=pdata$SEX)
legend(100,200000,legend=c("men","woman"),
       col=c("black","red"),
       pch=c(19,19),
       cex=c(0.5,0.5))
mtext(text="(b)",side=3,line=1)

dev.off()



par(mfrow=c(1,2))
hist(pdata$JWMNP,xlab="CT (min)", col="blue", 
     breaks=100,
     main="")
mtext(text="(a)", side=3, line=1)
plot(pdata$JWMNP, pdata$WAGP,pch=19,cex=0.5,
     xlab="CT (min)",
     ylab="Wages (dollars)",
     col=pdata$SEX)
legend(100,200000,legend=c("men","woman"),
       col=c("black","red"),
       pch=c(19,19),
       cex=c(0.5,0.5))
mtext(text="(b)",side=3,line=1)
dev.copy2pdf(file="towPanel2.pdf")

#Hierarchical Clustering 
par()
set.seed(1234); par(mar=c(0,0,0,0))
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2) 
plot(x,y,col="blue",pch=19,cex=2) 
text(x+0.05,y+0.05,labels=as.character(1:12))

dataFrame <- data.frame(x=x, y=y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)

myplclust <- function( hclust, lab=hclust$labels, 
                       lab.col=rep(1,length(hclust$labels)),
                       hang=0.1,...){
## modifiction of plclust for plotting hclust objects *in colour*!
## Copyright Eva KF Chan 2009
## Arguments:
## hclust: hclust object
## lab: a character vector of labels of the leaves of the tree 
## lab.col: colour for the labels; NA=default device foreground colour
## hang: as in hclust & plclust
## Side effect:
## A display of hierarchical cluster with coloured leaf labels. 
y <- rep(hclust$height,2); x <- as.numeric(hclust$merge)
y <- y[which(x<0)]; x <- x[which(x<0)]; x <- abs(x)
y <- y[order(x)]; x <- x[order(x)]
plot( hclust, labels=FALSE, hang=hang, ... )
text( x=x, y=y[hclust$order]-(max(hclust$height)*hang),
      labels=lab[hclust$order], col=lab.col[hclust$order], 
      srt=90, adj=c(1,0.5), xpd=NA, ... )

}

myplclust(hClustering,lab=rep(1:3,each=4),lab.col=rep(1:3,each=4))

x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2) 
dataFrame <- data.frame(x=x,y=y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),] 
heatmap(dataMatrix)


#K-Means Clustering 
set.seed(1234); par(mar=c(0,0,0,0))
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2) 
plot(x,y,col="blue",pch=19,cex=2) 
text(x+0.05,y+0.05,labels=as.character(1:12))

dataFrame <- data.frame(x,y)
kmeansObj <- kmeans(dataFrame, centers=3)
names(kmeansObj)
kmeansObj$cluster

par(mar=rep(0.2,4))
plot(x,y, col=kmeansObj$cluster, pch=19, cex=2)
points(kmeansObj$centers, col=1:3, pch=3, lwd=3)

#Heatmaps
set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
kmeansObj2 <- kmeans(dataMatrix,centers=3)
par(mfrow=c(1,2), mar=rep(0.2,4))
image(t(dataMatrix)[,nrow(dataMatrix):1], yaxt="n")
image(t(dataMatrix)[,order(kmeansObj$cluster)], yaxt="n")

#Dimension Reduction
set.seed(12345);par(mar=rep(0.2,4))
dataMatrix <- matrix(rnorm(400), nrow=40)
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])
par(mar=rep(0.2,4))
heatmap(dataMatrix)

set.seed(678910)
for (i in 1:40){
  #flip a coin
  coinFlip <- rbinom(1, size=1,prob=0.5)
  # if coin is heads add a common pattern to that row
  if (coinFlip){
    dataMatrix[i,]<-dataMatrix[i,] +  rep(c(0,3),each=5)
  } 
}

par(mar=rep(0.2,4))
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])

par(mar=rep(0.2,4))
heatmap(dataMatrix)

hh <- hclust(dist(dataMatrix)); dataMatrixOrdered <- dataMatrix[hh$order,]
par(mfrow=c(1,3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered),40:1,,xlab="Row",ylab="Row Mean",pch=19)
plot(colMeans(dataMatrixOrdered),xlab="Colum", ylab="Colum Mean",pch=19)

svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow=c(1,3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(svd1$u[,1],40:1,,xlab="Row",ylab="First Left singular vector", pch=19)
plot(svd1$v[,1],xlab="Column",ylab="First right singular vector",pch=19)


svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow=c(1,2))
plot(svd1$d,xlab="Column", ylab="Singular value",pch=19)
plot(svd1$d^2/sum(svd1$d^2), xlab="Column", ylab="Percent of variance explained", pch=19)


svd1 <- svd(scale(dataMatrixOrdered))
pca1 <- prcomp(dataMatrixOrdered,scale=TRUE)
plot(pca1$rotation[,1],svd1$v[,1],pch=19,xlab="Principal component 1",ylab="Right singular Vector 1")
abline(c(0,1))


constantMatriz <- dataMatrixOrdered*0
for (i in 1:dim(dataMatrixOrdered)[1]){constantMatriz[i,]<-rep(c(0,1),each=5)}
svd1 <- svd(constantMatriz)
par(mfrow=c(1,3))
image(t(constantMatriz)[,nrow(constantMatriz):1])
plot(svd1$d,xlab="Column",ylab="Singular Value", pch=19)
plot(svd1$d^2/sum(svd1$d^2),xlab="Colum",ylab="Percent of variance explained",pch=19)

#What if we add a second pattern?
set.seed(678910)
for(i in 1:40){
  #flip a coin
  coinFlip1 <- rbinom(1,size=1,prob=0.5)
  coinFlip2 <- rbinom(1,size=1,prob=0.5)
  if(coinFlip1){
    dataMatrix[i,]<-dataMatrix[i,]+rep(c(0,5),each=5)
  }
  if(coinFlip2){
    dataMatrix[i,]<-dataMatrix[i,]+rep(c(0,5),5)
  }
}
hh <- hclust(dist(dataMatrix));dataMatrixOrdered<-dataMatrix[hh$order,]

svd2 <- svd(scale(dataMatrixOrdered))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(rep(c(0,1),each=5),pch=19,xlab="Columns",ylab="Pattern 1")
plot(rep(c(0,1),5),pch=19,xlab="Columns",ylab="Pattern 2")

svd2 <- svd(scale(dataMatrixOrdered))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(svd2$v[,1],pch=19,xlab="Columns",ylab="First right singular vector")
plot(svd2$v[,2],pch=19,xlab="Columns",ylab="Second right singular vector")

svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow=c(1,2))
plot(svd1$d,xlab="Column",ylab="Singular value",pch=19)
plot(svd1$d^2/sum(svd1$d^2),xlab="Column",ylab="Percent of variance explained",pch=19)


#fast.svd function{corpcor}
bigMatrix <- matrix(rnorm(1e4*40),nrow=1e4)
system.time(svd(scale(bigMatrix)))
#install.packages("corpcor")
library("corpcor")
system.time(fast.svd(scale(bigMatrix),tol=0))

#Missing values
#source("http://bioconductor.org/biocLite.R")
#biocLite("impute")
#library(impute)
dataMatrix2 <- dataMatrixOrdered
dataMatrix2[sample(1:100,size=40,replace=F)]<-NA
dataMatrix2<-impute.knn(dataMatrix2)$data
svd2 <- svd(scale(dataMatrix2))
svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow=c(1,2))
plot(svd1$v[,1],pch=19)
plot(svd2$v[,1],pch=19)


#Face Example

download.file("https://spark-public.s3.amazonaws.com/dataanalysis/face.rda",
              destfile="./data/face.rda",method="curl")
load("./data/face.rda")
image(t(faceData)[,nrow(faceData):1])
svd1 <- svd(scale(faceData))
plot(svd1$d^2/sum(svd1$d^2),pch=19,xlab="Singular vector",ylab="Variance explained")

#Face Example - create approximations
svd1 <- svd(scale(faceData))
# %*% is matrix multiplication

# Here svd1$d[1] is a constant
approx1 <- svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]

# In these examples we need to make the diagonal matrix out of d
approx5 <- svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5])
approx10 <- svd1$u[,1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[,1:10])

par(mfrow=c(2,2))
image(t(faceData)[,nrow(faceData):1])
image(t(approx10)[,nrow(approx10):1])
image(t(approx5)[,nrow(approx5):1])
image(t(approx1)[,nrow(approx1):1])