#
#01_Multiple Factors
#

#Movies data
download.file("http://www.rossmanchance.com/iscam2/data/movies03RT.txt", 
              destfile="./data/movies.txt", method="curl")
movies <- read.table("./data/movies.txt",sep="\t",
                     header=T,quote="") 
head(movies)

aovObject <- aov(movies$score ~ movies$rating)
aovObject
aovObject$coefficients

aovObject2 <- aov(movies$score ~ movies$rating+movies$genre)
aovObject2
summary(aovObject2)

aovObject3 <- aov(movies$score ~ movies$genre+movies$rating)
aovObject3
summary(aovObject3)

aovObject4 <- aov(movies$score ~ movies$genre+movies$rating+movies$box.office)
aovObject4
summary(aovObject4)

#
#02_Binary Ourcome
#
download.file("https://dl.dropbox.com/u/7710864/data/ravensData.rda",
              destfile="./data/ravensData.rda",method="curl")
load("./data/ravensData.rda") 
head(ravensData)
#Linear Regression in R
lmRavens <- lm(ravensData$ravenWinNum ~ ravensData$ravenScore)
summary(lmRavens)
plot(ravensData$ravenScore, lmRavens$fitted,
     pch=19, col="blue",
     ylab="Prob Win",
     xlab="Raven Score")

#Raven Logistic regression
logRegRavens <- glm(ravensData$ravenWinNum ~ ravensData$ravenScore,
                    family="binomial")
summary(logRegRavens)
plot(ravensData$ravenScore, logRegRavens$fitted,
     pch=19, col="blue",
     ylab="Prob Win",
     xlab="Raven Score")

# Odds ratios and confidence intervals
exp(logRegRavens$coeff)
exp(confint(logRegRavens))

#ANOVA for logistic regression
anova(logRegRavens,test="Chisq")

#
#03_Count outcomes
#
# Poisson Distribution
set.seed(3433); par(mfrow=c(1,2))
poisData2 <- rpois(100,lambda=100)
poisData1 <- rpois(100,lambda=50) 
hist(poisData1,col="blue",xlim=c(0,150))
hist(poisData2,col="blue",xlim=c(0,150))
c(mean(poisData1),var(poisData1))
c(mean(poisData2),var(poisData2))

#Website data
download.file("https://dl.dropbox.com/u/7710864/data/gaData.rda",
              destfile="./data/gaData.rda",method="curl")
load("./data/gaData.rda")
gaData$julian <- julian(gaData$date)
head(gaData)

plot(gaData$julian,gaData$visits,
     pch=19,col="darkgrey",
     xlab="Julian",ylab="Visits")
lm1 <- lm(gaData$visits ~ gaData$julian)
abline(lm1, col="red", lwd=3)
#Poisson regression
glm1 <- glm(gaData$visits ~ gaData$julian, family="poisson")
lines(gaData$julian, glm1$fitted, col="blue", lwd=3)

#Mean-variance relationship?
plot(glm1$fitted,glm1$residuals,
     pch=19, col="grey",
     ylab="Residuals",
     xlab="Fitted values")

#Model agnostic standard errors
install.packages("sandwich")
library(sandwich)
confint.agnostic <- function (object, parm, level = 0.95, ...) {
  cf <- coef(object); pnames <- names(cf) 
  if (missing(parm))
    parm <- pnames
  else if (is.numeric(parm))
    parm <- pnames[parm]
  a<-(1-level)/2;a<-c(a,1-a)
  pct <- stats:::format.perc(a, 3)
  fac <- qnorm(a)
  ci <- array(NA, dim = c(length(parm), 2L), dimnames = list(parm,pct))
  ses <- sqrt(diag(sandwich::vcovHC(object)))[parm] 
  ci[] <- cf[parm] + ses %o% fac
  ci
}

#Estimating confidence intervals
confint(glm1)
confint.agnostic(glm1)

#Fitting rates in R
glm2 <- glm(gaData$simplystats ~ julian(gaData$date),
            offset=log(visits+1), 
            family="poisson",
            data=gaData)
plot(julian(gaData$date),glm2$fitted,
     col="blue",pch=19,
     xlab="Date",ylab="Fitted Counts") 
points(julian(gaData$date),glm1$fitted
       ,col="red",pch=19)

