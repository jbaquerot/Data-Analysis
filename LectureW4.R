#examples Lecture Week 4
########################
## 01 Clustering Example
########################


#Slightly process Data
#download.file("https://dl.dropbox.com/u/7710864/courseraPublic/samsungData.rda" ,
#              destfile="./data/samsungData.rda",method="curl")
load("./data/samsungData.rda") 
names(samsungData)[1:12]
table(samsungData$activity)

#Plotting average acceleration for first subject
par(mfrow=c(1,2))
numericActivity <- as.numeric(as.factor(samsungData$activity))[samsungData$subject==1] 
plot(samsungData[samsungData$subject==1,1],
     pch=19,col=numericActivity,ylab=names(samsungData)[1]) 
plot(samsungData[samsungData$subject==1,2],
     pch=19,col=numericActivity,ylab=names(samsungData)[2]) 
legend(150,-0.1,legend=unique(samsungData$activity),
       col=unique(numericActivity),pch=19)

#Clustering based just on average acceleration
source("http://dl.dropbox.com/u/7710864/courseraPublic/myplclust.R") 
par(mfrow=c(1,1))
distanceMatrix <- dist(samsungData[samsungData$subject==1,1:3]) 
hclustering <- hclust(distanceMatrix) 
myplclust(hclustering,lab.col=numericActivity)


#Plotting max acceleration for the first subject
par(mfrow=c(1,2)) 
plot(samsungData[samsungData$subject==1,10],pch=19,col=numericActivity,ylab=names(samsungData)[10]) 
plot(samsungData[samsungData$subject==1,11],pch=19,col=numericActivity,ylab=names(samsungData)[11])

#Clustering based on maximum acceleration
par(mfrow=c(1,1))
distanceMatrix <- dist(samsungData[samsungData$subject==1,10:12]) 
hclustering <- hclust(distanceMatrix) 
myplclust(hclustering,lab.col=numericActivity)


# Singular value decomposition
svd1 = svd(scale(samsungData[samsungData$subject==1,-c(562,563)])) 
par(mfrow=c(1,2))
plot(svd1$u[,1],col=numericActivity,pch=19) 
plot(svd1$u[,2],col=numericActivity,pch=19)

# Find maximum contributor
par(mfrow=c(1,1))
plot(svd1$v[,2],pch=19)

# New clustering with maximum contributer
maxContrib <- which.max(svd1$v[,2])
distanceMatrix <- dist(samsungData[samsungData$subject==1,c(10:12,maxContrib)]) 
hclustering <- hclust(distanceMatrix) 
myplclust(hclustering,lab.col=numericActivity)
names(samsungData)[maxContrib]

#K-means clustering (nstart=1, first try)
kClust <- kmeans(samsungData[samsungData$subject==1,-c(562,563)],
                 centers=6) 
table(kClust$cluster,samsungData$activity[samsungData$subject==1])

#K-means clustering (nstart=1, second try)
kClust <- kmeans(samsungData[samsungData$subject==1,-c(562,563)],
                 centers=6,nstart=1) 
table(kClust$cluster,samsungData$activity[samsungData$subject==1])

#K-means clustering (nstart=100, first try)
kClust <- kmeans(samsungData[samsungData$subject==1,-c(562,563)],
                 centers=6,nstart=100) 
table(kClust$cluster,samsungData$activity[samsungData$subject==1])

#K-means clustering (nstart=100, second try)
kClust <- kmeans(samsungData[samsungData$subject==1,-c(562,563)],
                 centers=6,nstart=100) 
table(kClust$cluster,samsungData$activity[samsungData$subject==1])

#Custer 1 Variable Centers(Laying)
plot(kClust$center[1,1:10],pch=19,ylab="Cluster Center",xlab="")

#Custer 2 Variable Centers(Walkin)
plot(kClust$center[6,1:10],pch=19,ylab="Cluster Center",xlab="")

########################
## 02_Basic Least Squares
########################

#Load Galton Data
#install.packages("UsingR")
library(UsingR); data(galton) 
par(mfrow=c(1,2)) 
hist(galton$child,col="blue",breaks=100)
meanChild <- mean(galton$child) 
lines(rep(meanChild,100),seq(0,150,length=100),col="red",lwd=5)
hist(galton$parent,col="blue",breaks=100)

#What if we plot child versus average parent
par(mfrow=c(1,1))
plot(galton$parent,galton$child,pch=19,col="blue")

