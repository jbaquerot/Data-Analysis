Samsung Analysis
========================================================

Load Library
--------------------------------------------------------

```r
library(tree)
library(stringr)
library(randomForest)
```

```
## randomForest 4.6-7
```

```
## Type rfNews() to see new features/changes/bug fixes.
```

```r

```



Processing
--------------------------------------------------------
Download the data & read the data in 


```r
setwd("/Users/Carlos/Dropbox/Courses/Data Analysis/Exercices/Data Analysis/Data Analysis 2/code/SamsungAnalysis/")
getwd()
```

```
## [1] "/Users/Carlos/Dropbox/Courses/Data Analysis/Exercices/Data Analysis/Data Analysis 2/code/SamsungAnalysis"
```

```r
if (!file.exists("../../data/samsungData.rda")) {
    download.file("https://spark-public.s3.amazonaws.com/dataanalysis/samsungData.rda", 
        destfile = "../../data/samsungData.rda", method = "curl")
    dateDownloaded <- date()
    dateDownloaded
}

load("../../data/samsungData.rda")
```

Munging Data
-------------------------------------------------------------


```r
punct <- c("\\(", "\\)", "\\-", "\\,")
for (i in punct) {
    names(samsungData) <- str_replace_all(names(samsungData), i, "_")
}
samsungData$activity <- as.factor(samsungData$activity)
samsungData$activityNum <- as.numeric(samsungData$activity)
```

### Look at the data set

```r
# head(samsungData) summary(samsungData) sapply(samsungData[1, ], class)
table(samsungData$activity)
```

```
## 
##   laying  sitting standing     walk walkdown   walkup 
##     1407     1286     1374     1226      986     1073
```

```r
table(mapply(FUN = class, samsungData))
```

```
## 
##  factor integer numeric 
##       1       1     562
```


### Find out about missing values

```r
sum(is.na(samsungData))
```

```
## [1] 0
```


Prediction
---------------------------------------------------------------
### 1. Find the right data


### 2. Define your error rate 

### 3. Split data into

#### Training
For this analysis the training set must include the data from subjects 1, 3, 5, and 6

```r
trainingSet <- samsungData[samsungData$subject == c(1, 3, 5, 6), ]
```


#### Testing
The test set is the data from subjects 27, 28, 29, and 30

```r
testSet <- samsungData[samsungData$subject == c(27, 28, 29, 30), ]
```



```r
for (i in 1:562) {
    ## plot(trainingSet[,i], pch=19, col=trainingSet$activityNum,
    ## ylab=names(trainingSet)[i])
    print(names(trainingSet)[i])
    boxplot(trainingSet[, i] ~ trainingSet$activity, data = trainingSet, main = names(trainingSet)[i], 
        ylab = names(trainingSet)[i])
}
```

```
## [1] "tBodyAcc_mean___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-81.png) 

```
## [1] "tBodyAcc_mean___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-82.png) 

```
## [1] "tBodyAcc_mean___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-83.png) 

```
## [1] "tBodyAcc_std___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-84.png) 

```
## [1] "tBodyAcc_std___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-85.png) 

```
## [1] "tBodyAcc_std___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-86.png) 

```
## [1] "tBodyAcc_mad___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-87.png) 

```
## [1] "tBodyAcc_mad___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-88.png) 

```
## [1] "tBodyAcc_mad___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-89.png) 

```
## [1] "tBodyAcc_max___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-810.png) 

```
## [1] "tBodyAcc_max___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-811.png) 

```
## [1] "tBodyAcc_max___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-812.png) 

```
## [1] "tBodyAcc_min___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-813.png) 

```
## [1] "tBodyAcc_min___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-814.png) 

```
## [1] "tBodyAcc_min___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-815.png) 

```
## [1] "tBodyAcc_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-816.png) 

```
## [1] "tBodyAcc_energy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-817.png) 

```
## [1] "tBodyAcc_energy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-818.png) 

```
## [1] "tBodyAcc_energy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-819.png) 

```
## [1] "tBodyAcc_iqr___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-820.png) 

```
## [1] "tBodyAcc_iqr___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-821.png) 

```
## [1] "tBodyAcc_iqr___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-822.png) 

```
## [1] "tBodyAcc_entropy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-823.png) 

```
## [1] "tBodyAcc_entropy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-824.png) 

```
## [1] "tBodyAcc_entropy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-825.png) 

```
## [1] "tBodyAcc_arCoeff___X_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-826.png) 

```
## [1] "tBodyAcc_arCoeff___X_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-827.png) 

```
## [1] "tBodyAcc_arCoeff___X_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-828.png) 

```
## [1] "tBodyAcc_arCoeff___X_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-829.png) 

```
## [1] "tBodyAcc_arCoeff___Y_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-830.png) 

```
## [1] "tBodyAcc_arCoeff___Y_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-831.png) 

```
## [1] "tBodyAcc_arCoeff___Y_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-832.png) 

```
## [1] "tBodyAcc_arCoeff___Y_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-833.png) 

```
## [1] "tBodyAcc_arCoeff___Z_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-834.png) 

```
## [1] "tBodyAcc_arCoeff___Z_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-835.png) 

```
## [1] "tBodyAcc_arCoeff___Z_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-836.png) 

