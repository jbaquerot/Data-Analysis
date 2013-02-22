#
#Question 1
#
#Load the movies data available from the course website here: 
  
# https://spark-public.s3.amazonaws.com/dataanalysis/movies.txt 

#Fit a linear regression model by least squares where the Rotten 
#Tomatoes score is the outcome and the box office gross is the 
#only covariate. What is the regression coefficient for the 
#slope and it's interpretation?

movies <- read.table("./data/movies.txt",sep="\t",
                     header=T,quote="")
plot(movies$box.office,movies$score,pch=19,col="blue")
lmScoreBoxOffice <- lm(movies$score ~ movies$box.office)
lines(movies$box.office,lmScoreBoxOffice$fitted,
     col="red",lwd=3)
summary(lmScoreBoxOffice)

#
#Question 2
#
#Load the movies data available from the course website here: 
  
#  https://spark-public.s3.amazonaws.com/dataanalysis/movies.txt 

#Fit a linear regression model by least squares where the Rotten
#Tomatoes score is the outcome and the box office gross is the 
#only covariate. What is the 90% confidence interval for the 
#intercept term and what can you deduce from the 90% confidence 
#interval?

confint(lmScoreBoxOffice, level=0.90)


#
#Question 3
#
#Load the movies data available from the course website here: 
  
#  https://spark-public.s3.amazonaws.com/dataanalysis/movies.txt 

#Fit a linear regression model by least squares where the Rotten
#Tomatoes score is the outcome and box office gross and running
#time are the covariates. What is the value for the regression 
#coefficient for running time? How is it interpreted?
lmScoreBORT <- lm(movies$score ~ movies$box.office+movies$running.time)
summary(lmScoreBORT)


#
#Question 4
#
#Load the movies data available from the course website here: 
  
#  https://spark-public.s3.amazonaws.com/dataanalysis/movies.txt 

#Fit a linear regression model by least squares where the Rotten
#Tomatoes score is the outcome and box office gross and running 
#time are the covariates. Is running time a confounder for the 
#relationship between Rotten Tomatoes score and box office gross? 
#Why or why not?
par(mfcol=c(1,3))
lmScoreRunningTime <- lm(movies$score ~ movies$running.time)
summary(lmScoreRunningTime)
plot(movies$running.time,movies$score,pch=19,col="blue")
lines(movies$running.time,lmScoreRunningTime$fitted,
      col="red",lwd=3)


lmBoxOfficeRunningTime <- lm(movies$box.office ~ movies$running.time)
summary(lmBoxOfficeRunningTime)
plot(movies$running.time,movies$box.office,pch=19,col="blue")
lines(movies$running.time,lmBoxOfficeRunningTime$fitted,
      col="red",lwd=3)

lmScoreBORT <- lm(movies$score ~ movies$box.office + movies$running.time)
plot(movies$running.time,movies$score,pch=19,col="blue",
     main="Regresion with all data")
abline(c(lmScoreBORT$coeff[1],lmScoreBORT$coeff[2]),
       col="red",lwd=3) 
abline(c(lmScoreBORT$coeff[1] + lmScoreBORT$coeff[3],
         lmScoreBORT$coeff[2] ),
       col="black",lwd=3)
summary(lmScoreBORT)

#
#Question 5
#
#Load the movies data available from the course website here: 
  
#  https://spark-public.s3.amazonaws.com/dataanalysis/movies.txt 

#Fit a linear regression model by least squares where the Rotten
#Tomatoes score is the outcome and box office gross and running 
#time are the covariates. Make a plot of the movie running times
#versus movie score. Do you see any outliers? If you do, remove 
#those data points and refit the same regression (Rotten Tomatoes
#score is the outcome and box office gross and running time are 
#the covariates). What do you observe?
par(mfcol=c(1,2))
lmScoreBORT <- lm(movies$score ~ movies$box.office + movies$running.time)
plot(movies$running.time,movies$score,pch=19,col="blue",
     main="Regresion with all data")
abline(c(lmScoreBORT$coeff[1],lmScoreBORT$coeff[2]),
       col="red",lwd=3) 
abline(c(lmScoreBORT$coeff[1] + lmScoreBORT$coeff[3],
         lmScoreBORT$coeff[2] ),
       col="black",lwd=3)
summary(lmScoreBORT)

moviesNoOutliers <- movies[movies$running.time < 175,]
lmScoreBORTNoOutlier <- lm(moviesNoOutliers$score ~ moviesNoOutliers$box.office + moviesNoOutliers$running.time)
plot(moviesNoOutliers$running.time,moviesNoOutliers$score,pch=19,col="blue",
     main="Regresion without outlier")
abline(c(lmScoreBORTNoOutlier$coeff[1],lmScoreBORTNoOutlier$coeff[2]),
       col="red",lwd=3) 
abline(c(lmScoreBORTNoOutlier$coeff[1] + lmScoreBORTNoOutlier$coeff[3],
         lmScoreBORTNoOutlier$coeff[2] ),
       col="black",lwd=3)
summary(lmScoreBORTNoOutlier)

#
#Question 6
#
#Load the movies data available from the course website here: 
  
#  https://spark-public.s3.amazonaws.com/dataanalysis/movies.txt 

#Fit a linear regression model by least squares where the Rotten
#Tomatoes score is the outcome and running time and box office 
#gross are covariates. What is the P-value for running time and
#how is it interpreted?
lmScoreBORT <- lm(movies$score ~ movies$box.office + movies$running.time)
summary(lmScoreBORT)


#
#Question 7
#
#Load the movies data available from the course website here: 
  
#  https://spark-public.s3.amazonaws.com/dataanalysis/movies.txt 

#Fit a linear model by least squares where Rotten Tomatoes score 
#is the outcome and the covariates are movie rating, running 
#time, and an interaction between running time and rating are 
#the covariates. What is the coefficient for the interaction 
#between running time and the indicator/dummy variable for PG 
#rating?
lmScoreBORTR <- lm(movies$score ~ as.factor(movies$rating) + movies$running.time + movies$running.time*as.factor(movies$rating))
summary(lmScoreBORTR)

#
#Question 8
#
#Load the movies data available from the course website here: 
  
#  https://spark-public.s3.amazonaws.com/dataanalysis/movies.txt 

#Fit a linear model by least squares where Rotten Tomatoes score
#is the outcome and the covariates are movie rating, running 
#time, and an interaction between running time and rating are 
#the covariates. What is the estimated average change in score 
#for a PG movie for a one minute increase in running time?
lmScoreBORTR <- lm(movies$score ~ movies$rating + movies$running.time + movies$running.time*movies$rating)
summary(lmScoreBORTR)


#
#Question 9
#Load the data on number of breaks during weaving into R with the command:
#  data(warpbreaks)
#Fit a linear model where the outcome is the number of breaks 
#and the covariate is tension. What is a 95% confidence interval
#for the average difference in number of breaks between medium 
#and high tension?
data(warpbreaks)
summary(warpbreaks)
lmBreaksTension <- lm(warpbreaks$breaks ~ relevel(warpbreaks$tension,ref="H"))
#lmBreaksTension <- aov(warpbreaks$breaks ~ warpbreaks$tension)
#TukeyHSD(lmBreaksTension)
summary(lmBreaksTension)
confint(lmBreaksTension, level=0.95)