#Question 1
#Below is a plot of bone density versus age. It was created using the following code in R:
#install.packages("ElemStatLearn")  
par(mfrow=c(1,2))
library(ElemStatLearn)
data(bone)
plot(bone$age,bone$spnbmd,pch=19,col=((bone$gender=="male")+1))

#Question 2
#Below is a boxplot of yearly income by marital status for individuals in the United States. It was created using the following code in R:

library(ElemStatLearn)
data(marketing)
plot(bone$age,bone$spnbmd,pch=19,col=((bone$gender=="male")+1))
boxplot(marketing$Income ~ marketing$Marital,col="grey",xaxt="n",ylab="Income",xlab="")
axis(side=1,at=1:5,labels=c("Married","Living together/not married","Divorced or separated","Widowed","Nevermarried"),las=2)
table(marketing$Marital)


#Question 3
#Load the iris data into R using the following commands:
  
library(datasets)
data(iris)

#Subset the iris data to the first four columns and call this 
#matrix irisSubset. Apply hierarchical clustering to the 
#irisSubset data frame to cluster the rows. 
#If I cut the dendrogram at a height of 3 how many 
#clusters result?
irisSubset <- data.frame(iris$Sepal.Length,iris$Sepal.Width, 
                         iris$Petal.Length,iris$Petal.Width)
distIrisSubset <- dist(irisSubset)
hClustering <- hclust(distIrisSubset)
par(mfrow=c(1,1))
plot(hClustering)


#Question 4
#Load the following data set into R using either the .rda or .csv file: 
  
# https://spark-public.s3.amazonaws.com/dataanalysis/quiz3question4.rda 
# https://spark-public.s3.amazonaws.com/dataanalysis/quiz3question4.csv 

#Make a scatterplot of the x versus y values. 
#How many clusters do you observe? 
#Perform k-means clustering using your estimate as to the number of clusters. 
#Color the scatterplot of the x, y values by what cluster they appear in. 
#Is there anything wrong with the resulting cluster estimates?
dataQ4 <- read.csv("./data/quiz3question4.csv")
plot(dataQ4$x,dataQ4$y, col="blue", pch=19)
dataFrame <- data.frame(dataQ4$x,dataQ4$y)
kmeansObj <- kmeans(dataFrame, centers=2)
plot(dataFrame$dataQ4.x,dataFrame$dataQ4.y,
     col=kmeansObj$cluster,pch=19,cex=0.5)
points(kmeansObj$centers,col=1:2,pch=3,cex=3,lwd=3)


#Question 5
#Load the hand-written digits data using the following commands:
  
library(ElemStatLearn)
data(zip.train)

#Each row of the zip.train data set corresponds to a 
#hand written digit. The first column of the zip.train 
#data is the actual digit. The next 256 columns are 
#the intensity values for an image of the digit. 
#To visualize the adigit we can use the zip2image() 
#function to convert a row into a 16 x 16 matrix:
  
# Create an image matrix for the 3rd row, which is a 4
im = zip2image(zip.train,3)
image(im)

#Using the zip2image file, create an image matrix for the 
#8th and 18th rows. For each image matrix calculate the svd 
#of the matrix (with no scaling). 
#What is the percent variance explained by the first singular 
#vector for the image from the 8th row? 
#What is the percent variance explained for the image from 
#the 18th row? 
#Why is the percent variance lower for the image from the 
#18th row?
par(mfcol=c(2,2))
im8 = zip2image(zip.train,8)
image(im8)
im18 = zip2image(zip.train,18)
image(im18)

#par(mfrow=c(1,2))
svd8 <- svd(im8)
plot(svd8$d^2/sum(svd8$d^2),pch=16,xlab="Singular vector 8", 
     ylab="Variance Explained")
svd18 <- svd(im18)
plot(svd18$d^2/sum(svd18$d^2),pch=16,xlab="Singular vector 18", 
     ylab="Variance Explained")