```
## [1] "tBodyAcc_arCoeff___Z_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-837.png) 

```
## [1] "tBodyAcc_correlation___X_Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-838.png) 

```
## [1] "tBodyAcc_correlation___X_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-839.png) 

```
## [1] "tBodyAcc_correlation___Y_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-840.png) 

```
## [1] "tGravityAcc_mean___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-841.png) 

```
## [1] "tGravityAcc_mean___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-842.png) 

```
## [1] "tGravityAcc_mean___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-843.png) 

```
## [1] "tGravityAcc_std___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-844.png) 

```
## [1] "tGravityAcc_std___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-845.png) 

```
## [1] "tGravityAcc_std___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-846.png) 

```
## [1] "tGravityAcc_mad___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-847.png) 

```
## [1] "tGravityAcc_mad___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-848.png) 

```
## [1] "tGravityAcc_mad___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-849.png) 

```
## [1] "tGravityAcc_max___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-850.png) 

```
## [1] "tGravityAcc_max___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-851.png) 

```
## [1] "tGravityAcc_max___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-852.png) 

```
## [1] "tGravityAcc_min___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-853.png) 

```
## [1] "tGravityAcc_min___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-854.png) 

```
## [1] "tGravityAcc_min___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-855.png) 

```
## [1] "tGravityAcc_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-856.png) 

```
## [1] "tGravityAcc_energy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-857.png) 

```
## [1] "tGravityAcc_energy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-858.png) 

```
## [1] "tGravityAcc_energy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-859.png) 

```
## [1] "tGravityAcc_iqr___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-860.png) 

```
## [1] "tGravityAcc_iqr___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-861.png) 

```
## [1] "tGravityAcc_iqr___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-862.png) 

```
## [1] "tGravityAcc_entropy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-863.png) 

```
## [1] "tGravityAcc_entropy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-864.png) 

```
## [1] "tGravityAcc_entropy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-865.png) 

```
## [1] "tGravityAcc_arCoeff___X_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-866.png) 

```
## [1] "tGravityAcc_arCoeff___X_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-867.png) 

```
## [1] "tGravityAcc_arCoeff___X_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-868.png) 

```
## [1] "tGravityAcc_arCoeff___X_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-869.png) 

```
## [1] "tGravityAcc_arCoeff___Y_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-870.png) 

```
## [1] "tGravityAcc_arCoeff___Y_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-871.png) 

```
## [1] "tGravityAcc_arCoeff___Y_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-872.png) 

```
## [1] "tGravityAcc_arCoeff___Y_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-873.png) 

```
## [1] "tGravityAcc_arCoeff___Z_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-874.png) 

```
## [1] "tGravityAcc_arCoeff___Z_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-875.png) 

```
## [1] "tGravityAcc_arCoeff___Z_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-876.png) 

```
## [1] "tGravityAcc_arCoeff___Z_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-877.png) 

```
## [1] "tGravityAcc_correlation___X_Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-878.png) 

```
## [1] "tGravityAcc_correlation___X_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-879.png) 

```
## [1] "tGravityAcc_correlation___Y_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-880.png) 

```
## [1] "tBodyAccJerk_mean___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-881.png) 

```
## [1] "tBodyAccJerk_mean___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-882.png) 

```
## [1] "tBodyAccJerk_mean___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-883.png) 

```
## [1] "tBodyAccJerk_std___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-884.png) 

```
## [1] "tBodyAccJerk_std___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-885.png) 

```
## [1] "tBodyAccJerk_std___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-886.png) 

```
## [1] "tBodyAccJerk_mad___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-887.png) 

```
## [1] "tBodyAccJerk_mad___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-888.png) 

```
## [1] "tBodyAccJerk_mad___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-889.png) 

```
## [1] "tBodyAccJerk_max___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-890.png) 

```
## [1] "tBodyAccJerk_max___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-891.png) 

```
## [1] "tBodyAccJerk_max___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-892.png) 

```
## [1] "tBodyAccJerk_min___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-893.png) 

```
## [1] "tBodyAccJerk_min___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-894.png) 

```
## [1] "tBodyAccJerk_min___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-895.png) 

```
## [1] "tBodyAccJerk_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-896.png) 

```
## [1] "tBodyAccJerk_energy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-897.png) 

```
## [1] "tBodyAccJerk_energy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-898.png) 

```
## [1] "tBodyAccJerk_energy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-899.png) 

```
## [1] "tBodyAccJerk_iqr___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8100.png) 

```
## [1] "tBodyAccJerk_iqr___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8101.png) 

```
## [1] "tBodyAccJerk_iqr___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8102.png) 

```
## [1] "tBodyAccJerk_entropy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8103.png) 

```
## [1] "tBodyAccJerk_entropy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8104.png) 

```
## [1] "tBodyAccJerk_entropy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8105.png) 

```
## [1] "tBodyAccJerk_arCoeff___X_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8106.png) 

```
## [1] "tBodyAccJerk_arCoeff___X_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8107.png) 

```
## [1] "tBodyAccJerk_arCoeff___X_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8108.png) 

```
## [1] "tBodyAccJerk_arCoeff___X_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8109.png) 

```
## [1] "tBodyAccJerk_arCoeff___Y_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8110.png) 

```
## [1] "tBodyAccJerk_arCoeff___Y_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8111.png) 

```
## [1] "tBodyAccJerk_arCoeff___Y_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8112.png) 