plot(julian(gaData$date),gaData$simplystats/(gaData$visits+1),
     col="grey",
     xlab="Date", ylab="Fitted Rates",
     pch=19)
lines(julian(gaData$date),glm2$fitted/(gaData$visits+1),
      col="blue",lwd=3)

#
#04_Model Checking
#
#Model checking - constant variance
set.seed(3433); par(mfrow=c(1,2))
data <- rnorm(100,mean=seq(0,3,length=100),
              sd=seq(0.1,3,length=100))
lm1 <- lm(data ~ seq(0,3,length=100))
plot(seq(0,3,length=100),data,pch=19,col="grey") 
abline(lm1,col="red",lwd=3) 
plot(seq(0,3,length=100),lm1$residuals,,pch=19,col="grey")
abline(c(0,0),col="red",lwd=3)

#Using the sandwich estimate
vcovHC(lm1)
summary(lm1)$cov.unscaled

#Model checking - linear trend
set.seed(3433); par(mfrow=c(1,2))
data <- rnorm(100,mean=seq(0,3,length=100)^3,sd=2)
lm1 <- lm(data ~ seq(0,3,length=100))
plot(seq(0,3,length=100),data,pch=19,col="grey")
abline(lm1,col="red",lwd=3) 
plot(seq(0,3,length=100),lm1$residuals,,pch=19,col="grey") 
abline(c(0,0),col="red",lwd=3)

#Model checking - missing covariate
set.seed(3433); par(mfrow=c(1,3)) 
z <- rep(c(-0.5,0.5),50)
data <- rnorm(100,mean=(seq(0,3,length=100) + z),
              sd=seq(0.1,3,length=100))
lm1 <- lm(data ~ seq(0,3,length=100))
plot(seq(0,3,length=100),data,pch=19,col=((z>0)+3))
abline(lm1,col="red",lwd=3) 
plot(seq(0,3,length=100),lm1$residuals,pch=19,col=((z>0)+3))
abline(c(0,0),col="red",lwd=3) 
boxplot(lm1$residuals ~ z,col = ((z>0)+3) )


#Model checking - outliers
set.seed(343); par(mfrow=c(1,2)); betahat <- rep(NA,100)
x <- seq(0,3,length=100); y <- rcauchy(100) 
lm1 <- lm(y ~ x) 
plot(x,y,pch=19,col="blue")
abline(lm1,col="red",lwd=3)
for(i in 1:length(data)){
  betahat[i] <- lm(y[-i] ~ x[-i])$coeff[2]
  } 
plot(betahat - lm1$coeff[2],col="blue",pch=19)
abline(c(0,0),col="red",lwd=3)

#Robust  linear modeling
install.packages("MASS")
library(MASS)
set.seed(343)
x <- seq(0,3,length=100)
y <- rcauchy(100)
lm1<-lm(y~x)
rlm1<-rlm(y~x)
lm1$coeff
rlm1$coeff

par(mfrow=c(1,2))
plot(x,y,pch=19,col="grey")
lines(x,lm1$fitted,col="blue",lwd=3); 
lines(x,rlm1$fitted,col="green",lwd=3) 
plot(x,y,pch=19,col="grey",ylim=c(-5,5),main="Zoomed In") 
lines(x,lm1$fitted,col="blue",lwd=3); 
lines(x,rlm1$fitted,col="green",lwd=3)

#Model checking - default plots
set.seed(343); par(mfrow=c(1,2))
x <- seq(0,3,length=100); y <- rnorm(100); 
lm1 <- lm(y ~ x) 
plot(lm1)


#Movie Data
download.file("http://www.rossmanchance.com/iscam2/data/movies03RT.txt",
              destfile="./data/movies.txt") 
movies <- read.table("./data/movies.txt",sep="\t",
                     header=T,quote="")
head(movies)

#Model Selection - step
movies <- movies[,-1]
lm1 <- lm(score ~ .,data=movies) 
aicFormula <- step(lm1)
aicFormula

#Model selection - regsubsets
library(leaps);
regSub <- regsubsets(score ~ .,data=movies)
par(mfcol=c(1,1))
plot(regSub)

#Model  selection - bic.glm
install.packages("BMA")
library(BMA)
bicglm1 <- bic.glm(score ~.,data=movies,glm.family="gaussian") 
print(bicglm1)