#Jittered plot
set.seed(1234) 
plot(jitter(galton$parent,factor=2),
     jitter(galton$child,factor=2),
     pch=19,col="blue")

#Average parent = 65 inches tall
plot(galton$parent,galton$child,pch=19,col="blue")
near65 <- galton[abs(galton$parent - 65)<1, ] 
points(near65$parent,near65$child,pch=19,col="red") 
lines(seq(64,66,length=100),
      rep(mean(near65$child),100)
      ,col="red",lwd=4)

#Average parent = 71 inches tall
plot(galton$parent,galton$child,pch=19,col="blue")
near71 <- galton[abs(galton$parent - 71)<1, ] 
points(near71$parent,near71$child,pch=19,col="red") 
lines(seq(70,72,length=100),
      rep(mean(near71$child),100)
      ,col="red",lwd=4)


#Fitting a line
par(mfrow=c(1,2))
plot(galton$parent,galton$child,pch=19,col="blue") 
lm1 <- lm(galton$child ~ galton$parent) 
lines(galton$parent,lm1$fitted,col="red",lwd=3)
#Plat what is leftover
plot(galton$parent,lm1$residuals,col="blue",pch=19) 
abline(c(0,0),col="red",lwd=3)


########################
## 03 Inference Basics
########################

#Fit a line to the Galton Data
library(UsingR); data(galton); 
plot(galton$parent,galton$child,pch=19,col="blue") 
lm1 <- lm(galton$child ~ galton$parent) 
lines(galton$parent,lm1$fitted,col="red",lwd=3)

lm1

#Create a "population" of 1 million families
newGalton <- data.frame(parent=rep(NA,1e6),child=rep(NA,1e6))
newGalton$parent <- rnorm(1e6,mean=mean(galton$parent),
                          sd=sd(galton$parent))
newGalton$child <- lm1$coeff[1] + lm1$coeff[2]*newGalton$parent + rnorm(1e6,sd=sd(lm1$residuals)) 
smoothScatter(newGalton$parent,newGalton$child)
abline(lm1,col="red",lwd=3)

#Let's take a sample
set.seed(134325); 
sampleGalton1 <- newGalton[sample(1:1e6,size=50,replace=F),] 
sampleLm1 <- lm(sampleGalton1$child ~ sampleGalton1$parent) 
plot(sampleGalton1$parent,sampleGalton1$child,pch=19,col="blue") 
lines(sampleGalton1$parent,sampleLm1$fitted,lwd=3,lty=2) 
abline(lm1,col="red",lwd=3)

#Let's take another sample
sampleGalton2 <- newGalton[sample(1:1e6,size=50,replace=F),] 
sampleLm2 <- lm(sampleGalton2$child ~ sampleGalton2$parent) 
plot(sampleGalton2$parent,sampleGalton2$child,pch=19,col="blue") 
lines(sampleGalton2$parent,sampleLm2$fitted,lwd=3,lty=2) 
abline(lm1,col="red",lwd=3)

#Let's take another sample
sampleGalton3 <- newGalton[sample(1:1e6,size=50,replace=F),] 
sampleLm3 <- lm(sampleGalton3$child ~ sampleGalton3$parent) 
plot(sampleGalton3$parent,sampleGalton3$child,pch=19,col="blue")
lines(sampleGalton3$parent,sampleLm3$fitted,lwd=3,lty=2) 
abline(lm1,col="red",lwd=3)

#Many Examples

sampleLm <- vector(100,mode="list") 
for(i in 1:100){
  sampleGalton <- newGalton[sample(1:1e6,size=50,replace=F),]
  sampleLm[[i]] <- lm(sampleGalton$child ~ sampleGalton$parent) 
}
smoothScatter(newGalton$parent,newGalton$child) 
for(i in 1:100){
  abline(sampleLm[[i]],lwd=3,lty=2)
} 
abline(lm1,col="red",lwd=3)

#Histogram of estimates
par(mfrow=c(1,2)) 
hist(sapply(sampleLm,function(x){coef(x)[1]}),
     col="blue",xlab="Intercept",main="") 
hist(sapply(sampleLm,function(x){coef(x)[2]}),
     col="blue",xlab="Slope",main="")

#Estimating the values in R
sampleGalton4 <- newGalton[sample(1:1e6,size=50,replace=F),] 
sampleLm4 <- lm(sampleGalton4$child ~ sampleGalton4$parent) 
summary(sampleLm4)