```
## [1] "tBodyAccJerk_arCoeff___Y_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8113.png) 

```
## [1] "tBodyAccJerk_arCoeff___Z_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8114.png) 

```
## [1] "tBodyAccJerk_arCoeff___Z_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8115.png) 

```
## [1] "tBodyAccJerk_arCoeff___Z_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8116.png) 

```
## [1] "tBodyAccJerk_arCoeff___Z_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8117.png) 

```
## [1] "tBodyAccJerk_correlation___X_Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8118.png) 

```
## [1] "tBodyAccJerk_correlation___X_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8119.png) 

```
## [1] "tBodyAccJerk_correlation___Y_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8120.png) 

```
## [1] "tBodyGyro_mean___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8121.png) 

```
## [1] "tBodyGyro_mean___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8122.png) 

```
## [1] "tBodyGyro_mean___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8123.png) 

```
## [1] "tBodyGyro_std___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8124.png) 

```
## [1] "tBodyGyro_std___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8125.png) 

```
## [1] "tBodyGyro_std___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8126.png) 

```
## [1] "tBodyGyro_mad___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8127.png) 

```
## [1] "tBodyGyro_mad___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8128.png) 

```
## [1] "tBodyGyro_mad___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8129.png) 

```
## [1] "tBodyGyro_max___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8130.png) 

```
## [1] "tBodyGyro_max___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8131.png) 

```
## [1] "tBodyGyro_max___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8132.png) 

```
## [1] "tBodyGyro_min___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8133.png) 

```
## [1] "tBodyGyro_min___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8134.png) 

```
## [1] "tBodyGyro_min___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8135.png) 

```
## [1] "tBodyGyro_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8136.png) 

```
## [1] "tBodyGyro_energy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8137.png) 

```
## [1] "tBodyGyro_energy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8138.png) 

```
## [1] "tBodyGyro_energy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8139.png) 

```
## [1] "tBodyGyro_iqr___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8140.png) 

```
## [1] "tBodyGyro_iqr___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8141.png) 

```
## [1] "tBodyGyro_iqr___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8142.png) 

```
## [1] "tBodyGyro_entropy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8143.png) 

```
## [1] "tBodyGyro_entropy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8144.png) 

```
## [1] "tBodyGyro_entropy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8145.png) 

```
## [1] "tBodyGyro_arCoeff___X_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8146.png) 

```
## [1] "tBodyGyro_arCoeff___X_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8147.png) 

```
## [1] "tBodyGyro_arCoeff___X_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8148.png) 

```
## [1] "tBodyGyro_arCoeff___X_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8149.png) 

```
## [1] "tBodyGyro_arCoeff___Y_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8150.png) 

```
## [1] "tBodyGyro_arCoeff___Y_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8151.png) 

```
## [1] "tBodyGyro_arCoeff___Y_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8152.png) 

```
## [1] "tBodyGyro_arCoeff___Y_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8153.png) 

```
## [1] "tBodyGyro_arCoeff___Z_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8154.png) 

```
## [1] "tBodyGyro_arCoeff___Z_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8155.png) 

```
## [1] "tBodyGyro_arCoeff___Z_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8156.png) 

```
## [1] "tBodyGyro_arCoeff___Z_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8157.png) 

```
## [1] "tBodyGyro_correlation___X_Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8158.png) 

```
## [1] "tBodyGyro_correlation___X_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8159.png) 

```
## [1] "tBodyGyro_correlation___Y_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8160.png) 

```
## [1] "tBodyGyroJerk_mean___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8161.png) 

```
## [1] "tBodyGyroJerk_mean___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8162.png) 

```
## [1] "tBodyGyroJerk_mean___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8163.png) 

```
## [1] "tBodyGyroJerk_std___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8164.png) 

```
## [1] "tBodyGyroJerk_std___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8165.png) 

```
## [1] "tBodyGyroJerk_std___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8166.png) 

```
## [1] "tBodyGyroJerk_mad___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8167.png) 

```
## [1] "tBodyGyroJerk_mad___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8168.png) 

```
## [1] "tBodyGyroJerk_mad___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8169.png) 

```
## [1] "tBodyGyroJerk_max___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8170.png) 

```
## [1] "tBodyGyroJerk_max___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8171.png) 

```
## [1] "tBodyGyroJerk_max___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8172.png) 

```
## [1] "tBodyGyroJerk_min___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8173.png) 

```
## [1] "tBodyGyroJerk_min___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8174.png) 

```
## [1] "tBodyGyroJerk_min___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8175.png) 

```
## [1] "tBodyGyroJerk_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8176.png) 

```
## [1] "tBodyGyroJerk_energy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8177.png) 

```
## [1] "tBodyGyroJerk_energy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8178.png) 

```
## [1] "tBodyGyroJerk_energy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8179.png) 

```
## [1] "tBodyGyroJerk_iqr___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8180.png) 

```
## [1] "tBodyGyroJerk_iqr___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8181.png) 

```
## [1] "tBodyGyroJerk_iqr___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8182.png) 

```
## [1] "tBodyGyroJerk_entropy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8183.png) 

```
## [1] "tBodyGyroJerk_entropy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8184.png) 

```
## [1] "tBodyGyroJerk_entropy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8185.png) 

```
## [1] "tBodyGyroJerk_arCoeff___X_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8186.png) 

