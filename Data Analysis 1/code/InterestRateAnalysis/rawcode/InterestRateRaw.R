#Raw Interest Rate Analysis
getwd()
download.file("https://spark-public.s3.amazonaws.com/dataanalysis/loansData.csv", destfile="../../data/loansData.csv", method = "curl")
dateDownloaded <- date()
dateDownloaded
loans <- read.csv("../../data/loansData.csv",stringsAsFactors=FALSE)
##Munging Data

loans$Interest.Rate <- as.numeric(gsub("%","",loans$Interest.Rate))
loans$Loan.Length <- as.numeric(gsub("months","",loans$Loan.Length))
loans$Loan.Purpose <- as.factor(loans$Loan.Purpose)
loans$Debt.To.Income.Ratio <- as.numeric(gsub("%","",loans$Debt.To.Income.Ratio))
loans$State <- as.factor(loans$State)
loans$Home.Ownership <- as.factor(loans$Home.Ownership)
loans$FICO.Range.L <- as.numeric(substr(loans$FICO.Range,1,3))
loans$FICO.Range <- as.factor(loans$FICO.Range)
loans$Employment.Length <- as.factor(loans$Employment.Length)


save(loans,dateDownloaded, file="../../data/loansData.rda")




hist(loans$Amount.Requested, 
     main="Histogram of Amount Requested",
     xlab="Amont Requested")
quantile(loans$Amount.Requested)
hist(loans$Amount.Funded.By.Investors,
     main="Histogram of Amount Funded By Investors",
     xlab="Amont Funded By Investors")
quantile(loans$Amount.Funded.By.Investors)
hist(loans$Interest.Rate,
     main="Histogram of Interest Rate",
     xlab="Interest Rate")
quantile(loans$Interest.Rate)

hist(loans$Loan.Length,
     main="Histogram of Loan Lenght",
     xlab="Loan Lenght (months)")
quantile(loans$Loan.Length)

summary(loans$Loan.Purpose)

hist(loans$Debt.To.Income.Ratio,
     main="Histogram of Debt to Income Ratio",
     xlab="Debt to Income Ratio (%)")
quantile(loans$Debt.To.Income.Ratio)



plot(loans$Amount.Requested,loans$Interest.Rate, pch=19, col="blue", xlab="Interest Rate (%)", ylab="Amount Request ($)", main="Interest Rate vs Amount Requested")
lmIRAR <- lm(loans$Interest.Rate ~ loans$Amount.Requested)
lines(loans$Amount.Requested,lmIRAR$fitted,
      col="red",lwd=3)
summary(lmIRAR)


boxplot(loans$Interest.Rate ~ loans$Loan.Length)


plot(log(loans$Monthly.Income),loans$Interest.Rate, pch=19, col="blue", xlab="Interest Rate (%)", ylab="Monthly Income (log($))", main="Interest Rate vs Monthly Income")
lmIRMI <- lm(loans$Interest.Rate ~ log(loans$Monthly.Income))
lines(log(loans[!is.na(loans$Monthly.Income),"Monthly.Income"]), lmIRMI$fitted,
      col="red",lwd=3)
summary(lmIRMI)
length(lmIRMI$fitted)
length(log(loans$Monthly.Income))
sum(is.na(loans$Monthly.Income))
loans[!is.na(loans$Monthly.Income),]



plot(log(loans$Revolving.CREDIT.Balance),loans$Interest.Rate, pch=19, col="blue", xlab="Interest Rate (%)",
     ylab="Revolving Credit Balance(log($))", 
     main="Interest Rate vs Revolving Credit Balance")
lmIRRCB <- lm(loans$Interest.Rate ~ (loans$Revolving.CREDIT.Balance))
lines(loans[!is.na(loans$Revolving.CREDIT.Balance),
            "Revolving.CREDIT.Balance"], 
      lmIRRCB$fitted,
      col="red",lwd=3)
summary(lmIRRCB)

par(mar=c(4,4,2,0.5),col=palette(heat.colors(48)))
layout(matrix(c(1, 1, 2,2), 2, 2, byrow=F), widths=c(2,1))
3
plot(loans$Amount.Requested,loans$Interest.Rate, pch=19,
     col=loans$FICO.Range, 
     ylab="Interest Rate (%)", 
     xlab="Amount Request ($)", 
     main="Interest Rate vs Amount Requested",
     cex=0.4)
lmIRAR <- lm(loans$Interest.Rate ~ loans$Amount.Requested)
lines(loans$Amount.Requested,lmIRAR$fitted,
      col="red",lwd=3)
plot.new()
legend("center","groups",legend=sort(unique(loans$FICO.Range)), 
       col=sort(unique(loans$FICO.Range)),cex=0.4,pch=19, 
       title="FICO Score",ncol=3)