par(mfrow=c(1,1))
hist(sapply(sampleLm,function(x){coef(x)[2]}),
     col="blue",xlab="Slope",main="",freq=F) 
lines(seq(0,5,length=100),
      dnorm(seq(0,5,length=100),
            mean=coef(sampleLm4)[2],  
            sd=summary(sampleLm4)$coeff[2,2]),
      lwd=3,col="red")

#tn-2 versus N(0,1)
x <- seq(-5,5,length=100) 
plot(x,dnorm(x),type="l",lwd=3) 
lines(x,dt(x,df=3),lwd=3,col="red") 
lines(x,dt(x,df=10),lwd=3,col="blue")

#Confidence Intervals
summary(sampleLm4)$coeff
confint(sampleLm4,level=0.95)

par(mar=c(4,4,0,2));
plot(1:10,type="n",xlim=c(0,1.5),ylim=c(0,100), 
     xlab="Coefficient Values",ylab="Replication")
for(i in 1:100){
  ci <- confint(sampleLm[[i]]); color="red";
  if((ci[2,1] < lm1$coeff[2]) & (lm1$coeff[2] < ci[2,2])){
    color = "grey"
  } 
  segments(ci[2,1],i,ci[2,2],i,col=color,lwd=3)
} 
lines(rep(lm1$coeff[2],100),seq(0,100,length=100),lwd=3)