```
## [1] "tBodyGyroJerk_arCoeff___X_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8187.png) 

```
## [1] "tBodyGyroJerk_arCoeff___X_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8188.png) 

```
## [1] "tBodyGyroJerk_arCoeff___X_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8189.png) 

```
## [1] "tBodyGyroJerk_arCoeff___Y_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8190.png) 

```
## [1] "tBodyGyroJerk_arCoeff___Y_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8191.png) 

```
## [1] "tBodyGyroJerk_arCoeff___Y_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8192.png) 

```
## [1] "tBodyGyroJerk_arCoeff___Y_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8193.png) 

```
## [1] "tBodyGyroJerk_arCoeff___Z_1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8194.png) 

```
## [1] "tBodyGyroJerk_arCoeff___Z_2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8195.png) 

```
## [1] "tBodyGyroJerk_arCoeff___Z_3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8196.png) 

```
## [1] "tBodyGyroJerk_arCoeff___Z_4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8197.png) 

```
## [1] "tBodyGyroJerk_correlation___X_Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8198.png) 

```
## [1] "tBodyGyroJerk_correlation___X_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8199.png) 

```
## [1] "tBodyGyroJerk_correlation___Y_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8200.png) 

```
## [1] "tBodyAccMag_mean__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8201.png) 

```
## [1] "tBodyAccMag_std__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8202.png) 

```
## [1] "tBodyAccMag_mad__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8203.png) 

```
## [1] "tBodyAccMag_max__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8204.png) 

```
## [1] "tBodyAccMag_min__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8205.png) 

```
## [1] "tBodyAccMag_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8206.png) 

```
## [1] "tBodyAccMag_energy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8207.png) 

```
## [1] "tBodyAccMag_iqr__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8208.png) 

```
## [1] "tBodyAccMag_entropy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8209.png) 

```
## [1] "tBodyAccMag_arCoeff__1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8210.png) 

```
## [1] "tBodyAccMag_arCoeff__2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8211.png) 

```
## [1] "tBodyAccMag_arCoeff__3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8212.png) 

```
## [1] "tBodyAccMag_arCoeff__4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8213.png) 

```
## [1] "tGravityAccMag_mean__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8214.png) 

```
## [1] "tGravityAccMag_std__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8215.png) 

```
## [1] "tGravityAccMag_mad__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8216.png) 

```
## [1] "tGravityAccMag_max__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8217.png) 

```
## [1] "tGravityAccMag_min__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8218.png) 

```
## [1] "tGravityAccMag_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8219.png) 

```
## [1] "tGravityAccMag_energy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8220.png) 

```
## [1] "tGravityAccMag_iqr__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8221.png) 

```
## [1] "tGravityAccMag_entropy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8222.png) 

```
## [1] "tGravityAccMag_arCoeff__1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8223.png) 

```
## [1] "tGravityAccMag_arCoeff__2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8224.png) 

```
## [1] "tGravityAccMag_arCoeff__3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8225.png) 

```
## [1] "tGravityAccMag_arCoeff__4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8226.png) 

```
## [1] "tBodyAccJerkMag_mean__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8227.png) 

```
## [1] "tBodyAccJerkMag_std__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8228.png) 

```
## [1] "tBodyAccJerkMag_mad__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8229.png) 

```
## [1] "tBodyAccJerkMag_max__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8230.png) 

```
## [1] "tBodyAccJerkMag_min__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8231.png) 

```
## [1] "tBodyAccJerkMag_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8232.png) 

```
## [1] "tBodyAccJerkMag_energy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8233.png) 

```
## [1] "tBodyAccJerkMag_iqr__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8234.png) 

```
## [1] "tBodyAccJerkMag_entropy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8235.png) 

```
## [1] "tBodyAccJerkMag_arCoeff__1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8236.png) 

```
## [1] "tBodyAccJerkMag_arCoeff__2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8237.png) 

```
## [1] "tBodyAccJerkMag_arCoeff__3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8238.png) 

```
## [1] "tBodyAccJerkMag_arCoeff__4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8239.png) 

```
## [1] "tBodyGyroMag_mean__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8240.png) 

```
## [1] "tBodyGyroMag_std__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8241.png) 

```
## [1] "tBodyGyroMag_mad__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8242.png) 

```
## [1] "tBodyGyroMag_max__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8243.png) 

```
## [1] "tBodyGyroMag_min__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8244.png) 

```
## [1] "tBodyGyroMag_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8245.png) 

```
## [1] "tBodyGyroMag_energy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8246.png) 

```
## [1] "tBodyGyroMag_iqr__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8247.png) 

```
## [1] "tBodyGyroMag_entropy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8248.png) 

```
## [1] "tBodyGyroMag_arCoeff__1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8249.png) 

```
## [1] "tBodyGyroMag_arCoeff__2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8250.png) 

```
## [1] "tBodyGyroMag_arCoeff__3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8251.png) 

```
## [1] "tBodyGyroMag_arCoeff__4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8252.png) 

```
## [1] "tBodyGyroJerkMag_mean__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8253.png) 

```
## [1] "tBodyGyroJerkMag_std__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8254.png) 

```
## [1] "tBodyGyroJerkMag_mad__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8255.png) 

```
## [1] "tBodyGyroJerkMag_max__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8256.png) 