summary(lmIRAR)





par(mar=c(4,4,2,0.5),col=palette(heat.colors(48)))
layout(matrix(c(1, 2, 3, 3), 2, 2, byrow=F), widths=c(3,1))
plot(loans$Amount.Requested,loans$Interest.Rate, pch=19,
     col=loans$FICO.Range, 
     ylab="Interest Rate (%)", 
     xlab="Amount Request ($)", 
     main="Interest Rate vs Amount Requested (FICO Colored)",
     cex=0.7)
lmIRAR <- lm(loans$Interest.Rate ~ loans$Amount.Requested)
lines(loans$Amount.Requested,lmIRAR$fitted,
      col="Black",lwd=3)
plot(loans$Amount.Requested, lmIRAR$residuals, 
     col=loans$FICO.Range, 
     ylab="No adjust Residuals", 
     xlab="Amount Request ($)", 
     main="Interest Rate vs Amount Requested (FICO Colored)",
     cex=0.7)
plot.new()
legend("center","groups",legend=sort(unique(loans$FICO.Range)), 
       col=sort(unique(loans$FICO.Range)),cex=0.7,pch=19, 
       title="FICO Score",ncol=1)

summary(lmIRAR)



loans640_724<-loans[loans$FICO.Range %in% levels(loans$FICO.Range)[1:17],]
loans725_819<-loans[loans$FICO.Range %in% levels(loans$FICO.Range)[18:36],]
loans820_834<-loans[loans$FICO.Range %in% levels(loans$FICO.Range)[37:38],]

summary(lm(loans640_724$Interest.Rate ~ loans640_724$FICO.Range+log(loans640_724$Monthly.Income)))


log(loans640_724$Revolving.CREDIT.Balance + 1)




pcolor=cut(loans$Amount.Requested,10)
par(mfrow=c(2,1),mar=c(4,4,2,0.5),col=palette(heat.colors(10)))
plot(jitter(loans$FICO.Range.L,2),loans$Interest.Rate, pch=19,
     col=pcolor, 
     ylab="Interest Rate (%)", 
     xlab="FICO Range", 
     main="Interest Rate vs FICO Range (Amount Requested Colored)",
     cex=0.7)
lmIRFR <- lm(loans$Interest.Rate ~ loans$FICO.Range.L)
lines(loans$FICO.Range.L,lmIRFR$fitted,
      col="Black",lwd=3)
plot(jitter(loans$FICO.Range.L,2), lmIRFR$residuals, 
     col=pcolor, pch=19,
     ylab="No adjust Residuals", 
     xlab="FICO Range ($)", 
     main="Interest Rate vs FICO Range (Amount Requested Colored)",
     cex=0.7)
summary(lmIRFR)


pcolor=cut(loans$Amount.Funded.By.Investors,10)
par(mfrow=c(2,1),mar=c(4,4,2,0.5),col=palette(heat.colors(10)))
plot(jitter(loans$FICO.Range.L,2),loans$Interest.Rate, pch=19,
     col=pcolor, 
     ylab="Interest Rate (%)", 
     xlab="FICO Range", 
     main="Interest Rate vs FICO Range (Amount Funded By Investor Colored)",
     cex=0.7)
lmIRFR <- lm(loans$Interest.Rate ~ loans$FICO.Range.L)
lines(loans$FICO.Range.L,lmIRFR$fitted,
      col="Black",lwd=3)
plot(jitter(loans$FICO.Range.L,2), lmIRFR$residuals, 
     col=pcolor, pch=19,
     ylab="No adjust Residuals", 
     xlab="FICO Range ($)", 
     main="Interest Rate vs FICO Range (Amount Funded By Investor Colored)",
     cex=0.7)
summary(lmIRFR)


pcolor=cut(loans$Debt.To.Income.Ratio,10)
par(mfrow=c(2,1),mar=c(4,4,2,0.5),col=palette(heat.colors(10)))
plot(jitter(loans$FICO.Range.L,2),loans$Interest.Rate, pch=19,
     col=pcolor,
     ylab="Interest Rate (%)", 
     xlab="FICO Range", 
     main="Interest Rate vs FICO Range (Debt to Income Ratio Colored)",
     cex=0.7)
lmIRFR <- lm(loans$Interest.Rate ~ loans$FICO.Range.L)
lines(loans$FICO.Range.L,lmIRFR$fitted,
      col="Black",lwd=3)
plot(jitter(loans$FICO.Range.L,2), lmIRFR$residuals, 
     col=pcolor, pch=19,
     ylab="No adjust Residuals", 
     xlab="FICO Range ($)", 
     main="Interest Rate vs FICO Range (Debt to Income Ratio Colored)",
     cex=0.7)
summary(lmIRFR)