# How you report the inference
sampleLm4$coeff
confint(sampleLm4,level=0.95)
print("A one inch increase in parental height is associated with a 0.77 
      inch increase in child's height (95% CI: 0.42-1.12 inches).")



########################
## 04 pValues
########################

#Galton Data
library(UsingR); data(galton) 
plot(galton$parent,galton$child,pch=19,col="blue") 
lm1 <- lm(galton$child ~ galton$parent) 
abline(lm1,col="red",lwd=3)

#Null distribution
x <- seq(-20,20,length=100) 
plot(x,dt(x,df=(928-2)),col="blue",lwd=3,type="l")

#Null distribution + observed statistic
x <- seq(-20,20,length=100) 
plot(x,dt(x,df=(928-2)),col="blue",lwd=3,type="l") 
arrows(summary(lm1)$coeff[2,3],0.25,
       summary(lm1)$coeff[2,3],0,
       col="red",lwd=4)

#Calculating p-values
summary(lm1)

#A quick simulated example
set.seed(9898324)
yValues <- rnorm(10); xValues <- rnorm(10) 
lm2 <- lm(yValues ~ xValues)
summary(lm2)

x <- seq(-5,5,length=100)
plot(x,dt(x,df=(10-2)),col="blue",lwd=3,type="l") 
arrows(summary(lm2)$coeff[2,3],0.25,
       summary(lm2)$coeff[2,3],0,
       col="red",lwd=4)

xCoords <- seq(-5,5,length=100) 
plot(xCoords,dt(xCoords,df=(10-2)),col="blue",lwd=3,type="l")
xSequence <- c(seq(summary(lm2)$coeff[2,3],5,length=10),
               summary(lm2)$coeff[2,3]) 
ySequence <- c(dt(seq(summary(lm2)$coeff[2,3],5,length=10),df=8),0) 
polygon(xSequence,ySequence,col="red"); 
polygon(-xSequence,ySequence,col="red")

#Simulate a ton of data sets with no signal
set.seed(8323); pValues <- rep(NA,100) 
for(i in 1:100){
  xValues <- rnorm(20);yValues <- rnorm(20)
  pValues[i] <- summary(lm(yValues ~ xValues))$coeff[2,4] 
}
hist(pValues,col="blue",main="",freq=F) 
abline(h=1,col="red",lwd=3)

#Simulate a ton of data sets with signal
set.seed(8323); pValues <- rep(NA,100) 
for(i in 1:100){
  xValues <- rnorm(20);yValues <- 0.2 * xValues + rnorm(20)
  pValues[i] <- summary(lm(yValues ~ xValues))$coeff[2,4] 
}
hist(pValues,col="blue",main="",freq=F,xlim=c(0,1))
abline(h=1,col="red",lwd=3)

#Simulate a ton of data sets with signal
set.seed(8323); pValues <- rep(NA,100) 
for(i in 1:100){
  xValues <- rnorm(100);yValues <- 0.2 * xValues + rnorm(100)
  pValues[i] <- summary(lm(yValues ~ xValues))$coeff[2,4] 
}
hist(pValues,col="blue",main="",freq=F,xlim=c(0,1))
abline(h=1,col="red",lwd=3)

#How you interpret the results
summary(lm(galton$child ~ galton$parent))$coeff
print("A one inch increase in parental height is associated with a 0.77 inch increase in child's height (95% CI: 0.42-1.12 inches). 
      This difference was statistically significant (P < 0.001 ).")


########################
## 05 Factor Variable
########################
#Movie Data
#download.file("http://www.rossmanchance.com/iscam2/data/movies03RT.txt",
#             destfile="./data/movies.txt) 
movies <- read.table("./data/movies.txt",sep="\t",header=T,quote="")
head(movies)

#Rotton tomatoes score vs rating
plot(movies$score ~ jitter(as.numeric(movies$rating)),
     col="blue",xaxt="n",pch=19) 
axis(side=1,at=unique(as.numeric(movies$rating)),
     labels=unique(movies$rating))

#Average scoring by rating
meanRatings <- tapply(movies$score,movies$rating,mean) 
points(1:4,meanRatings,col="red",pch="-",cex=5)

#Regresion multi factor
lm1 <- lm(movies$score ~ as.factor(movies$rating)) 
summary(lm1)

#Plot fitted values
plot(movies$score ~ jitter(as.numeric(movies$rating)),
     col="blue",xaxt="n",pch=19) 
axis(side=1,at=unique(as.numeric(movies$rating)),
     labels=unique(movies$rating)) 
points(1:4,lm1$coeff[1] + c(0,lm1$coeff[2:4]),
       col="red",pch="-",cex=5)

#Question 1: 
#What is the average difference in rating between G and R movies? 
#b0 + b3 - b0 = b3
lm1 <- lm(movies$score ~ as.factor(movies$rating)) 
summary(lm1)
confint(lm1)

#Question 2:
#What is the average difference in rating between PG " 13 and R movies? 
#b0 +b2 - (b0 +b3) = b2 - b3
#We could rewrite our model
#What is the average difference in rating between PG " 13 and R movies? 
#b0 + b3 - b0 = b3
lm2 <- lm(movies$score ~ relevel(movies$rating,ref="R")) 
summary(lm2)
confint(lm2)

#Question 3:
#Is there any difference in score between any of the movie ratings?
lm1 <- lm(movies$score ~ as.factor(movies$rating)) 
anova(lm1)

#Sum of squares (G movies)
gMovies <- movies[movies$rating=="G",]; 
xVals <- seq(0.2,0.8,length=4) 
plot(xVals,gMovies$score,ylab="Score",xaxt="n",
     xlim=c(0,1),pch=19) 
abline(h=mean(gMovies$score),col="blue",lwd=3) 
abline(h=mean(movies$score),col="red",lwd=3) 
segments(xVals+0.01,rep(mean(gMovies$score),length(xVals)),
         xVals+0.01,
         rep(mean(movies$score),length(xVals)),
         col="red",lwd=2) 
segments(xVals-0.01,gMovies$score,xVals-0.01,
         rep(mean(gMovies$score),length(xVals)),
         col="blue",lwd=3)

#Turkey's (honestly significant difference test)
lm1 <- aov(movies$score ~ as.factor(movies$rating)) 
TukeyHSD(lm1)



########################
## 06 Multiple Variables
########################

#WHO childhood hunger data
#download.file("http://apps.who.int/gho/athena/data/GHO/WHOSIS_000008.csv?profile=text&filter=COUNTR 
hunger <- read.csv("./data/hunger.csv")
hunger <- hunger[hunger$Sex!="Both sexes",]
head(hunger)

#Plot percent hungry versus time
lm1 <- lm(hunger$Numeric ~ hunger$Year) 
plot(hunger$Year,hunger$Numeric,pch=19,col="blue")

#Add the linear model
lines(hunger$Year,lm1$fitted,lwd=3,col="darkgrey")

#Color by male/female
plot(hunger$Year,hunger$Numeric,pch=19) 
points(hunger$Year,hunger$Numeric,pch=19,
       col=((hunger$Sex=="Male")*1+1))

#Color by male/female
lmM <- lm(hunger$Numeric[hunger$Sex=="Male"] ~ hunger$Year[hunger$Sex=="Male"]) 
lmF <- lm(hunger$Numeric[hunger$Sex=="Female"] ~ hunger$Year[hunger$Sex=="Female"]) 
plot(hunger$Year,hunger$Numeric,pch=19) 
points(hunger$Year,hunger$Numeric,pch=19,
       col=((hunger$Sex=="Male")*1+1)) 
lines(hunger$Year[hunger$Sex=="Male"],
      lmM$fitted,col="black",lwd=3) 
lines(hunger$Year[hunger$Sex=="Female"],
      lmF$fitted,col="red",lwd=3)

#Two lines, same slope in R
lmBoth <- lm(hunger$Numeric ~ hunger$Year + hunger$Sex) 
plot(hunger$Year,hunger$Numeric,pch=19) 
points(hunger$Year,hunger$Numeric,pch=19,
       col=((hunger$Sex=="Male")*1+1)) 
abline(c(lmBoth$coeff[1],lmBoth$coeff[2]),col="red",lwd=3) 
abline(c(lmBoth$coeff[1] + lmBoth$coeff[3],lmBoth$coeff[2] ),
       col="black",lwd=3)

#Two lines, different slopes in R
lmBoth <- lm(hunger$Numeric ~ hunger$Year + hunger$Sex + hunger$Sex*hunger$Year) 
plot(hunger$Year,hunger$Numeric,pch=19) 
points(hunger$Year,hunger$Numeric,pch=19,
       col=((hunger$Sex=="Male")*1+1)) 
abline(c(lmBoth$coeff[1],lmBoth$coeff[2]),col="red",lwd=3)
abline(c(lmBoth$coeff[1] + lmBoth$coeff[3],
         lmBoth$coeff[2] +lmBoth$coeff[4]),
       col="black",lwd=3)

summary(lmBoth)


########################
## 07 Real Data
########################

# The ideal data for regression
library(UsingR); data(galton) 
plot(galton$parent,galton$child,col="blue",pch=19)

# WHO childhood hunger data
#download.file("http://apps.who.int/gho/athena/data/GHO/WHOSIS_000008.csv?profile=text&filt er=COUNTRY:*;SEX:*",
#              "./data/hunger.csv",method="curl")
hunger <- read.csv("./data/hunger.csv") 
hunger <- hunger[hunger$Sex!="Both sexes",] 
head(hunger)

#Hunger over time by region
par(mfrow=c(1,2))
plot(hunger$Year,hunger$Numeric,
     col=as.numeric(hunger$WHO.region),pch=19) 
plot(1:10,type="n",xaxt="n",yaxt="n",xlab="",ylab="") 
legend(1,10,col=unique(as.numeric(hunger$WHO.region)),
       legend=unique(hunger$WHO.region),pch=19)

#Region correlated with year
anova(lm(hunger$Year ~ hunger$WHO.region))

#Region correlated with hunger
anova(lm(hunger$Numeric ~ hunger$WHO.region))

#Including region - a complicated interaction
plot(hunger$Year,hunger$Numeric,pch=19,
     col=as.numeric(hunger$WHO.region))
lmRegion <- lm(hunger$Numeric ~ hunger$Year + hunger$WHO.region + hunger$Year*hunger$WHO.region ) 
abline(c(lmRegion$coeff[1] + lmRegion$coeff[6],
         lmRegion$coeff[2]+ lmRegion$coeff[12]),
       col=5,lwd=3)

#Income data
#download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data","./data/i 
incomeData <- read.csv("./data/income.csv",header=FALSE)
income <- incomeData[,3]
age <- incomeData[,1]

#Logs to address right-skew
par(mfrow=c(1,4)) 
smoothScatter(age,income) 
hist(income,col="blue",breaks=100) 
hist(log(income+1),col="blue",breaks=100) 
smoothScatter(age,log(income+1))

#Example - extreame points
par(mfrow=c(1,1))
set.seed(1235)
xVals <- rcauchy(50) 
hist(xVals,col="blue")

#Example - Outliers may be real
# Add Tim Cook, CEO of Apple 2011 income
age <- c(age,52)
income <- c(income,378e6) 
smoothScatter(age,income)

#Variance changes
bupaData <- read.csv("ftp://ftp.ics.uci.edu/pub/machine-learning-databases/liver-disorders/bupa.dat")
ggt <- bupaData[,5]; aat <- bupaData[,3]
plot(log(ggt),aat,col="blue",pch=19)