```
## [1] "tBodyGyroJerkMag_min__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8257.png) 

```
## [1] "tBodyGyroJerkMag_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8258.png) 

```
## [1] "tBodyGyroJerkMag_energy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8259.png) 

```
## [1] "tBodyGyroJerkMag_iqr__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8260.png) 

```
## [1] "tBodyGyroJerkMag_entropy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8261.png) 

```
## [1] "tBodyGyroJerkMag_arCoeff__1"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8262.png) 

```
## [1] "tBodyGyroJerkMag_arCoeff__2"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8263.png) 

```
## [1] "tBodyGyroJerkMag_arCoeff__3"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8264.png) 

```
## [1] "tBodyGyroJerkMag_arCoeff__4"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8265.png) 

```
## [1] "fBodyAcc_mean___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8266.png) 

```
## [1] "fBodyAcc_mean___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8267.png) 

```
## [1] "fBodyAcc_mean___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8268.png) 

```
## [1] "fBodyAcc_std___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8269.png) 

```
## [1] "fBodyAcc_std___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8270.png) 

```
## [1] "fBodyAcc_std___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8271.png) 

```
## [1] "fBodyAcc_mad___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8272.png) 

```
## [1] "fBodyAcc_mad___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8273.png) 

```
## [1] "fBodyAcc_mad___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8274.png) 

```
## [1] "fBodyAcc_max___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8275.png) 

```
## [1] "fBodyAcc_max___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8276.png) 

```
## [1] "fBodyAcc_max___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8277.png) 

```
## [1] "fBodyAcc_min___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8278.png) 

```
## [1] "fBodyAcc_min___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8279.png) 

```
## [1] "fBodyAcc_min___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8280.png) 

```
## [1] "fBodyAcc_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8281.png) 

```
## [1] "fBodyAcc_energy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8282.png) 

```
## [1] "fBodyAcc_energy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8283.png) 

```
## [1] "fBodyAcc_energy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8284.png) 

```
## [1] "fBodyAcc_iqr___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8285.png) 

```
## [1] "fBodyAcc_iqr___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8286.png) 

```
## [1] "fBodyAcc_iqr___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8287.png) 

```
## [1] "fBodyAcc_entropy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8288.png) 

```
## [1] "fBodyAcc_entropy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8289.png) 

```
## [1] "fBodyAcc_entropy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8290.png) 

```
## [1] "fBodyAcc_maxInds_X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8291.png) 

```
## [1] "fBodyAcc_maxInds_Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8292.png) 

```
## [1] "fBodyAcc_maxInds_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8293.png) 

```
## [1] "fBodyAcc_meanFreq___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8294.png) 

```
## [1] "fBodyAcc_meanFreq___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8295.png) 

```
## [1] "fBodyAcc_meanFreq___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8296.png) 

```
## [1] "fBodyAcc_skewness___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8297.png) 

```
## [1] "fBodyAcc_kurtosis___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8298.png) 

```
## [1] "fBodyAcc_skewness___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8299.png) 

```
## [1] "fBodyAcc_kurtosis___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8300.png) 

```
## [1] "fBodyAcc_skewness___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8301.png) 

```
## [1] "fBodyAcc_kurtosis___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8302.png) 

```
## [1] "fBodyAcc_bandsEnergy___1_8"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8303.png) 

```
## [1] "fBodyAcc_bandsEnergy___9_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8304.png) 

```
## [1] "fBodyAcc_bandsEnergy___17_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8305.png) 

```
## [1] "fBodyAcc_bandsEnergy___25_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8306.png) 

```
## [1] "fBodyAcc_bandsEnergy___33_40"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8307.png) 

```
## [1] "fBodyAcc_bandsEnergy___41_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8308.png) 

```
## [1] "fBodyAcc_bandsEnergy___49_56"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8309.png) 

```
## [1] "fBodyAcc_bandsEnergy___57_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8310.png) 

```
## [1] "fBodyAcc_bandsEnergy___1_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8311.png) 

```
## [1] "fBodyAcc_bandsEnergy___17_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8312.png) 

```
## [1] "fBodyAcc_bandsEnergy___33_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8313.png) 

```
## [1] "fBodyAcc_bandsEnergy___49_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8314.png) 

```
## [1] "fBodyAcc_bandsEnergy___1_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8315.png) 

```
## [1] "fBodyAcc_bandsEnergy___25_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8316.png) 

```
## [1] "fBodyAcc_bandsEnergy___1_8"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8317.png) 

```
## [1] "fBodyAcc_bandsEnergy___9_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8318.png) 

```
## [1] "fBodyAcc_bandsEnergy___17_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8319.png) 

```
## [1] "fBodyAcc_bandsEnergy___25_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8320.png) 

```
## [1] "fBodyAcc_bandsEnergy___33_40"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8321.png) 

```
## [1] "fBodyAcc_bandsEnergy___41_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8322.png) 

```
## [1] "fBodyAcc_bandsEnergy___49_56"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8323.png) 

```
## [1] "fBodyAcc_bandsEnergy___57_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8324.png) 

```
## [1] "fBodyAcc_bandsEnergy___1_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8325.png) 

```
## [1] "fBodyAcc_bandsEnergy___17_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8326.png) 

