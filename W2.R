#Exercices Week 2

#Question 2
#Open a connection to the old version of my blog: 
#http://simplystatistics.tumblr.com/ , read the first 150 
#lines of the file and assign them to a vector simplyStats. 
#Apply the nchar() function to simplyStats to count the 
#characters in each element of simplyStats. 
#How many characters long are the lines 2, 45, and 122?
cat("Question 2:")
cat("\n")
fileUrl <- "http://simplystatistics.tumblr.com/"
con <- url(fileUrl,"r") 
textLine <- readLines(con, n=150)
close(con)
cat("Number of characters in lines 2:", sapply(textLine, nchar)[2])
cat("\n")
cat("Number of characters in lines 45:", sapply(textLine, nchar)[45])
cat("\n")
cat("Number of characters in lines 122:", sapply(textLine, nchar)[122])
cat("\n")

#Question 3
#The American Community Survey distributes downloadable 
#data about United States communities. Download the 2006 
#microdata survey about housing for the state of Idaho 
#using download.file() from here:  
#https://dl.dropbox.com/u/7710864/data/csv_hid/ss06hid.csv or here 
#https://spark-public.s3.amazonaws.com/dataanalysis/ss06hid.csv 
#and load the data into R. You will use this data for the 
#next several questions. The code book, describing the 
#variable names is here:  
#https://dl.dropbox.com/u/7710864/data/PUMSDataDict06.pdf or here: 
#https://spark-public.s3.amazonaws.com/dataanalysis/PUMSDataDict06.pdf 
#How many housing units in this survey were worth more than 
#$1,000,000?
cat("Question 3")
cat("\n")
if(!file.exists("./data/ss06hid.csv")){
  fileUrl <- "https://dl.dropbox.com/u/7710864/data/csv_hid/ss06hid.csv"
  download.file(fileUrl, destfile="./data/ss06hid.csv", method="curl")   
}
housingStats <- read.csv("./data/ss06hid.csv") 
cat("housing units in this survey were worth more than $1,000,000: ", 
    sum(housingStats$VAL==24, na.rm=TRUE))
cat("\n")
#Question 4
#Use the data you loaded from Question 3. Consider the variable 
#FES. Which of the "tidy data" principles does this variable violate?
#1.-Tidy data has one observation per row.
#2.-Tidy data has variable values that are internally consistent.
#3.-Tidy data has no missing values.
#4.-Tidy data has one variable per column.
cat("Question 4")
cat("\n")
cat("Which of the \"tidy data\" principles does FES violate?")
cat("\n")
table(is.na(housingStats$FES))
cat("\n")

#Question 5
#Use the data you loaded from Question 3. 
#How many households have 3 bedrooms and and 4 total rooms? 
#How many households have 2 bedrooms and 5 total rooms? 
#How many households have 2 bedrooms and 7 total rooms?
cat("Question 5")
cat("\n")
cat("How many households have 3 bedrooms and 4 total rooms?: ", 
    sum(housingStats$BDS==3 & housingStats$RMS==4, na.rm=TRUE))
cat("\n")
cat("How many households have 2 bedrooms and 5 total rooms?: ",
    sum(housingStats$BDS==2 & housingStats$RMS==5, na.rm=TRUE))
cat("\n")
cat("How many households have 2 bedrooms and 7 total rooms?: ",
    sum(housingStats$BDS==2 & housingStats$RMS==7, na.rm=TRUE))
cat("\n")

#Question 6
#Use the data from Question 3. Create a logical vector 
#that identifies the households on greater than 10 acres 
#who sold more than $10,000 worth of agriculture products. 
#Assign that logical vector to the variable agricultureLogical. 
#Apply the which() function like this to identify the rows 
#of the data frame where the logical vector is TRUE.
agricultureLogical <- (housingStats$ACR==3 & housingStats$AGS==6 )
cat("Question 6")
cat("\n")
cat(" rows of the data frame where the logical vector is TRUE: ",
    which(agricultureLogical))
cat("\n")
#Question 7
#Note that we are subsetting this way because the NA values 
#in the variables will cause problems if you subset directly 
#with the logical statement. How many households in the subsetDataFrame 
#have a missing value for the mortgage status (MRGX) variable?
cat("Question 7")
cat("\n")
indexes =  which(agricultureLogical) 
subsetDataFrame = housingStats[indexes, ]
cat("How many households in the subsetDataFrame have a 
    missing value for the mortgage status (MRGX) variable?: ",
    sum(is.na(subsetDataFrame$MRGX)))
cat("\n")
#Question 8
#Use the data from Question 3. Apply strsplit() to split 
#all the names of the data frame on the characters "wgtp". 
#What is the value of the 123 element of the resulting list?
cat("Question 8")
cat("\n")
cat("What is the value of the 123 element of the resulting list?",
    strsplit(names(housingStats),"wgtp")[[123]])
cat("\n")
#Question 9
#What are the 0% and 100% quantiles of the variable YBL? 
#Is there anything wrong with these values? 
#Hint: you may need to use the na.rm parameter.
cat("Question 9")
cat("\n")
cat("What are the 0% and 100% quantiles of the variable YBL?",
    quantile(housingStats$YBL, na.rm=TRUE))
cat("\n")
cat("Is there anything wrong with these values?:",
    any(is.na(housingStats$YBL)))
cat("\n")

# Question 10
# In addition to the data from Question 3, the American 
# Community Survey also collects data about populations. 
# Using download.file(), download the population record data 
# from: 
# https://dl.dropbox.com/u/7710864/data/csv_hid/ss06pid.csv 
#  
# or here 
#  
# https://spark-public.s3.amazonaws.com/dataanalysis/ss06pid.csv 
#  
# Load the data into R. Assign the housing data from 
# Question 3 to a data frame housingData and the population 
# data from above to a data frame populationData. 
#  
# Use the merge command to merge these data sets based only
# on the common identifier "SERIALNO". What is the dimension 
# of the resulting data set? 
#  
# [OPTIONAL] For fun, you might look at the data and see 
# what happened when they merged. 
cat("Question 10")
cat("\n")
if(!file.exists("./data/ss06pid.csv")){
  urlFile = "https://spark-public.s3.amazonaws.com/dataanalysis/ss06pid.csv"
  download.file(urlFile, destfile="./data/ss06pid.csv", method="curl")
}
populationData = read.csv("./data/ss06pid.csv")
housingData = housingStats
housingPopulationData = merge(housingData, populationData, 
                              by.x="SERIALNO", 
                              by.y="SERIALNO",
                              all=TRUE)
cat("What is the dimension of the resulting data set? ",
    dim(housingPopulationData))
cat("\n")