```
## [1] "fBodyAcc_bandsEnergy___33_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8327.png) 

```
## [1] "fBodyAcc_bandsEnergy___49_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8328.png) 

```
## [1] "fBodyAcc_bandsEnergy___1_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8329.png) 

```
## [1] "fBodyAcc_bandsEnergy___25_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8330.png) 

```
## [1] "fBodyAcc_bandsEnergy___1_8"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8331.png) 

```
## [1] "fBodyAcc_bandsEnergy___9_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8332.png) 

```
## [1] "fBodyAcc_bandsEnergy___17_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8333.png) 

```
## [1] "fBodyAcc_bandsEnergy___25_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8334.png) 

```
## [1] "fBodyAcc_bandsEnergy___33_40"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8335.png) 

```
## [1] "fBodyAcc_bandsEnergy___41_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8336.png) 

```
## [1] "fBodyAcc_bandsEnergy___49_56"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8337.png) 

```
## [1] "fBodyAcc_bandsEnergy___57_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8338.png) 

```
## [1] "fBodyAcc_bandsEnergy___1_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8339.png) 

```
## [1] "fBodyAcc_bandsEnergy___17_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8340.png) 

```
## [1] "fBodyAcc_bandsEnergy___33_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8341.png) 

```
## [1] "fBodyAcc_bandsEnergy___49_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8342.png) 

```
## [1] "fBodyAcc_bandsEnergy___1_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8343.png) 

```
## [1] "fBodyAcc_bandsEnergy___25_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8344.png) 

```
## [1] "fBodyAccJerk_mean___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8345.png) 

```
## [1] "fBodyAccJerk_mean___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8346.png) 

```
## [1] "fBodyAccJerk_mean___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8347.png) 

```
## [1] "fBodyAccJerk_std___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8348.png) 

```
## [1] "fBodyAccJerk_std___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8349.png) 

```
## [1] "fBodyAccJerk_std___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8350.png) 

```
## [1] "fBodyAccJerk_mad___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8351.png) 

```
## [1] "fBodyAccJerk_mad___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8352.png) 

```
## [1] "fBodyAccJerk_mad___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8353.png) 

```
## [1] "fBodyAccJerk_max___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8354.png) 

```
## [1] "fBodyAccJerk_max___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8355.png) 

```
## [1] "fBodyAccJerk_max___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8356.png) 

```
## [1] "fBodyAccJerk_min___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8357.png) 

```
## [1] "fBodyAccJerk_min___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8358.png) 

```
## [1] "fBodyAccJerk_min___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8359.png) 

```
## [1] "fBodyAccJerk_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8360.png) 

```
## [1] "fBodyAccJerk_energy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8361.png) 

```
## [1] "fBodyAccJerk_energy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8362.png) 

```
## [1] "fBodyAccJerk_energy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8363.png) 

```
## [1] "fBodyAccJerk_iqr___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8364.png) 

```
## [1] "fBodyAccJerk_iqr___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8365.png) 

```
## [1] "fBodyAccJerk_iqr___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8366.png) 

```
## [1] "fBodyAccJerk_entropy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8367.png) 

```
## [1] "fBodyAccJerk_entropy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8368.png) 

```
## [1] "fBodyAccJerk_entropy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8369.png) 

```
## [1] "fBodyAccJerk_maxInds_X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8370.png) 

```
## [1] "fBodyAccJerk_maxInds_Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8371.png) 

```
## [1] "fBodyAccJerk_maxInds_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8372.png) 

```
## [1] "fBodyAccJerk_meanFreq___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8373.png) 

```
## [1] "fBodyAccJerk_meanFreq___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8374.png) 

```
## [1] "fBodyAccJerk_meanFreq___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8375.png) 

```
## [1] "fBodyAccJerk_skewness___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8376.png) 

```
## [1] "fBodyAccJerk_kurtosis___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8377.png) 

```
## [1] "fBodyAccJerk_skewness___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8378.png) 

```
## [1] "fBodyAccJerk_kurtosis___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8379.png) 

```
## [1] "fBodyAccJerk_skewness___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8380.png) 

```
## [1] "fBodyAccJerk_kurtosis___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8381.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___1_8"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8382.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___9_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8383.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___17_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8384.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___25_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8385.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___33_40"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8386.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___41_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8387.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___49_56"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8388.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___57_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8389.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___1_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8390.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___17_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8391.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___33_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8392.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___49_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8393.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___1_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8394.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___25_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8395.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___1_8"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8396.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___9_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8397.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___17_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8398.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___25_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8399.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___33_40"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8400.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___41_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8401.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___49_56"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8402.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___57_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8403.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___1_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8404.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___17_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8405.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___33_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8406.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___49_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8407.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___1_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8408.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___25_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8409.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___1_8"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8410.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___9_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8411.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___17_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8412.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___25_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8413.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___33_40"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8414.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___41_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8415.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___49_56"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8416.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___57_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8417.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___1_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8418.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___17_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8419.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___33_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8420.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___49_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8421.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___1_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8422.png) 

```
## [1] "fBodyAccJerk_bandsEnergy___25_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8423.png) 

```
## [1] "fBodyGyro_mean___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8424.png) 

```
## [1] "fBodyGyro_mean___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8425.png) 

```
## [1] "fBodyGyro_mean___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8426.png) 

```
## [1] "fBodyGyro_std___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8427.png) 

```
## [1] "fBodyGyro_std___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8428.png) 

```
## [1] "fBodyGyro_std___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8429.png) 

```
## [1] "fBodyGyro_mad___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8430.png) 

```
## [1] "fBodyGyro_mad___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8431.png) 

```
## [1] "fBodyGyro_mad___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8432.png) 

```
## [1] "fBodyGyro_max___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8433.png) 

```
## [1] "fBodyGyro_max___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8434.png) 

```
## [1] "fBodyGyro_max___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8435.png) 

```
## [1] "fBodyGyro_min___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8436.png) 

```
## [1] "fBodyGyro_min___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8437.png) 

```
## [1] "fBodyGyro_min___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8438.png) 

```
## [1] "fBodyGyro_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8439.png) 

```
## [1] "fBodyGyro_energy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8440.png) 

```
## [1] "fBodyGyro_energy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8441.png) 

```
## [1] "fBodyGyro_energy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8442.png) 

```
## [1] "fBodyGyro_iqr___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8443.png) 

```
## [1] "fBodyGyro_iqr___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8444.png) 

```
## [1] "fBodyGyro_iqr___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8445.png) 

```
## [1] "fBodyGyro_entropy___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8446.png) 

```
## [1] "fBodyGyro_entropy___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8447.png) 

```
## [1] "fBodyGyro_entropy___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8448.png) 

```
## [1] "fBodyGyro_maxInds_X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8449.png) 

```
## [1] "fBodyGyro_maxInds_Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8450.png) 

```
## [1] "fBodyGyro_maxInds_Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8451.png) 

```
## [1] "fBodyGyro_meanFreq___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8452.png) 

```
## [1] "fBodyGyro_meanFreq___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8453.png) 

```
## [1] "fBodyGyro_meanFreq___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8454.png) 

```
## [1] "fBodyGyro_skewness___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8455.png) 

```
## [1] "fBodyGyro_kurtosis___X"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8456.png) 

```
## [1] "fBodyGyro_skewness___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8457.png) 

```
## [1] "fBodyGyro_kurtosis___Y"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8458.png) 

```
## [1] "fBodyGyro_skewness___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8459.png) 

```
## [1] "fBodyGyro_kurtosis___Z"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8460.png) 

```
## [1] "fBodyGyro_bandsEnergy___1_8"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8461.png) 

```
## [1] "fBodyGyro_bandsEnergy___9_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8462.png) 

```
## [1] "fBodyGyro_bandsEnergy___17_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8463.png) 

```
## [1] "fBodyGyro_bandsEnergy___25_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8464.png) 

```
## [1] "fBodyGyro_bandsEnergy___33_40"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8465.png) 

```
## [1] "fBodyGyro_bandsEnergy___41_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8466.png) 

```
## [1] "fBodyGyro_bandsEnergy___49_56"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8467.png) 

```
## [1] "fBodyGyro_bandsEnergy___57_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8468.png) 

```
## [1] "fBodyGyro_bandsEnergy___1_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8469.png) 

```
## [1] "fBodyGyro_bandsEnergy___17_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8470.png) 

```
## [1] "fBodyGyro_bandsEnergy___33_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8471.png) 

```
## [1] "fBodyGyro_bandsEnergy___49_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8472.png) 

```
## [1] "fBodyGyro_bandsEnergy___1_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8473.png) 

```
## [1] "fBodyGyro_bandsEnergy___25_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8474.png) 

```
## [1] "fBodyGyro_bandsEnergy___1_8"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8475.png) 

```
## [1] "fBodyGyro_bandsEnergy___9_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8476.png) 

```
## [1] "fBodyGyro_bandsEnergy___17_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8477.png) 

```
## [1] "fBodyGyro_bandsEnergy___25_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8478.png) 

```
## [1] "fBodyGyro_bandsEnergy___33_40"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8479.png) 

```
## [1] "fBodyGyro_bandsEnergy___41_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8480.png) 

```
## [1] "fBodyGyro_bandsEnergy___49_56"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8481.png) 

```
## [1] "fBodyGyro_bandsEnergy___57_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8482.png) 

```
## [1] "fBodyGyro_bandsEnergy___1_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8483.png) 

```
## [1] "fBodyGyro_bandsEnergy___17_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8484.png) 

```
## [1] "fBodyGyro_bandsEnergy___33_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8485.png) 

```
## [1] "fBodyGyro_bandsEnergy___49_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8486.png) 

```
## [1] "fBodyGyro_bandsEnergy___1_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8487.png) 

```
## [1] "fBodyGyro_bandsEnergy___25_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8488.png) 

```
## [1] "fBodyGyro_bandsEnergy___1_8"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8489.png) 

```
## [1] "fBodyGyro_bandsEnergy___9_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8490.png) 

```
## [1] "fBodyGyro_bandsEnergy___17_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8491.png) 

```
## [1] "fBodyGyro_bandsEnergy___25_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8492.png) 

```
## [1] "fBodyGyro_bandsEnergy___33_40"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8493.png) 

```
## [1] "fBodyGyro_bandsEnergy___41_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8494.png) 

```
## [1] "fBodyGyro_bandsEnergy___49_56"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8495.png) 

```
## [1] "fBodyGyro_bandsEnergy___57_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8496.png) 

```
## [1] "fBodyGyro_bandsEnergy___1_16"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8497.png) 

```
## [1] "fBodyGyro_bandsEnergy___17_32"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8498.png) 

```
## [1] "fBodyGyro_bandsEnergy___33_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8499.png) 

```
## [1] "fBodyGyro_bandsEnergy___49_64"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8500.png) 

```
## [1] "fBodyGyro_bandsEnergy___1_24"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8501.png) 

```
## [1] "fBodyGyro_bandsEnergy___25_48"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8502.png) 

```
## [1] "fBodyAccMag_mean__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8503.png) 

```
## [1] "fBodyAccMag_std__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8504.png) 

```
## [1] "fBodyAccMag_mad__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8505.png) 

```
## [1] "fBodyAccMag_max__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8506.png) 

```
## [1] "fBodyAccMag_min__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8507.png) 

```
## [1] "fBodyAccMag_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8508.png) 

```
## [1] "fBodyAccMag_energy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8509.png) 

```
## [1] "fBodyAccMag_iqr__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8510.png) 

```
## [1] "fBodyAccMag_entropy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8511.png) 

```
## [1] "fBodyAccMag_maxInds"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8512.png) 

```
## [1] "fBodyAccMag_meanFreq__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8513.png) 

```
## [1] "fBodyAccMag_skewness__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8514.png) 

```
## [1] "fBodyAccMag_kurtosis__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8515.png) 

```
## [1] "fBodyBodyAccJerkMag_mean__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8516.png) 

```
## [1] "fBodyBodyAccJerkMag_std__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8517.png) 

```
## [1] "fBodyBodyAccJerkMag_mad__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8518.png) 

```
## [1] "fBodyBodyAccJerkMag_max__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8519.png) 

```
## [1] "fBodyBodyAccJerkMag_min__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8520.png) 

```
## [1] "fBodyBodyAccJerkMag_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8521.png) 

```
## [1] "fBodyBodyAccJerkMag_energy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8522.png) 

```
## [1] "fBodyBodyAccJerkMag_iqr__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8523.png) 

```
## [1] "fBodyBodyAccJerkMag_entropy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8524.png) 

```
## [1] "fBodyBodyAccJerkMag_maxInds"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8525.png) 

```
## [1] "fBodyBodyAccJerkMag_meanFreq__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8526.png) 

```
## [1] "fBodyBodyAccJerkMag_skewness__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8527.png) 

```
## [1] "fBodyBodyAccJerkMag_kurtosis__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8528.png) 

```
## [1] "fBodyBodyGyroMag_mean__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8529.png) 

```
## [1] "fBodyBodyGyroMag_std__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8530.png) 

```
## [1] "fBodyBodyGyroMag_mad__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8531.png) 

```
## [1] "fBodyBodyGyroMag_max__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8532.png) 

```
## [1] "fBodyBodyGyroMag_min__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8533.png) 

```
## [1] "fBodyBodyGyroMag_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8534.png) 

```
## [1] "fBodyBodyGyroMag_energy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8535.png) 

```
## [1] "fBodyBodyGyroMag_iqr__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8536.png) 

```
## [1] "fBodyBodyGyroMag_entropy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8537.png) 

```
## [1] "fBodyBodyGyroMag_maxInds"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8538.png) 

```
## [1] "fBodyBodyGyroMag_meanFreq__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8539.png) 

```
## [1] "fBodyBodyGyroMag_skewness__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8540.png) 

```
## [1] "fBodyBodyGyroMag_kurtosis__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8541.png) 

```
## [1] "fBodyBodyGyroJerkMag_mean__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8542.png) 

```
## [1] "fBodyBodyGyroJerkMag_std__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8543.png) 

```
## [1] "fBodyBodyGyroJerkMag_mad__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8544.png) 

```
## [1] "fBodyBodyGyroJerkMag_max__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8545.png) 

```
## [1] "fBodyBodyGyroJerkMag_min__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8546.png) 

```
## [1] "fBodyBodyGyroJerkMag_sma__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8547.png) 

```
## [1] "fBodyBodyGyroJerkMag_energy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8548.png) 

```
## [1] "fBodyBodyGyroJerkMag_iqr__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8549.png) 

```
## [1] "fBodyBodyGyroJerkMag_entropy__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8550.png) 

```
## [1] "fBodyBodyGyroJerkMag_maxInds"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8551.png) 

```
## [1] "fBodyBodyGyroJerkMag_meanFreq__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8552.png) 

```
## [1] "fBodyBodyGyroJerkMag_skewness__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8553.png) 

```
## [1] "fBodyBodyGyroJerkMag_kurtosis__"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8554.png) 

```
## [1] "angle_tBodyAccMean_gravity_"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8555.png) 

```
## [1] "angle_tBodyAccJerkMean__gravityMean_"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8556.png) 

```
## [1] "angle_tBodyGyroMean_gravityMean_"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8557.png) 

```
## [1] "angle_tBodyGyroJerkMean_gravityMean_"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8558.png) 

```
## [1] "angle_X_gravityMean_"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8559.png) 

```
## [1] "angle_Y_gravityMean_"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8560.png) 

```
## [1] "angle_Z_gravityMean_"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8561.png) 

```
## [1] "subject"
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8562.png) 

```r

```


