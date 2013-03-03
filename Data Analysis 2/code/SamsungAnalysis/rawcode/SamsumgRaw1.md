Samsung Analysis
========================================================

Load Library
--------------------------------------------------------


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
samsungData$activity <- as.factor(samsungData$activity)
```

### Look at the data set

```r
# head(samsungData)
summary(samsungData)
```

```
##  tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tBodyAcc-std()-X
##  Min.   :-1.000    Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.000  
##  1st Qu.: 0.263    1st Qu.:-0.0249   1st Qu.:-0.1210   1st Qu.:-0.993  
##  Median : 0.277    Median :-0.0172   Median :-0.1087   Median :-0.946  
##  Mean   : 0.275    Mean   :-0.0177   Mean   :-0.1091   Mean   :-0.605  
##  3rd Qu.: 0.288    3rd Qu.:-0.0108   3rd Qu.:-0.0978   3rd Qu.:-0.243  
##  Max.   : 1.000    Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.000  
##  tBodyAcc-std()-Y  tBodyAcc-std()-Z tBodyAcc-mad()-X tBodyAcc-mad()-Y 
##  Min.   :-0.9999   Min.   :-1.000   Min.   :-1.000   Min.   :-1.0000  
##  1st Qu.:-0.9781   1st Qu.:-0.980   1st Qu.:-0.994   1st Qu.:-0.9782  
##  Median :-0.8519   Median :-0.859   Median :-0.951   Median :-0.8573  
##  Mean   :-0.5109   Mean   :-0.605   Mean   :-0.630   Mean   :-0.5269  
##  3rd Qu.:-0.0342   3rd Qu.:-0.262   3rd Qu.:-0.293   3rd Qu.:-0.0667  
##  Max.   : 0.9162   Max.   : 1.000   Max.   : 1.000   Max.   : 0.9677  
##  tBodyAcc-mad()-Z tBodyAcc-max()-X  tBodyAcc-max()-Y  tBodyAcc-max()-Z
##  Min.   :-1.000   Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.000  
##  1st Qu.:-0.980   1st Qu.:-0.9362   1st Qu.:-0.5636   1st Qu.:-0.813  
##  Median :-0.857   Median :-0.8816   Median :-0.4797   Median :-0.737  
##  Mean   :-0.606   Mean   :-0.4686   Mean   :-0.3060   Mean   :-0.557  
##  3rd Qu.:-0.266   3rd Qu.:-0.0171   3rd Qu.:-0.0654   3rd Qu.:-0.332  
##  Max.   : 1.000   Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.000  
##  tBodyAcc-min()-X tBodyAcc-min()-Y tBodyAcc-min()-Z tBodyAcc-sma()  
##  Min.   :-1.000   Min.   :-1.000   Min.   :-1.000   Min.   :-1.000  
##  1st Qu.: 0.197   1st Qu.: 0.102   1st Qu.: 0.390   1st Qu.:-0.983  
##  Median : 0.792   Median : 0.628   Median : 0.778   Median :-0.885  
##  Mean   : 0.524   Mean   : 0.387   Mean   : 0.594   Mean   :-0.548  
##  3rd Qu.: 0.844   3rd Qu.: 0.686   3rd Qu.: 0.837   3rd Qu.:-0.107  
##  Max.   : 1.000   Max.   : 1.000   Max.   : 1.000   Max.   : 1.000  
##  tBodyAcc-energy()-X tBodyAcc-energy()-Y tBodyAcc-energy()-Z
##  Min.   :-1.000      Min.   :-1.000      Min.   :-1.000     
##  1st Qu.:-1.000      1st Qu.:-1.000      1st Qu.:-1.000     
##  Median :-0.998      Median :-0.994      Median :-0.986     
##  Mean   :-0.820      Mean   :-0.902      Mean   :-0.846     
##  3rd Qu.:-0.711      3rd Qu.:-0.817      3rd Qu.:-0.748     
##  Max.   : 1.000      Max.   : 1.000      Max.   : 1.000     
##  tBodyAcc-iqr()-X tBodyAcc-iqr()-Y tBodyAcc-iqr()-Z tBodyAcc-entropy()-X
##  Min.   :-1.000   Min.   :-1.000   Min.   :-1.000   Min.   :-1.0000     
##  1st Qu.:-0.994   1st Qu.:-0.982   1st Qu.:-0.980   1st Qu.:-0.5734     
##  Median :-0.958   Median :-0.896   Median :-0.865   Median :-0.0734     
##  Mean   :-0.684   Mean   :-0.644   Mean   :-0.631   Mean   :-0.1030     
##  3rd Qu.:-0.393   3rd Qu.:-0.310   3rd Qu.:-0.316   3rd Qu.: 0.3365     
##  Max.   : 1.000   Max.   : 1.000   Max.   : 1.000   Max.   : 0.9197     
##  tBodyAcc-entropy()-Y tBodyAcc-entropy()-Z tBodyAcc-arCoeff()-X,1
##  Min.   :-1.000       Min.   :-1.000       Min.   :-0.926        
##  1st Qu.:-0.560       1st Qu.:-0.505       1st Qu.:-0.365        
##  Median :-0.137       Median :-0.149       Median :-0.129        
##  Mean   :-0.138       Mean   :-0.164       Mean   :-0.117        
##  3rd Qu.: 0.280       3rd Qu.: 0.164       3rd Qu.: 0.133        
##  Max.   : 1.000       Max.   : 1.000       Max.   : 1.000        
##  tBodyAcc-arCoeff()-X,2 tBodyAcc-arCoeff()-X,3 tBodyAcc-arCoeff()-X,4
##  Min.   :-0.9631        Min.   :-1.0000        Min.   :-0.8221       
##  1st Qu.:-0.0825        1st Qu.:-0.1906        1st Qu.:-0.0239       
##  Median : 0.0701        Median :-0.0190        Median : 0.1341       
##  Mean   : 0.1028        Mean   :-0.0378        Mean   : 0.1305       
##  3rd Qu.: 0.2769        3rd Qu.: 0.1286        3rd Qu.: 0.2853       
##  Max.   : 0.9784        Max.   : 1.0000        Max.   : 1.0000       
##  tBodyAcc-arCoeff()-Y,1 tBodyAcc-arCoeff()-Y,2 tBodyAcc-arCoeff()-Y,3
##  Min.   :-1.0000        Min.   :-1.0000        Min.   :-1.0000       
##  1st Qu.:-0.2219        1st Qu.:-0.1354        1st Qu.: 0.0344       
##  Median :-0.0407        Median : 0.0117        Median : 0.1684       
##  Mean   :-0.0262        Mean   : 0.0263        Mean   : 0.1600       
##  3rd Qu.: 0.1723        3rd Qu.: 0.1778        3rd Qu.: 0.2934       
##  Max.   : 1.0000        Max.   : 1.0000        Max.   : 1.0000       
##  tBodyAcc-arCoeff()-Y,4 tBodyAcc-arCoeff()-Z,1 tBodyAcc-arCoeff()-Z,2
##  Min.   :-1.0000        Min.   :-1.0000        Min.   :-0.7538       
##  1st Qu.:-0.1688        1st Qu.:-0.2073        1st Qu.:-0.1235       
##  Median :-0.0224        Median : 0.0290        Median : 0.0033       
##  Mean   :-0.0196        Mean   : 0.0094        Mean   : 0.0333       
##  3rd Qu.: 0.1309        3rd Qu.: 0.2310        3rd Qu.: 0.1756       
##  Max.   : 1.0000        Max.   : 0.8146        Max.   : 1.0000       
##  tBodyAcc-arCoeff()-Z,3 tBodyAcc-arCoeff()-Z,4 tBodyAcc-correlation()-X,Y
##  Min.   :-1.0000        Min.   :-1.0000        Min.   :-1.0000           
##  1st Qu.:-0.1065        1st Qu.:-0.2389        1st Qu.:-0.3739           
##  Median : 0.0494        Median :-0.0819        Median :-0.1637           
##  Mean   : 0.0366        Mean   :-0.0786        Mean   :-0.1251           
##  3rd Qu.: 0.1956        3rd Qu.: 0.0792        3rd Qu.: 0.0708           
##  Max.   : 0.9972        Max.   : 1.0000        Max.   : 1.0000           
##  tBodyAcc-correlation()-X,Z tBodyAcc-correlation()-Y,Z
##  Min.   :-1.0000            Min.   :-0.972            
##  1st Qu.:-0.4035            1st Qu.:-0.148            
##  Median :-0.1897            Median : 0.147            
##  Mean   :-0.1938            Mean   : 0.105            
##  3rd Qu.: 0.0052            3rd Qu.: 0.382            
##  Max.   : 1.0000            Max.   : 1.000            
##  tGravityAcc-mean()-X tGravityAcc-mean()-Y tGravityAcc-mean()-Z
##  Min.   :-1.000       Min.   :-0.535       Min.   :-1.0000     
##  1st Qu.: 0.805       1st Qu.:-0.239       1st Qu.:-0.1239     
##  Median : 0.919       Median :-0.144       Median : 0.0264     
##  Mean   : 0.664       Mean   : 0.011       Mean   : 0.0939     
##  3rd Qu.: 0.953       3rd Qu.: 0.148       3rd Qu.: 0.2330     
##  Max.   : 0.992       Max.   : 1.000       Max.   : 1.0000     
##  tGravityAcc-std()-X tGravityAcc-std()-Y tGravityAcc-std()-Z
##  Min.   :-1.000      Min.   :-1.000      Min.   :-1.000     
##  1st Qu.:-0.995      1st Qu.:-0.992      1st Qu.:-0.987     
##  Median :-0.982      Median :-0.976      Median :-0.966     
##  Mean   :-0.965      Mean   :-0.954      Mean   :-0.937     
##  3rd Qu.:-0.961      3rd Qu.:-0.947      3rd Qu.:-0.928     
##  Max.   : 1.000      Max.   : 1.000      Max.   : 1.000     
##  tGravityAcc-mad()-X tGravityAcc-mad()-Y tGravityAcc-mad()-Z
##  Min.   :-1.000      Min.   :-1.000      Min.   :-1.000     
##  1st Qu.:-0.995      1st Qu.:-0.992      1st Qu.:-0.987     
##  Median :-0.983      Median :-0.977      Median :-0.967     
##  Mean   :-0.965      Mean   :-0.955      Mean   :-0.938     
##  3rd Qu.:-0.962      3rd Qu.:-0.949      3rd Qu.:-0.930     
##  Max.   : 1.000      Max.   : 1.000      Max.   : 1.000     
##  tGravityAcc-max()-X tGravityAcc-max()-Y tGravityAcc-max()-Z
##  Min.   :-1.000      Min.   :-0.4939     Min.   :-1.0000    
##  1st Qu.: 0.743      1st Qu.:-0.2461     1st Qu.:-0.1158    
##  Median : 0.857      Median :-0.1516     Median : 0.0368    
##  Mean   : 0.604      Mean   :-0.0033     Mean   : 0.0990    
##  3rd Qu.: 0.887      3rd Qu.: 0.1416     3rd Qu.: 0.2313    
##  Max.   : 1.000      Max.   : 0.9683     Max.   : 0.9966    
##  tGravityAcc-min()-X tGravityAcc-min()-Y tGravityAcc-min()-Z
##  Min.   :-1.000      Min.   :-0.5682     Min.   :-1.0000    
##  1st Qu.: 0.804      1st Qu.:-0.2254     1st Qu.:-0.1421    
##  Median : 0.927      Median :-0.1293     Median : 0.0127    
##  Mean   : 0.678      Mean   : 0.0232     Mean   : 0.0806    
##  3rd Qu.: 0.965      3rd Qu.: 0.1407     3rd Qu.: 0.2240    
##  Max.   : 1.000      Max.   : 1.0000     Max.   : 1.0000    
##  tGravityAcc-sma() tGravityAcc-energy()-X tGravityAcc-energy()-Y
##  Min.   :-1.0000   Min.   :-1.000         Min.   :-1.000        
##  1st Qu.:-0.3985   1st Qu.: 0.504         1st Qu.:-0.967        
##  Median :-0.1089   Median : 0.785         Median :-0.910        
##  Mean   :-0.0783   Mean   : 0.437         Mean   :-0.730        
##  3rd Qu.: 0.2275   3rd Qu.: 0.872         3rd Qu.:-0.769        
##  Max.   : 1.0000   Max.   : 0.976         Max.   : 1.000        
##  tGravityAcc-energy()-Z tGravityAcc-iqr()-X tGravityAcc-iqr()-Y
##  Min.   :-1.000         Min.   :-1.000      Min.   :-1.000     
##  1st Qu.:-0.990         1st Qu.:-0.995      1st Qu.:-0.993     
##  Median :-0.942         Median :-0.985      Median :-0.980     
##  Mean   :-0.745         Mean   :-0.968      Mean   :-0.958     
##  3rd Qu.:-0.741         3rd Qu.:-0.965      3rd Qu.:-0.953     
##  Max.   : 1.000         Max.   : 1.000      Max.   : 1.000     
##  tGravityAcc-iqr()-Z tGravityAcc-entropy()-X tGravityAcc-entropy()-Y
##  Min.   :-1.000      Min.   :-1.000          Min.   :-1.000         
##  1st Qu.:-0.988      1st Qu.:-1.000          1st Qu.:-1.000         
##  Median :-0.971      Median :-0.745          Median :-1.000         
##  Mean   :-0.943      Mean   :-0.667          Mean   :-0.869         
##  3rd Qu.:-0.936      3rd Qu.:-0.392          3rd Qu.:-0.872         
##  Max.   : 1.000      Max.   : 1.000          Max.   : 1.000         
##  tGravityAcc-entropy()-Z tGravityAcc-arCoeff()-X,1
##  Min.   :-1.000          Min.   :-1.000           
##  1st Qu.:-1.000          1st Qu.:-0.660           
##  Median :-0.870          Median :-0.521           
##  Mean   :-0.685          Mean   :-0.516           
##  3rd Qu.:-0.425          3rd Qu.:-0.378           
##  Max.   : 1.000          Max.   : 1.000           
##  tGravityAcc-arCoeff()-X,2 tGravityAcc-arCoeff()-X,3
##  Min.   :-1.000            Min.   :-1.000           
##  1st Qu.: 0.414            1st Qu.:-0.748           
##  Median : 0.565            Median :-0.609           
##  Mean   : 0.553            Mean   :-0.590           
##  3rd Qu.: 0.703            3rd Qu.:-0.447           
##  Max.   : 1.000            Max.   : 1.000           
##  tGravityAcc-arCoeff()-X,4 tGravityAcc-arCoeff()-Y,1
##  Min.   :-1.000            Min.   :-1.000           
##  1st Qu.: 0.478            1st Qu.:-0.541           
##  Median : 0.652            Median :-0.342           
##  Mean   : 0.626            Mean   :-0.345           
##  3rd Qu.: 0.793            3rd Qu.:-0.147           
##  Max.   : 1.000            Max.   : 0.813           
##  tGravityAcc-arCoeff()-Y,2 tGravityAcc-arCoeff()-Y,3
##  Min.   :-0.954            Min.   :-1.000           
##  1st Qu.: 0.127            1st Qu.:-0.556           
##  Median : 0.327            Median :-0.360           
##  Mean   : 0.331            Mean   :-0.360           
##  3rd Qu.: 0.532            3rd Qu.:-0.170           
##  Max.   : 1.000            Max.   : 1.000           
##  tGravityAcc-arCoeff()-Y,4 tGravityAcc-arCoeff()-Z,1
##  Min.   :-1.000            Min.   :-1.000           
##  1st Qu.: 0.227            1st Qu.:-0.623           
##  Median : 0.420            Median :-0.430           
##  Mean   : 0.407            Mean   :-0.431           
##  3rd Qu.: 0.603            3rd Qu.:-0.248           
##  Max.   : 1.000            Max.   : 0.649           
##  tGravityAcc-arCoeff()-Z,2 tGravityAcc-arCoeff()-Z,3
##  Min.   :-0.618            Min.   :-1.000           
##  1st Qu.: 0.278            1st Qu.:-0.667           
##  Median : 0.453            Median :-0.480           
##  Mean   : 0.456            Mean   :-0.481           
##  3rd Qu.: 0.645            3rd Qu.:-0.305           
##  Max.   : 1.000            Max.   : 0.586           
##  tGravityAcc-arCoeff()-Z,4 tGravityAcc-correlation()-X,Y
##  Min.   :-0.554            Min.   :-1.000               
##  1st Qu.: 0.330            1st Qu.:-0.469               
##  Median : 0.504            Median : 0.393               
##  Mean   : 0.502            Mean   : 0.187               
##  3rd Qu.: 0.687            3rd Qu.: 0.845               
##  Max.   : 1.000            Max.   : 1.000               
##  tGravityAcc-correlation()-X,Z tGravityAcc-correlation()-Y,Z
##  Min.   :-1.000                Min.   :-1.0000              
##  1st Qu.:-0.809                1st Qu.:-0.6067              
##  Median :-0.217                Median : 0.1852              
##  Mean   :-0.105                Mean   : 0.0887              
##  3rd Qu.: 0.597                3rd Qu.: 0.7845              
##  Max.   : 1.000                Max.   : 1.0000              
##  tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z
##  Min.   :-1.0000       Min.   :-1.0000       Min.   :-1.0000      
##  1st Qu.: 0.0636       1st Qu.:-0.0167       1st Qu.:-0.0308      
##  Median : 0.0760       Median : 0.0107       Median :-0.0011      
##  Mean   : 0.0791       Mean   : 0.0086       Mean   :-0.0047      
##  3rd Qu.: 0.0910       3rd Qu.: 0.0325       3rd Qu.: 0.0248      
##  Max.   : 1.0000       Max.   : 1.0000       Max.   : 1.0000      
##  tBodyAccJerk-std()-X tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z
##  Min.   :-1.000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.992       1st Qu.:-0.986       1st Qu.:-0.990      
##  Median :-0.959       Median :-0.932       Median :-0.959      
##  Mean   :-0.644       Mean   :-0.611       Mean   :-0.760      
##  3rd Qu.:-0.288       3rd Qu.:-0.217       3rd Qu.:-0.545      
##  Max.   : 1.000       Max.   : 0.807       Max.   : 1.000      
##  tBodyAccJerk-mad()-X tBodyAccJerk-mad()-Y tBodyAccJerk-mad()-Z
##  Min.   :-1.000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.992       1st Qu.:-0.985       1st Qu.:-0.988      
##  Median :-0.963       Median :-0.935       Median :-0.959      
##  Mean   :-0.640       Mean   :-0.595       Mean   :-0.754      
##  3rd Qu.:-0.279       3rd Qu.:-0.181       3rd Qu.:-0.531      
##  Max.   : 1.000       Max.   : 1.000       Max.   : 1.000      
##  tBodyAccJerk-max()-X tBodyAccJerk-max()-Y tBodyAccJerk-max()-Z
##  Min.   :-1.000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.992       1st Qu.:-0.991       1st Qu.:-0.990      
##  Median :-0.954       Median :-0.946       Median :-0.960      
##  Mean   :-0.700       Mean   :-0.751       Mean   :-0.818      
##  3rd Qu.:-0.465       3rd Qu.:-0.534       3rd Qu.:-0.681      
##  Max.   : 1.000       Max.   : 0.624       Max.   : 1.000      
##  tBodyAccJerk-min()-X tBodyAccJerk-min()-Y tBodyAccJerk-min()-Z
##  Min.   :-1.000       Min.   :-0.747       Min.   :-1.000      
##  1st Qu.: 0.253       1st Qu.: 0.403       1st Qu.: 0.525      
##  Median : 0.946       Median : 0.941       Median : 0.948      
##  Mean   : 0.624       Mean   : 0.688       Mean   : 0.736      
##  3rd Qu.: 0.990       3rd Qu.: 0.989       3rd Qu.: 0.987      
##  Max.   : 1.000       Max.   : 1.000       Max.   : 0.999      
##  tBodyAccJerk-sma() tBodyAccJerk-energy()-X tBodyAccJerk-energy()-Y
##  Min.   :-1.000     Min.   :-1.000          Min.   :-1.000         
##  1st Qu.:-0.990     1st Qu.:-1.000          1st Qu.:-1.000         
##  Median :-0.953     Median :-0.999          Median :-0.997         
##  Mean   :-0.648     Mean   :-0.850          Mean   :-0.828         
##  3rd Qu.:-0.283     3rd Qu.:-0.744          3rd Qu.:-0.689         
##  Max.   : 1.000     Max.   : 1.000          Max.   : 0.634         
##  tBodyAccJerk-energy()-Z tBodyAccJerk-iqr()-X tBodyAccJerk-iqr()-Y
##  Min.   :-1.000          Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-1.000          1st Qu.:-0.990       1st Qu.:-0.984      
##  Median :-0.999          Median :-0.967       Median :-0.948      
##  Mean   :-0.927          Mean   :-0.629       Mean   :-0.658      
##  3rd Qu.:-0.891          3rd Qu.:-0.263       3rd Qu.:-0.322      
##  Max.   : 1.000          Max.   : 1.000       Max.   : 1.000      
##  tBodyAccJerk-iqr()-Z tBodyAccJerk-entropy()-X tBodyAccJerk-entropy()-Y
##  Min.   :-1.000       Min.   :-1.0000          Min.   :-1.0000         
##  1st Qu.:-0.987       1st Qu.:-0.7372          1st Qu.:-0.7389         
##  Median :-0.962       Median :-0.3860          Median :-0.3191         
##  Mean   :-0.769       Mean   :-0.0994          Mean   :-0.0997         
##  3rd Qu.:-0.575       3rd Qu.: 0.5896          3rd Qu.: 0.5704         
##  Max.   : 1.000       Max.   : 1.0000          Max.   : 1.0000         
##  tBodyAccJerk-entropy()-Z tBodyAccJerk-arCoeff()-X,1
##  Min.   :-1.000           Min.   :-0.975            
##  1st Qu.:-0.729           1st Qu.:-0.357            
##  Median :-0.426           Median :-0.112            
##  Mean   :-0.134           Mean   :-0.107            
##  3rd Qu.: 0.497           3rd Qu.: 0.144            
##  Max.   : 1.000           Max.   : 1.000            
##  tBodyAccJerk-arCoeff()-X,2 tBodyAccJerk-arCoeff()-X,3
##  Min.   :-1.0000            Min.   :-1.0000           
##  1st Qu.: 0.0406            1st Qu.:-0.0897           
##  Median : 0.1650            Median : 0.0734           
##  Mean   : 0.1620            Mean   : 0.0636           
##  3rd Qu.: 0.2844            3rd Qu.: 0.2292           
##  Max.   : 1.0000            Max.   : 0.9646           
##  tBodyAccJerk-arCoeff()-X,4 tBodyAccJerk-arCoeff()-Y,1
##  Min.   :-1.0000            Min.   :-1.0000           
##  1st Qu.:-0.0094            1st Qu.:-0.2774           
##  Median : 0.1281            Median :-0.0815           
##  Mean   : 0.1207            Mean   :-0.0693           
##  3rd Qu.: 0.2573            3rd Qu.: 0.1482           
##  Max.   : 1.0000            Max.   : 1.0000           
##  tBodyAccJerk-arCoeff()-Y,2 tBodyAccJerk-arCoeff()-Y,3
##  Min.   :-1.0000            Min.   :-1.0000           
##  1st Qu.:-0.0687            1st Qu.: 0.0175           
##  Median : 0.0610            Median : 0.1849           
##  Mean   : 0.0644            Mean   : 0.1730           
##  3rd Qu.: 0.2039            3rd Qu.: 0.3414           
##  Max.   : 1.0000            Max.   : 0.9916           
##  tBodyAccJerk-arCoeff()-Y,4 tBodyAccJerk-arCoeff()-Z,1
##  Min.   :-1.000             Min.   :-1.0000           
##  1st Qu.: 0.192             1st Qu.:-0.2362           
##  Median : 0.327             Median :-0.0075           
##  Mean   : 0.322             Mean   :-0.0300           
##  3rd Qu.: 0.461             3rd Qu.: 0.1853           
##  Max.   : 1.000             Max.   : 0.9252           
##  tBodyAccJerk-arCoeff()-Z,2 tBodyAccJerk-arCoeff()-Z,3
##  Min.   :-0.7991            Min.   :-1.0000           
##  1st Qu.:-0.0426            1st Qu.:-0.1453           
##  Median : 0.0833            Median : 0.0118           
##  Mean   : 0.0836            Mean   :-0.0036           
##  3rd Qu.: 0.2082            3rd Qu.: 0.1597           
##  Max.   : 1.0000            Max.   : 0.9335           
##  tBodyAccJerk-arCoeff()-Z,4 tBodyAccJerk-correlation()-X,Y
##  Min.   :-1.0000            Min.   :-1.0000               
##  1st Qu.:-0.0151            1st Qu.:-0.3105               
##  Median : 0.1539            Median :-0.1447               
##  Mean   : 0.1395            Mean   :-0.1448               
##  3rd Qu.: 0.3017            3rd Qu.: 0.0201               
##  Max.   : 1.0000            Max.   : 0.9045               
##  tBodyAccJerk-correlation()-X,Z tBodyAccJerk-correlation()-Y,Z
##  Min.   :-1.0000                Min.   :-0.9595               
##  1st Qu.:-0.1934                1st Qu.:-0.0979               
##  Median : 0.0173                Median : 0.0799               
##  Mean   : 0.0086                Mean   : 0.0883               
##  3rd Qu.: 0.2131                3rd Qu.: 0.2686               
##  Max.   : 0.9933                Max.   : 1.0000               
##  tBodyGyro-mean()-X tBodyGyro-mean()-Y tBodyGyro-mean()-Z
##  Min.   :-0.9140    Min.   :-0.8520    Min.   :-0.9029   
##  1st Qu.:-0.0434    1st Qu.:-0.1036    1st Qu.: 0.0641   
##  Median :-0.0277    Median :-0.0748    Median : 0.0861   
##  Mean   :-0.0272    Mean   :-0.0762    Mean   : 0.0866   
##  3rd Qu.:-0.0105    3rd Qu.:-0.0521    3rd Qu.: 0.1096   
##  Max.   : 0.7390    Max.   : 1.0000    Max.   : 1.0000   
##  tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z tBodyGyro-mad()-X
##  Min.   :-1.000    Min.   :-1.000    Min.   :-1.000    Min.   :-1.000   
##  1st Qu.:-0.988    1st Qu.:-0.984    1st Qu.:-0.987    1st Qu.:-0.989   
##  Median :-0.911    Median :-0.917    Median :-0.890    Median :-0.918   
##  Mean   :-0.721    Mean   :-0.676    Mean   :-0.654    Mean   :-0.726   
##  3rd Qu.:-0.478    3rd Qu.:-0.430    3rd Qu.:-0.333    3rd Qu.:-0.488   
##  Max.   : 1.000    Max.   : 1.000    Max.   : 1.000    Max.   : 1.000   
##  tBodyGyro-mad()-Y tBodyGyro-mad()-Z tBodyGyro-max()-X tBodyGyro-max()-Y
##  Min.   :-1.000    Min.   :-1.000    Min.   :-1.000    Min.   :-0.998   
##  1st Qu.:-0.985    1st Qu.:-0.988    1st Qu.:-0.879    1st Qu.:-0.948   
##  Median :-0.924    Median :-0.897    Median :-0.804    Median :-0.896   
##  Mean   :-0.689    Mean   :-0.667    Mean   :-0.643    Mean   :-0.733   
##  3rd Qu.:-0.448    3rd Qu.:-0.359    3rd Qu.:-0.430    3rd Qu.:-0.572   
##  Max.   : 1.000    Max.   : 1.000    Max.   : 1.000    Max.   : 1.000   
##  tBodyGyro-max()-Z tBodyGyro-min()-X tBodyGyro-min()-Y tBodyGyro-min()-Z
##  Min.   :-0.943    Min.   :-1.000    Min.   :-1.000    Min.   :-1.000   
##  1st Qu.:-0.751    1st Qu.: 0.463    1st Qu.: 0.598    1st Qu.: 0.317   
##  Median :-0.656    Median : 0.778    Median : 0.857    Median : 0.749   
##  Mean   :-0.486    Mean   : 0.634    Mean   : 0.732    Mean   : 0.561   
##  3rd Qu.:-0.257    3rd Qu.: 0.839    3rd Qu.: 0.907    3rd Qu.: 0.824   
##  Max.   : 1.000    Max.   : 1.000    Max.   : 1.000    Max.   : 1.000   
##  tBodyGyro-sma()  tBodyGyro-energy()-X tBodyGyro-energy()-Y
##  Min.   :-1.000   Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.980   1st Qu.:-1.000       1st Qu.:-1.000      
##  Median :-0.832   Median :-0.992       Median :-0.993      
##  Mean   :-0.600   Mean   :-0.900       Mean   :-0.877      
##  3rd Qu.:-0.230   3rd Qu.:-0.836       3rd Qu.:-0.835      
##  Max.   : 1.000   Max.   : 1.000       Max.   : 1.000      
##  tBodyGyro-energy()-Z tBodyGyro-iqr()-X tBodyGyro-iqr()-Y
##  Min.   :-1.000       Min.   :-1.000    Min.   :-1.000   
##  1st Qu.:-1.000       1st Qu.:-0.990    1st Qu.:-0.987   
##  Median :-0.984       Median :-0.929    Median :-0.936   
##  Mean   :-0.871       Mean   :-0.730    Mean   :-0.713   
##  3rd Qu.:-0.786       3rd Qu.:-0.496    3rd Qu.:-0.495   
##  Max.   : 1.000       Max.   : 1.000    Max.   : 1.000   
##  tBodyGyro-iqr()-Z tBodyGyro-entropy()-X tBodyGyro-entropy()-Y
##  Min.   :-1.000    Min.   :-1.000        Min.   :-1.0000      
##  1st Qu.:-0.990    1st Qu.:-0.517        1st Qu.:-0.3722      
##  Median :-0.917    Median :-0.181        Median :-0.0842      
##  Mean   :-0.719    Mean   :-0.147        Mean   :-0.1101      
##  3rd Qu.:-0.468    3rd Qu.: 0.193        3rd Qu.: 0.1717      
##  Max.   : 1.000    Max.   : 1.000        Max.   : 0.9728      
##  tBodyGyro-entropy()-Z tBodyGyro-arCoeff()-X,1 tBodyGyro-arCoeff()-X,2
##  Min.   :-1.0000       Min.   :-1.0000         Min.   :-1.0000        
##  1st Qu.:-0.4834       1st Qu.:-0.4311         1st Qu.:-0.0288        
##  Median : 0.0113       Median :-0.2375         Median : 0.1325        
##  Mean   :-0.0757       Mean   :-0.2199         Mean   : 0.1417        
##  3rd Qu.: 0.3054       3rd Qu.:-0.0163         3rd Qu.: 0.2996        
##  Max.   : 1.0000       Max.   : 1.0000         Max.   : 1.0000        
##  tBodyGyro-arCoeff()-X,3 tBodyGyro-arCoeff()-X,4 tBodyGyro-arCoeff()-Y,1
##  Min.   :-1.0000         Min.   :-0.9666         Min.   :-1.0000        
##  1st Qu.:-0.0007         1st Qu.:-0.2545         1st Qu.:-0.3500        
##  Median : 0.1545         Median :-0.0827         Median :-0.2075        
##  Mean   : 0.1391         Mean   :-0.0854         Mean   :-0.2031        
##  3rd Qu.: 0.2918         3rd Qu.: 0.0786         3rd Qu.:-0.0592        
##  Max.   : 1.0000         Max.   : 0.8527         Max.   : 1.0000        
##  tBodyGyro-arCoeff()-Y,2 tBodyGyro-arCoeff()-Y,3 tBodyGyro-arCoeff()-Y,4
##  Min.   :-1.000          Min.   :-0.9625         Min.   :-1.000         
##  1st Qu.: 0.028          1st Qu.:-0.1827         1st Qu.:-0.001         
##  Median : 0.160          Median :-0.0312         Median : 0.141         
##  Mean   : 0.165          Mean   :-0.0355         Mean   : 0.138         
##  3rd Qu.: 0.296          3rd Qu.: 0.1207         3rd Qu.: 0.280         
##  Max.   : 1.000          Max.   : 1.0000         Max.   : 1.000         
##  tBodyGyro-arCoeff()-Z,1 tBodyGyro-arCoeff()-Z,2 tBodyGyro-arCoeff()-Z,3
##  Min.   :-0.9072         Min.   :-0.9234         Min.   :-0.9473        
##  1st Qu.:-0.3354         1st Qu.:-0.1801         1st Qu.:-0.1934        
##  Median :-0.1051         Median : 0.0624         Median : 0.0155        
##  Mean   :-0.0806         Mean   : 0.0622         Mean   :-0.0041        
##  3rd Qu.: 0.1762         3rd Qu.: 0.2929         3rd Qu.: 0.1952        
##  Max.   : 0.8661         Max.   : 0.9452         Max.   : 1.0000        
##  tBodyGyro-arCoeff()-Z,4 tBodyGyro-correlation()-X,Y
##  Min.   :-1.0000         Min.   :-1.0000            
##  1st Qu.:-0.0314         1st Qu.:-0.4530            
##  Median : 0.1469         Median :-0.1903            
##  Mean   : 0.1482         Mean   :-0.1731            
##  3rd Qu.: 0.3258         3rd Qu.: 0.0906            
##  Max.   : 0.9851         Max.   : 1.0000            
##  tBodyGyro-correlation()-X,Z tBodyGyro-correlation()-Y,Z
##  Min.   :-1.0000             Min.   :-1.000             
##  1st Qu.:-0.2545             1st Qu.:-0.438             
##  Median :-0.0221             Median :-0.113             
##  Mean   : 0.0010             Mean   :-0.117             
##  3rd Qu.: 0.2503             3rd Qu.: 0.189             
##  Max.   : 1.0000             Max.   : 1.000             
##  tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z
##  Min.   :-1.0000        Min.   :-1.0000        Min.   :-1.0000       
##  1st Qu.:-0.1170        1st Qu.:-0.0590        1st Qu.:-0.0784       
##  Median :-0.0983        Median :-0.0406        Median :-0.0546       
##  Mean   :-0.0979        Mean   :-0.0425        Mean   :-0.0543       
##  3rd Qu.:-0.0807        3rd Qu.:-0.0256        3rd Qu.:-0.0324       
##  Max.   : 1.0000        Max.   : 0.8480        Max.   : 1.0000       
##  tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z
##  Min.   :-1.000        Min.   :-1.000        Min.   :-1.000       
##  1st Qu.:-0.991        1st Qu.:-0.993        1st Qu.:-0.994       
##  Median :-0.943        Median :-0.960        Median :-0.956       
##  Mean   :-0.730        Mean   :-0.784        Mean   :-0.742       
##  3rd Qu.:-0.484        3rd Qu.:-0.629        3rd Qu.:-0.508       
##  Max.   : 1.000        Max.   : 1.000        Max.   : 1.000       
##  tBodyGyroJerk-mad()-X tBodyGyroJerk-mad()-Y tBodyGyroJerk-mad()-Z
##  Min.   :-1.000        Min.   :-1.000        Min.   :-1.000       
##  1st Qu.:-0.992        1st Qu.:-0.993        1st Qu.:-0.994       
##  Median :-0.950        Median :-0.966        Median :-0.962       
##  Mean   :-0.728        Mean   :-0.794        Mean   :-0.748       
##  3rd Qu.:-0.475        3rd Qu.:-0.642        3rd Qu.:-0.512       
##  Max.   : 1.000        Max.   : 1.000        Max.   : 1.000       
##  tBodyGyroJerk-max()-X tBodyGyroJerk-max()-Y tBodyGyroJerk-max()-Z
##  Min.   :-1.000        Min.   :-1.000        Min.   :-1.000       
##  1st Qu.:-0.991        1st Qu.:-0.993        1st Qu.:-0.992       
##  Median :-0.936        Median :-0.958        Median :-0.945       
##  Mean   :-0.751        Mean   :-0.808        Mean   :-0.747       
##  3rd Qu.:-0.545        3rd Qu.:-0.687        3rd Qu.:-0.532       
##  Max.   : 0.928        Max.   : 1.000        Max.   : 0.979       
##  tBodyGyroJerk-min()-X tBodyGyroJerk-min()-Y tBodyGyroJerk-min()-Z
##  Min.   :-1.000        Min.   :-1.000        Min.   :-0.760       
##  1st Qu.: 0.559        1st Qu.: 0.721        1st Qu.: 0.646       
##  Median : 0.942        Median : 0.964        Median : 0.961       
##  Mean   : 0.760        Mean   : 0.830        Mean   : 0.801       
##  3rd Qu.: 0.991        3rd Qu.: 0.994        3rd Qu.: 0.994       
##  Max.   : 1.000        Max.   : 1.000        Max.   : 1.000       
##  tBodyGyroJerk-sma() tBodyGyroJerk-energy()-X tBodyGyroJerk-energy()-Y
##  Min.   :-1.000      Min.   :-1.000           Min.   :-1.000          
##  1st Qu.:-0.994      1st Qu.:-1.000           1st Qu.:-1.000          
##  Median :-0.962      Median :-0.998           Median :-0.999          
##  Mean   :-0.765      Mean   :-0.914           Mean   :-0.936          
##  3rd Qu.:-0.550      3rd Qu.:-0.865           3rd Qu.:-0.931          
##  Max.   : 1.000      Max.   : 1.000           Max.   : 1.000          
##  tBodyGyroJerk-energy()-Z tBodyGyroJerk-iqr()-X tBodyGyroJerk-iqr()-Y
##  Min.   :-1.000           Min.   :-1.000        Min.   :-1.000       
##  1st Qu.:-1.000           1st Qu.:-0.992        1st Qu.:-0.994       
##  Median :-0.999           Median :-0.959        Median :-0.973       
##  Mean   :-0.919           Mean   :-0.734        Mean   :-0.806       
##  3rd Qu.:-0.877           3rd Qu.:-0.481        3rd Qu.:-0.660       
##  Max.   : 1.000           Max.   : 1.000        Max.   : 1.000       
##  tBodyGyroJerk-iqr()-Z tBodyGyroJerk-entropy()-X tBodyGyroJerk-entropy()-Y
##  Min.   :-1.000        Min.   :-1.0000           Min.   :-1.0000          
##  1st Qu.:-0.994        1st Qu.:-0.5956           1st Qu.:-0.5390          
##  Median :-0.971        Median :-0.0819           Median :-0.0418          
##  Mean   :-0.767        Mean   :-0.0275           Mean   : 0.0015          
##  3rd Qu.:-0.542        3rd Qu.: 0.5491           3rd Qu.: 0.5517          
##  Max.   : 1.000        Max.   : 1.0000           Max.   : 0.9909          
##  tBodyGyroJerk-entropy()-Z tBodyGyroJerk-arCoeff()-X,1
##  Min.   :-1.0000           Min.   :-0.9059            
##  1st Qu.:-0.6275           1st Qu.:-0.2559            
##  Median :-0.1740           Median :-0.0862            
##  Mean   :-0.0291           Mean   :-0.0708            
##  3rd Qu.: 0.5704           3rd Qu.: 0.1105            
##  Max.   : 1.0000           Max.   : 1.0000            
##  tBodyGyroJerk-arCoeff()-X,2 tBodyGyroJerk-arCoeff()-X,3
##  Min.   :-1.0000             Min.   :-1.0000            
##  1st Qu.:-0.0856             1st Qu.: 0.0242            
##  Median : 0.0320             Median : 0.1663            
##  Mean   : 0.0343             Mean   : 0.1610            
##  3rd Qu.: 0.1503             3rd Qu.: 0.3044            
##  Max.   : 1.0000             Max.   : 1.0000            
##  tBodyGyroJerk-arCoeff()-X,4 tBodyGyroJerk-arCoeff()-Y,1
##  Min.   :-1.0000             Min.   :-0.9211            
##  1st Qu.: 0.0417             1st Qu.:-0.3164            
##  Median : 0.1803             Median :-0.1659            
##  Mean   : 0.1736             Mean   :-0.1601            
##  3rd Qu.: 0.3117             3rd Qu.:-0.0163            
##  Max.   : 1.0000             Max.   : 1.0000            
##  tBodyGyroJerk-arCoeff()-Y,2 tBodyGyroJerk-arCoeff()-Y,3
##  Min.   :-1.0000             Min.   :-0.7736            
##  1st Qu.: 0.0873             1st Qu.:-0.0394            
##  Median : 0.1955             Median : 0.0936            
##  Mean   : 0.1940             Mean   : 0.0851            
##  3rd Qu.: 0.2959             3rd Qu.: 0.2165            
##  Max.   : 0.8974             Max.   : 0.9990            
##  tBodyGyroJerk-arCoeff()-Y,4 tBodyGyroJerk-arCoeff()-Z,1
##  Min.   :-1.0000             Min.   :-0.9528            
##  1st Qu.:-0.0779             1st Qu.:-0.3123            
##  Median : 0.0826             Median :-0.0614            
##  Mean   : 0.0828             Mean   :-0.0259            
##  3rd Qu.: 0.2472             3rd Qu.: 0.2615            
##  Max.   : 0.9234             Max.   : 0.9456            
##  tBodyGyroJerk-arCoeff()-Z,2 tBodyGyroJerk-arCoeff()-Z,3
##  Min.   :-1.0000             Min.   :-0.9539            
##  1st Qu.:-0.1115             1st Qu.:-0.0798            
##  Median : 0.0380             Median : 0.0966            
##  Mean   : 0.0494             Mean   : 0.0873            
##  3rd Qu.: 0.2080             3rd Qu.: 0.2661            
##  Max.   : 1.0000             Max.   : 1.0000            
##  tBodyGyroJerk-arCoeff()-Z,4 tBodyGyroJerk-correlation()-X,Y
##  Min.   :-0.9545             Min.   :-0.8953                
##  1st Qu.:-0.1263             1st Qu.:-0.1467                
##  Median : 0.0459             Median : 0.0378                
##  Mean   : 0.0397             Mean   : 0.0415                
##  3rd Qu.: 0.2101             3rd Qu.: 0.2253                
##  Max.   : 1.0000             Max.   : 1.0000                
##  tBodyGyroJerk-correlation()-X,Z tBodyGyroJerk-correlation()-Y,Z
##  Min.   :-1.0000                 Min.   :-1.0000                
##  1st Qu.:-0.1203                 1st Qu.:-0.3001                
##  Median : 0.0478                 Median :-0.1305                
##  Mean   : 0.0491                 Mean   :-0.1286                
##  3rd Qu.: 0.2157                 3rd Qu.: 0.0356                
##  Max.   : 1.0000                 Max.   : 0.9968                
##  tBodyAccMag-mean() tBodyAccMag-std() tBodyAccMag-mad() tBodyAccMag-max()
##  Min.   :-1.000     Min.   :-1.000    Min.   :-1.000    Min.   :-1.000   
##  1st Qu.:-0.983     1st Qu.:-0.983    1st Qu.:-0.985    1st Qu.:-0.981   
##  Median :-0.883     Median :-0.854    Median :-0.870    Median :-0.863   
##  Mean   :-0.544     Mean   :-0.589    Mean   :-0.639    Mean   :-0.557   
##  3rd Qu.:-0.107     3rd Qu.:-0.233    3rd Qu.:-0.324    3rd Qu.:-0.156   
##  Max.   : 1.000     Max.   : 1.000    Max.   : 1.000    Max.   : 1.000   
##  tBodyAccMag-min() tBodyAccMag-sma() tBodyAccMag-energy()
##  Min.   :-1.000    Min.   :-1.000    Min.   :-1.000      
##  1st Qu.:-0.993    1st Qu.:-0.983    1st Qu.:-1.000      
##  Median :-0.969    Median :-0.883    Median :-0.990      
##  Mean   :-0.839    Mean   :-0.544    Mean   :-0.771      
##  3rd Qu.:-0.696    3rd Qu.:-0.107    3rd Qu.:-0.590      
##  Max.   : 1.000    Max.   : 1.000    Max.   : 1.000      
##  tBodyAccMag-iqr() tBodyAccMag-entropy() tBodyAccMag-arCoeff()1
##  Min.   :-1.000    Min.   :-0.995        Min.   :-1.0000       
##  1st Qu.:-0.985    1st Qu.:-0.566        1st Qu.:-0.2957       
##  Median :-0.888    Median : 0.144        Median :-0.0766       
##  Mean   :-0.696    Mean   : 0.124        Mean   :-0.0725       
##  3rd Qu.:-0.437    3rd Qu.: 0.808        3rd Qu.: 0.1395       
##  Max.   : 1.000    Max.   : 1.000        Max.   : 1.0000       
##  tBodyAccMag-arCoeff()2 tBodyAccMag-arCoeff()3 tBodyAccMag-arCoeff()4
##  Min.   :-1.0000        Min.   :-1.0000        Min.   :-1.0000       
##  1st Qu.:-0.1513        1st Qu.:-0.1083        1st Qu.:-0.2368       
##  Median : 0.0182        Median : 0.0695        Median :-0.0582       
##  Mean   : 0.0250        Mean   : 0.0607        Mean   :-0.0587       
##  3rd Qu.: 0.1921        3rd Qu.: 0.2391        3rd Qu.: 0.1264       
##  Max.   : 1.0000        Max.   : 0.9947        Max.   : 1.0000       
##  tGravityAccMag-mean() tGravityAccMag-std() tGravityAccMag-mad()
##  Min.   :-1.000        Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.983        1st Qu.:-0.983       1st Qu.:-0.985      
##  Median :-0.883        Median :-0.854       Median :-0.870      
##  Mean   :-0.544        Mean   :-0.589       Mean   :-0.639      
##  3rd Qu.:-0.107        3rd Qu.:-0.233       3rd Qu.:-0.324      
##  Max.   : 1.000        Max.   : 1.000       Max.   : 1.000      
##  tGravityAccMag-max() tGravityAccMag-min() tGravityAccMag-sma()
##  Min.   :-1.000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.981       1st Qu.:-0.993       1st Qu.:-0.983      
##  Median :-0.863       Median :-0.969       Median :-0.883      
##  Mean   :-0.557       Mean   :-0.839       Mean   :-0.544      
##  3rd Qu.:-0.156       3rd Qu.:-0.696       3rd Qu.:-0.107      
##  Max.   : 1.000       Max.   : 1.000       Max.   : 1.000      
##  tGravityAccMag-energy() tGravityAccMag-iqr() tGravityAccMag-entropy()
##  Min.   :-1.000          Min.   :-1.000       Min.   :-0.995          
##  1st Qu.:-1.000          1st Qu.:-0.985       1st Qu.:-0.566          
##  Median :-0.990          Median :-0.888       Median : 0.144          
##  Mean   :-0.771          Mean   :-0.696       Mean   : 0.124          
##  3rd Qu.:-0.590          3rd Qu.:-0.437       3rd Qu.: 0.808          
##  Max.   : 1.000          Max.   : 1.000       Max.   : 1.000          
##  tGravityAccMag-arCoeff()1 tGravityAccMag-arCoeff()2
##  Min.   :-1.0000           Min.   :-1.0000          
##  1st Qu.:-0.2957           1st Qu.:-0.1513          
##  Median :-0.0766           Median : 0.0182          
##  Mean   :-0.0725           Mean   : 0.0250          
##  3rd Qu.: 0.1395           3rd Qu.: 0.1921          
##  Max.   : 1.0000           Max.   : 1.0000          
##  tGravityAccMag-arCoeff()3 tGravityAccMag-arCoeff()4
##  Min.   :-1.0000           Min.   :-1.0000          
##  1st Qu.:-0.1083           1st Qu.:-0.2368          
##  Median : 0.0695           Median :-0.0582          
##  Mean   : 0.0607           Mean   :-0.0587          
##  3rd Qu.: 0.2391           3rd Qu.: 0.1264          
##  Max.   : 0.9947           Max.   : 1.0000          
##  tBodyAccJerkMag-mean() tBodyAccJerkMag-std() tBodyAccJerkMag-mad()
##  Min.   :-1.000         Min.   :-1.000        Min.   :-1.000       
##  1st Qu.:-0.990         1st Qu.:-0.991        1st Qu.:-0.992       
##  Median :-0.954         Median :-0.939        Median :-0.946       
##  Mean   :-0.650         Mean   :-0.633        Mean   :-0.651       
##  3rd Qu.:-0.287         3rd Qu.:-0.275        3rd Qu.:-0.310       
##  Max.   : 1.000         Max.   : 1.000        Max.   : 1.000       
##  tBodyAccJerkMag-max() tBodyAccJerkMag-min() tBodyAccJerkMag-sma()
##  Min.   :-1.000        Min.   :-1.000        Min.   :-1.000       
##  1st Qu.:-0.990        1st Qu.:-0.984        1st Qu.:-0.990       
##  Median :-0.936        Median :-0.964        Median :-0.954       
##  Mean   :-0.643        Mean   :-0.786        Mean   :-0.650       
##  3rd Qu.:-0.298        3rd Qu.:-0.606        3rd Qu.:-0.287       
##  Max.   : 0.984        Max.   : 1.000        Max.   : 1.000       
##  tBodyAccJerkMag-energy() tBodyAccJerkMag-iqr() tBodyAccJerkMag-entropy()
##  Min.   :-1.000           Min.   :-1.000        Min.   :-1.0000          
##  1st Qu.:-1.000           1st Qu.:-0.992        1st Qu.:-0.8086          
##  Median :-0.998           Median :-0.960        Median :-0.3557          
##  Mean   :-0.850           Mean   :-0.702        Mean   :-0.0741          
##  3rd Qu.:-0.729           3rd Qu.:-0.412        3rd Qu.: 0.7044          
##  Max.   : 1.000           Max.   : 1.000        Max.   : 1.0000          
##  tBodyAccJerkMag-arCoeff()1 tBodyAccJerkMag-arCoeff()2
##  Min.   :-1.0000            Min.   :-1.0000           
##  1st Qu.:-0.0892            1st Qu.:-0.2124           
##  Median : 0.0918            Median :-0.0574           
##  Mean   : 0.0794            Mean   :-0.0297           
##  3rd Qu.: 0.2613            3rd Qu.: 0.1383           
##  Max.   : 0.8628            Max.   : 1.0000           
##  tBodyAccJerkMag-arCoeff()3 tBodyAccJerkMag-arCoeff()4 tBodyGyroMag-mean()
##  Min.   :-0.8306            Min.   :-1.0000            Min.   :-1.000     
##  1st Qu.:-0.2432            1st Qu.:-0.2252            1st Qu.:-0.980     
##  Median :-0.0872            Median :-0.0515            Median :-0.835     
##  Mean   :-0.0843            Mean   :-0.0494            Mean   :-0.603     
##  3rd Qu.: 0.0676            3rd Qu.: 0.1230            3rd Qu.:-0.233     
##  Max.   : 0.9143            Max.   : 0.9743            Max.   : 1.000     
##  tBodyGyroMag-std() tBodyGyroMag-mad() tBodyGyroMag-max()
##  Min.   :-1.000     Min.   :-1.000     Min.   :-1.000    
##  1st Qu.:-0.980     1st Qu.:-0.978     1st Qu.:-0.982    
##  Median :-0.838     Median :-0.819     Median :-0.861    
##  Mean   :-0.656     Mean   :-0.623     Mean   :-0.692    
##  3rd Qu.:-0.371     3rd Qu.:-0.307     3rd Qu.:-0.440    
##  Max.   : 1.000     Max.   : 1.000     Max.   : 1.000    
##  tBodyGyroMag-min() tBodyGyroMag-sma() tBodyGyroMag-energy()
##  Min.   :-1.000     Min.   :-1.000     Min.   :-1.000       
##  1st Qu.:-0.989     1st Qu.:-0.980     1st Qu.:-1.000       
##  Median :-0.899     Median :-0.835     Median :-0.984       
##  Mean   :-0.735     Mean   :-0.603     Mean   :-0.830       
##  3rd Qu.:-0.535     3rd Qu.:-0.233     3rd Qu.:-0.693       
##  Max.   : 1.000     Max.   : 1.000     Max.   : 1.000       
##  tBodyGyroMag-iqr() tBodyGyroMag-entropy() tBodyGyroMag-arCoeff()1
##  Min.   :-1.000     Min.   :-1.000         Min.   :-1.000         
##  1st Qu.:-0.981     1st Qu.:-0.192         1st Qu.:-0.240         
##  Median :-0.830     Median : 0.259         Median :-0.036         
##  Mean   :-0.647     Mean   : 0.210         Mean   :-0.030         
##  3rd Qu.:-0.349     3rd Qu.: 0.635         3rd Qu.: 0.178         
##  Max.   : 0.969     Max.   : 0.993         Max.   : 0.994         
##  tBodyGyroMag-arCoeff()2 tBodyGyroMag-arCoeff()3 tBodyGyroMag-arCoeff()4
##  Min.   :-1.0000         Min.   :-0.8999         Min.   :-0.9974        
##  1st Qu.:-0.2553         1st Qu.:-0.0514         1st Qu.:-0.2194        
##  Median :-0.0758         Median : 0.1151         Median :-0.0610        
##  Mean   :-0.0666         Mean   : 0.1115         Mean   :-0.0587        
##  3rd Qu.: 0.1109         3rd Qu.: 0.2784         3rd Qu.: 0.1042        
##  Max.   : 1.0000         Max.   : 0.9946         Max.   : 1.0000        
##  tBodyGyroJerkMag-mean() tBodyGyroJerkMag-std() tBodyGyroJerkMag-mad()
##  Min.   :-1.000          Min.   :-1.000         Min.   :-1.000        
##  1st Qu.:-0.993          1st Qu.:-0.993         1st Qu.:-0.994        
##  Median :-0.961          Median :-0.948         Median :-0.955        
##  Mean   :-0.760          Mean   :-0.778         Mean   :-0.792        
##  3rd Qu.:-0.544          3rd Qu.:-0.609         3rd Qu.:-0.627        
##  Max.   : 1.000          Max.   : 1.000         Max.   : 1.000        
##  tBodyGyroJerkMag-max() tBodyGyroJerkMag-min() tBodyGyroJerkMag-sma()
##  Min.   :-1.000         Min.   :-1.000         Min.   :-1.000        
##  1st Qu.:-0.993         1st Qu.:-0.991         1st Qu.:-0.993        
##  Median :-0.949         Median :-0.974         Median :-0.961        
##  Mean   :-0.785         Mean   :-0.802         Mean   :-0.760        
##  3rd Qu.:-0.633         3rd Qu.:-0.638         3rd Qu.:-0.544        
##  Max.   : 1.000         Max.   : 1.000         Max.   : 1.000        
##  tBodyGyroJerkMag-energy() tBodyGyroJerkMag-iqr()
##  Min.   :-1.000            Min.   :-1.000        
##  1st Qu.:-1.000            1st Qu.:-0.995        
##  Median :-0.999            Median :-0.963        
##  Mean   :-0.929            Mean   :-0.805        
##  3rd Qu.:-0.898            3rd Qu.:-0.641        
##  Max.   : 1.000            Max.   : 1.000        
##  tBodyGyroJerkMag-entropy() tBodyGyroJerkMag-arCoeff()1
##  Min.   :-1.0000            Min.   :-1.000             
##  1st Qu.:-0.6082            1st Qu.: 0.131             
##  Median : 0.0358            Median : 0.295             
##  Mean   : 0.1104            Mean   : 0.280             
##  3rd Qu.: 0.8435            3rd Qu.: 0.449             
##  Max.   : 1.0000            Max.   : 0.993             
##  tBodyGyroJerkMag-arCoeff()2 tBodyGyroJerkMag-arCoeff()3
##  Min.   :-0.9977             Min.   :-1.0000            
##  1st Qu.:-0.3686             1st Qu.:-0.1913            
##  Median :-0.2304             Median :-0.0474            
##  Mean   :-0.2224             Mean   :-0.0486            
##  3rd Qu.:-0.0932             3rd Qu.: 0.0962            
##  Max.   : 1.0000             Max.   : 0.8803            
##  tBodyGyroJerkMag-arCoeff()4 fBodyAcc-mean()-X fBodyAcc-mean()-Y
##  Min.   :-1.000              Min.   :-1.000    Min.   :-1.0000  
##  1st Qu.:-0.285              1st Qu.:-0.992    1st Qu.:-0.9804  
##  Median :-0.129              Median :-0.950    Median :-0.8770  
##  Mean   :-0.117              Mean   :-0.623    Mean   :-0.5390  
##  3rd Qu.: 0.041              3rd Qu.:-0.255    3rd Qu.:-0.0892  
##  Max.   : 0.837              Max.   : 1.000    Max.   : 0.9718  
##  fBodyAcc-mean()-Z fBodyAcc-std()-X fBodyAcc-std()-Y  fBodyAcc-std()-Z
##  Min.   :-1.000    Min.   :-1.000   Min.   :-0.9999   Min.   :-1.000  
##  1st Qu.:-0.984    1st Qu.:-0.993   1st Qu.:-0.9779   1st Qu.:-0.979  
##  Median :-0.900    Median :-0.944   Median :-0.8500   Median :-0.849  
##  Mean   :-0.660    Mean   :-0.600   Mean   :-0.5287   Mean   :-0.609  
##  3rd Qu.:-0.356    3rd Qu.:-0.241   3rd Qu.:-0.0701   3rd Qu.:-0.286  
##  Max.   : 1.000    Max.   : 1.000   Max.   : 0.8603   Max.   : 1.000  
##  fBodyAcc-mad()-X fBodyAcc-mad()-Y  fBodyAcc-mad()-Z fBodyAcc-max()-X
##  Min.   :-1.000   Min.   :-1.0000   Min.   :-1.000   Min.   :-1.000  
##  1st Qu.:-0.992   1st Qu.:-0.9812   1st Qu.:-0.982   1st Qu.:-0.995  
##  Median :-0.949   Median :-0.8720   Median :-0.884   Median :-0.946  
##  Mean   :-0.590   Mean   :-0.5228   Mean   :-0.627   Mean   :-0.647  
##  3rd Qu.:-0.194   3rd Qu.:-0.0586   3rd Qu.:-0.298   3rd Qu.:-0.341  
##  Max.   : 1.000   Max.   : 0.9612   Max.   : 1.000   Max.   : 1.000  
##  fBodyAcc-max()-Y fBodyAcc-max()-Z fBodyAcc-min()-X fBodyAcc-min()-Y
##  Min.   :-1.000   Min.   :-1.000   Min.   :-1.000   Min.   :-1.000  
##  1st Qu.:-0.980   1st Qu.:-0.976   1st Qu.:-0.995   1st Qu.:-0.992  
##  Median :-0.873   Median :-0.828   Median :-0.978   Median :-0.970  
##  Mean   :-0.659   Mean   :-0.625   Mean   :-0.853   Mean   :-0.880  
##  3rd Qu.:-0.352   3rd Qu.:-0.352   3rd Qu.:-0.786   3rd Qu.:-0.824  
##  Max.   : 1.000   Max.   : 1.000   Max.   : 1.000   Max.   : 1.000  
##  fBodyAcc-min()-Z fBodyAcc-sma()   fBodyAcc-energy()-X fBodyAcc-energy()-Y
##  Min.   :-1.000   Min.   :-1.000   Min.   :-1.000      Min.   :-1.000     
##  1st Qu.:-0.992   1st Qu.:-0.987   1st Qu.:-1.000      1st Qu.:-1.000     
##  Median :-0.975   Median :-0.905   Median :-0.998      Median :-0.988     
##  Mean   :-0.913   Mean   :-0.554   Mean   :-0.821      Mean   :-0.752     
##  3rd Qu.:-0.878   3rd Qu.:-0.105   3rd Qu.:-0.711      3rd Qu.:-0.529     
##  Max.   : 1.000   Max.   : 1.000   Max.   : 1.000      Max.   : 0.837     
##  fBodyAcc-energy()-Z fBodyAcc-iqr()-X fBodyAcc-iqr()-Y fBodyAcc-iqr()-Z
##  Min.   :-1.000      Min.   :-1.000   Min.   :-1.000   Min.   :-1.000  
##  1st Qu.:-1.000      1st Qu.:-0.990   1st Qu.:-0.987   1st Qu.:-0.983  
##  Median :-0.988      Median :-0.952   Median :-0.933   Median :-0.943  
##  Mean   :-0.830      Mean   :-0.656   Mean   :-0.653   Mean   :-0.747  
##  3rd Qu.:-0.720      3rd Qu.:-0.326   3rd Qu.:-0.311   3rd Qu.:-0.533  
##  Max.   : 1.000      Max.   : 1.000   Max.   : 1.000   Max.   : 1.000  
##  fBodyAcc-entropy()-X fBodyAcc-entropy()-Y fBodyAcc-entropy()-Z
##  Min.   :-1.000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.946       1st Qu.:-0.870       1st Qu.:-0.814      
##  Median :-0.528       Median :-0.405       Median :-0.413      
##  Mean   :-0.211       Mean   :-0.193       Mean   :-0.210      
##  3rd Qu.: 0.550       3rd Qu.: 0.503       3rd Qu.: 0.411      
##  Max.   : 1.000       Max.   : 0.909       Max.   : 1.000      
##  fBodyAcc-maxInds-X fBodyAcc-maxInds-Y fBodyAcc-maxInds-Z
##  Min.   :-1.000     Min.   :-1.000     Min.   :-1.000    
##  1st Qu.:-1.000     1st Qu.:-1.000     1st Qu.:-1.000    
##  Median :-0.806     Median :-0.800     Median :-0.923    
##  Mean   :-0.766     Mean   :-0.796     Mean   :-0.844    
##  3rd Qu.:-0.742     3rd Qu.:-0.733     3rd Qu.:-0.769    
##  Max.   : 1.000     Max.   : 1.000     Max.   : 0.923    
##  fBodyAcc-meanFreq()-X fBodyAcc-meanFreq()-Y fBodyAcc-meanFreq()-Z
##  Min.   :-1.0000       Min.   :-1.0000       Min.   :-1.0000      
##  1st Qu.:-0.4235       1st Qu.:-0.1481       1st Qu.:-0.1451      
##  Median :-0.2433       Median : 0.0017       Median : 0.0621      
##  Mean   :-0.2273       Mean   : 0.0136       Mean   : 0.0453      
##  3rd Qu.:-0.0235       3rd Qu.: 0.1752       3rd Qu.: 0.2545      
##  Max.   : 0.9141       Max.   : 1.0000       Max.   : 1.0000      
##  fBodyAcc-skewness()-X fBodyAcc-kurtosis()-X fBodyAcc-skewness()-Y
##  Min.   :-0.931        Min.   :-0.999        Min.   :-1.0000      
##  1st Qu.:-0.487        1st Qu.:-0.841        1st Qu.:-0.5231      
##  Median :-0.163        Median :-0.574        Median :-0.3569      
##  Mean   :-0.129        Mean   :-0.458        Mean   :-0.2638      
##  3rd Qu.: 0.155        3rd Qu.:-0.174        3rd Qu.:-0.0968      
##  Max.   : 1.000        Max.   : 1.000        Max.   : 0.9756      
##  fBodyAcc-kurtosis()-Y fBodyAcc-skewness()-Z fBodyAcc-kurtosis()-Z
##  Min.   :-1.000        Min.   :-1.000        Min.   :-1.000       
##  1st Qu.:-0.850        1st Qu.:-0.565        1st Qu.:-0.809       
##  Median :-0.719        Median :-0.311        Median :-0.603       
##  Mean   :-0.578        Mean   :-0.238        Mean   :-0.477       
##  3rd Qu.:-0.449        3rd Qu.: 0.040        3rd Qu.:-0.231       
##  Max.   : 0.966        Max.   : 0.985        Max.   : 0.980       
##  fBodyAcc-bandsEnergy()-1,8 fBodyAcc-bandsEnergy()-9,16
##  Min.   :-1.000             Min.   :-1.000             
##  1st Qu.:-1.000             1st Qu.:-1.000             
##  Median :-0.998             Median :-0.999             
##  Mean   :-0.810             Mean   :-0.888             
##  3rd Qu.:-0.701             3rd Qu.:-0.822             
##  Max.   : 1.000             Max.   : 1.000             
##  fBodyAcc-bandsEnergy()-17,24 fBodyAcc-bandsEnergy()-25,32
##  Min.   :-1.000               Min.   :-1.000              
##  1st Qu.:-1.000               1st Qu.:-1.000              
##  Median :-0.999               Median :-0.999              
##  Mean   :-0.858               Mean   :-0.896              
##  3rd Qu.:-0.783               3rd Qu.:-0.859              
##  Max.   : 1.000               Max.   : 0.881              
##  fBodyAcc-bandsEnergy()-33,40 fBodyAcc-bandsEnergy()-41,48
##  Min.   :-1.000               Min.   :-1.000              
##  1st Qu.:-1.000               1st Qu.:-1.000              
##  Median :-0.999               Median :-0.999              
##  Mean   :-0.913               Mean   :-0.910              
##  3rd Qu.:-0.874               3rd Qu.:-0.874              
##  Max.   : 1.000               Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-49,56 fBodyAcc-bandsEnergy()-57,64
##  Min.   :-1.000               Min.   :-1.000              
##  1st Qu.:-1.000               1st Qu.:-1.000              
##  Median :-0.999               Median :-1.000              
##  Mean   :-0.944               Mean   :-0.953              
##  3rd Qu.:-0.929               3rd Qu.:-0.972              
##  Max.   : 1.000               Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-1,16 fBodyAcc-bandsEnergy()-17,32
##  Min.   :-1.000              Min.   :-1.000              
##  1st Qu.:-1.000              1st Qu.:-1.000              
##  Median :-0.998              Median :-0.998              
##  Mean   :-0.816              Mean   :-0.848              
##  3rd Qu.:-0.708              3rd Qu.:-0.762              
##  Max.   : 1.000              Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-33,48 fBodyAcc-bandsEnergy()-49,64
##  Min.   :-1.000               Min.   :-1.000              
##  1st Qu.:-1.000               1st Qu.:-1.000              
##  Median :-0.999               Median :-0.999              
##  Mean   :-0.912               Mean   :-0.947              
##  3rd Qu.:-0.871               3rd Qu.:-0.940              
##  Max.   : 1.000               Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-1,24 fBodyAcc-bandsEnergy()-25,48
##  Min.   :-1.000              Min.   :-1.000              
##  1st Qu.:-1.000              1st Qu.:-1.000              
##  Median :-0.998              Median :-0.998              
##  Mean   :-0.819              Mean   :-0.884              
##  3rd Qu.:-0.709              3rd Qu.:-0.832              
##  Max.   : 1.000              Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-1,8 fBodyAcc-bandsEnergy()-9,16
##  Min.   :-1.000             Min.   :-1.000             
##  1st Qu.:-1.000             1st Qu.:-1.000             
##  Median :-0.985             Median :-0.997             
##  Mean   :-0.787             Mean   :-0.845             
##  3rd Qu.:-0.609             3rd Qu.:-0.762             
##  Max.   : 1.000             Max.   : 0.950             
##  fBodyAcc-bandsEnergy()-17,24 fBodyAcc-bandsEnergy()-25,32
##  Min.   :-1.000               Min.   :-1.000              
##  1st Qu.:-1.000               1st Qu.:-1.000              
##  Median :-0.998               Median :-0.997              
##  Mean   :-0.862               Mean   :-0.906              
##  3rd Qu.:-0.779               3rd Qu.:-0.865              
##  Max.   : 1.000               Max.   : 0.958              
##  fBodyAcc-bandsEnergy()-33,40 fBodyAcc-bandsEnergy()-41,48
##  Min.   :-1.000               Min.   :-1.000              
##  1st Qu.:-1.000               1st Qu.:-1.000              
##  Median :-0.996               Median :-0.996              
##  Mean   :-0.897               Mean   :-0.882              
##  3rd Qu.:-0.847               3rd Qu.:-0.821              
##  Max.   : 0.847               Max.   : 0.898              
##  fBodyAcc-bandsEnergy()-49,56 fBodyAcc-bandsEnergy()-57,64
##  Min.   :-1.000               Min.   :-1.000              
##  1st Qu.:-1.000               1st Qu.:-1.000              
##  Median :-0.996               Median :-0.999              
##  Mean   :-0.902               Mean   :-0.952              
##  3rd Qu.:-0.863               3rd Qu.:-0.968              
##  Max.   : 1.000               Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-1,16 fBodyAcc-bandsEnergy()-17,32
##  Min.   :-1.000              Min.   :-1.000              
##  1st Qu.:-1.000              1st Qu.:-1.000              
##  Median :-0.987              Median :-0.997              
##  Mean   :-0.757              Mean   :-0.839              
##  3rd Qu.:-0.544              3rd Qu.:-0.737              
##  Max.   : 0.867              Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-33,48 fBodyAcc-bandsEnergy()-49,64
##  Min.   :-1.000               Min.   :-1.000              
##  1st Qu.:-1.000               1st Qu.:-1.000              
##  Median :-0.996               Median :-0.996              
##  Mean   :-0.879               Mean   :-0.920              
##  3rd Qu.:-0.814               3rd Qu.:-0.896              
##  Max.   : 1.000               Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-1,24 fBodyAcc-bandsEnergy()-25,48
##  Min.   :-1.000              Min.   :-1.000              
##  1st Qu.:-1.000              1st Qu.:-1.000              
##  Median :-0.988              Median :-0.997              
##  Mean   :-0.754              Mean   :-0.893              
##  3rd Qu.:-0.535              3rd Qu.:-0.837              
##  Max.   : 0.821              Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-1,8 fBodyAcc-bandsEnergy()-9,16
##  Min.   :-1.000             Min.   :-1.000             
##  1st Qu.:-1.000             1st Qu.:-1.000             
##  Median :-0.987             Median :-0.997             
##  Mean   :-0.848             Mean   :-0.895             
##  3rd Qu.:-0.764             3rd Qu.:-0.852             
##  Max.   : 1.000             Max.   : 1.000             
##  fBodyAcc-bandsEnergy()-17,24 fBodyAcc-bandsEnergy()-25,32
##  Min.   :-1.000               Min.   :-1.000              
##  1st Qu.:-1.000               1st Qu.:-1.000              
##  Median :-0.998               Median :-0.999              
##  Mean   :-0.922               Mean   :-0.960              
##  3rd Qu.:-0.903               3rd Qu.:-0.954              
##  Max.   : 1.000               Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-33,40 fBodyAcc-bandsEnergy()-41,48
##  Min.   :-1.000               Min.   :-1.000              
##  1st Qu.:-1.000               1st Qu.:-1.000              
##  Median :-0.998               Median :-0.997              
##  Mean   :-0.962               Mean   :-0.934              
##  3rd Qu.:-0.954               3rd Qu.:-0.915              
##  Max.   : 1.000               Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-49,56 fBodyAcc-bandsEnergy()-57,64
##  Min.   :-1.000               Min.   :-1.000              
##  1st Qu.:-1.000               1st Qu.:-1.000              
##  Median :-0.996               Median :-0.999              
##  Mean   :-0.939               Mean   :-0.956              
##  3rd Qu.:-0.923               3rd Qu.:-0.972              
##  Max.   : 1.000               Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-1,16 fBodyAcc-bandsEnergy()-17,32
##  Min.   :-1.000              Min.   :-1.000              
##  1st Qu.:-1.000              1st Qu.:-1.000              
##  Median :-0.988              Median :-0.999              
##  Mean   :-0.845              Mean   :-0.936              
##  3rd Qu.:-0.750              3rd Qu.:-0.918              
##  Max.   : 1.000              Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-33,48 fBodyAcc-bandsEnergy()-49,64
##  Min.   :-1.000               Min.   :-1.000              
##  1st Qu.:-1.000               1st Qu.:-1.000              
##  Median :-0.998               Median :-0.996              
##  Mean   :-0.952               Mean   :-0.943              
##  3rd Qu.:-0.939               3rd Qu.:-0.932              
##  Max.   : 1.000               Max.   : 1.000              
##  fBodyAcc-bandsEnergy()-1,24 fBodyAcc-bandsEnergy()-25,48
##  Min.   :-1.000              Min.   :-1.000              
##  1st Qu.:-1.000              1st Qu.:-1.000              
##  Median :-0.988              Median :-0.999              
##  Mean   :-0.834              Mean   :-0.958              
##  3rd Qu.:-0.729              3rd Qu.:-0.947              
##  Max.   : 1.000              Max.   : 1.000              
##  fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z
##  Min.   :-1.000        Min.   :-1.000        Min.   :-1.000       
##  1st Qu.:-0.992        1st Qu.:-0.986        1st Qu.:-0.988       
##  Median :-0.959        Median :-0.933        Median :-0.953       
##  Mean   :-0.660        Mean   :-0.632        Mean   :-0.741       
##  3rd Qu.:-0.325        3rd Qu.:-0.260        3rd Qu.:-0.508       
##  Max.   : 1.000        Max.   : 0.647        Max.   : 1.000       
##  fBodyAccJerk-std()-X fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z
##  Min.   :-1.000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.992       1st Qu.:-0.987       1st Qu.:-0.990      
##  Median :-0.963       Median :-0.936       Median :-0.964      
##  Mean   :-0.659       Mean   :-0.615       Mean   :-0.779      
##  3rd Qu.:-0.322       3rd Qu.:-0.234       3rd Qu.:-0.587      
##  Max.   : 1.000       Max.   : 1.000       Max.   : 1.000      
##  fBodyAccJerk-mad()-X fBodyAccJerk-mad()-Y fBodyAccJerk-mad()-Z
##  Min.   :-1.000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.990       1st Qu.:-0.987       1st Qu.:-0.989      
##  Median :-0.953       Median :-0.937       Median :-0.959      
##  Mean   :-0.600       Mean   :-0.627       Mean   :-0.762      
##  3rd Qu.:-0.202       3rd Qu.:-0.252       3rd Qu.:-0.553      
##  Max.   : 1.000       Max.   : 0.805       Max.   : 1.000      
##  fBodyAccJerk-max()-X fBodyAccJerk-max()-Y fBodyAccJerk-max()-Z
##  Min.   :-1.000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.994       1st Qu.:-0.989       1st Qu.:-0.990      
##  Median :-0.972       Median :-0.949       Median :-0.966      
##  Mean   :-0.715       Mean   :-0.681       Mean   :-0.798      
##  3rd Qu.:-0.446       3rd Qu.:-0.387       3rd Qu.:-0.637      
##  Max.   : 1.000       Max.   : 1.000       Max.   : 1.000      
##  fBodyAccJerk-min()-X fBodyAccJerk-min()-Y fBodyAccJerk-min()-Z
##  Min.   :-1.000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.995       1st Qu.:-0.992       1st Qu.:-0.989      
##  Median :-0.984       Median :-0.972       Median :-0.970      
##  Mean   :-0.882       Mean   :-0.862       Mean   :-0.883      
##  3rd Qu.:-0.832       3rd Qu.:-0.802       3rd Qu.:-0.843      
##  Max.   : 1.000       Max.   : 1.000       Max.   : 1.000      
##  fBodyAccJerk-sma() fBodyAccJerk-energy()-X fBodyAccJerk-energy()-Y
##  Min.   :-1.000     Min.   :-1.000          Min.   :-1.000         
##  1st Qu.:-0.989     1st Qu.:-1.000          1st Qu.:-1.000         
##  Median :-0.943     Median :-0.999          Median :-0.997         
##  Mean   :-0.622     Mean   :-0.850          Mean   :-0.828         
##  3rd Qu.:-0.241     3rd Qu.:-0.743          3rd Qu.:-0.689         
##  Max.   : 1.000     Max.   : 1.000          Max.   : 0.634         
##  fBodyAccJerk-energy()-Z fBodyAccJerk-iqr()-X fBodyAccJerk-iqr()-Y
##  Min.   :-1.000          Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-1.000          1st Qu.:-0.990       1st Qu.:-0.989      
##  Median :-0.999          Median :-0.953       Median :-0.949      
##  Mean   :-0.927          Mean   :-0.637       Mean   :-0.723      
##  3rd Qu.:-0.891          3rd Qu.:-0.295       3rd Qu.:-0.452      
##  Max.   : 1.000          Max.   : 1.000       Max.   : 0.641      
##  fBodyAccJerk-iqr()-Z fBodyAccJerk-entropy()-X fBodyAccJerk-entropy()-Y
##  Min.   :-0.999       Min.   :-1.000           Min.   :-1.000          
##  1st Qu.:-0.986       1st Qu.:-1.000           1st Qu.:-1.000          
##  Median :-0.956       Median :-0.736           Median :-0.656          
##  Mean   :-0.769       Mean   :-0.279           Mean   :-0.274          
##  3rd Qu.:-0.578       3rd Qu.: 0.521           3rd Qu.: 0.511          
##  Max.   : 1.000       Max.   : 1.000           Max.   : 0.997          
##  fBodyAccJerk-entropy()-Z fBodyAccJerk-maxInds-X fBodyAccJerk-maxInds-Y
##  Min.   :-1.000           Min.   :-1.000         Min.   :-1.000        
##  1st Qu.:-1.000           1st Qu.:-0.680         1st Qu.:-0.560        
##  Median :-0.708           Median :-0.400         Median :-0.400        
##  Mean   :-0.371           Mean   :-0.422         Mean   :-0.399        
##  3rd Qu.: 0.293           3rd Qu.:-0.160         3rd Qu.:-0.240        
##  Max.   : 1.000           Max.   : 1.000         Max.   : 1.000        
##  fBodyAccJerk-maxInds-Z fBodyAccJerk-meanFreq()-X
##  Min.   :-1.000         Min.   :-1.0000          
##  1st Qu.:-0.520         1st Qu.:-0.2964          
##  Median :-0.320         Median :-0.0453          
##  Mean   :-0.331         Mean   :-0.0465          
##  3rd Qu.:-0.160         3rd Qu.: 0.2042          
##  Max.   : 0.960         Max.   : 1.0000          
##  fBodyAccJerk-meanFreq()-Y fBodyAccJerk-meanFreq()-Z
##  Min.   :-1.000            Min.   :-1.0000          
##  1st Qu.:-0.431            1st Qu.:-0.3303          
##  Median :-0.236            Median :-0.0959          
##  Mean   :-0.212            Mean   :-0.1226          
##  3rd Qu.: 0.018            3rd Qu.: 0.0955          
##  Max.   : 1.000            Max.   : 0.6786          
##  fBodyAccJerk-skewness()-X fBodyAccJerk-kurtosis()-X
##  Min.   :-1.000            Min.   :-1.000           
##  1st Qu.:-0.509            1st Qu.:-0.859           
##  Median :-0.359            Median :-0.776           
##  Mean   :-0.321            Mean   :-0.716           
##  3rd Qu.:-0.171            3rd Qu.:-0.640           
##  Max.   : 0.829            Max.   : 0.660           
##  fBodyAccJerk-skewness()-Y fBodyAccJerk-kurtosis()-Y
##  Min.   :-1.000            Min.   :-1.000           
##  1st Qu.:-0.535            1st Qu.:-0.913           
##  Median :-0.417            Median :-0.856           
##  Mean   :-0.396            Mean   :-0.820           
##  3rd Qu.:-0.288            3rd Qu.:-0.772           
##  Max.   : 1.000            Max.   : 1.000           
##  fBodyAccJerk-skewness()-Z fBodyAccJerk-kurtosis()-Z
##  Min.   :-1.000            Min.   :-1.000           
##  1st Qu.:-0.629            1st Qu.:-0.911           
##  Median :-0.520            Median :-0.855           
##  Mean   :-0.487            Mean   :-0.813           
##  3rd Qu.:-0.382            3rd Qu.:-0.766           
##  Max.   : 1.000            Max.   : 1.000           
##  fBodyAccJerk-bandsEnergy()-1,8 fBodyAccJerk-bandsEnergy()-9,16
##  Min.   :-1.000                 Min.   :-1.000                 
##  1st Qu.:-1.000                 1st Qu.:-1.000                 
##  Median :-1.000                 Median :-0.999                 
##  Mean   :-0.862                 Mean   :-0.889                 
##  3rd Qu.:-0.795                 3rd Qu.:-0.814                 
##  Max.   : 1.000                 Max.   : 1.000                 
##  fBodyAccJerk-bandsEnergy()-17,24 fBodyAccJerk-bandsEnergy()-25,32
##  Min.   :-1.000                   Min.   :-1.000                  
##  1st Qu.:-1.000                   1st Qu.:-1.000                  
##  Median :-0.999                   Median :-0.999                  
##  Mean   :-0.875                   Mean   :-0.901                  
##  3rd Qu.:-0.812                   3rd Qu.:-0.867                  
##  Max.   : 1.000                   Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-33,40 fBodyAccJerk-bandsEnergy()-41,48
##  Min.   :-1.000                   Min.   :-1.000                  
##  1st Qu.:-1.000                   1st Qu.:-1.000                  
##  Median :-0.999                   Median :-0.999                  
##  Mean   :-0.921                   Mean   :-0.901                  
##  3rd Qu.:-0.888                   3rd Qu.:-0.859                  
##  Max.   : 1.000                   Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-49,56 fBodyAccJerk-bandsEnergy()-57,64
##  Min.   :-1.000                   Min.   :-1.000                  
##  1st Qu.:-1.000                   1st Qu.:-1.000                  
##  Median :-0.999                   Median :-1.000                  
##  Mean   :-0.944                   Mean   :-0.984                  
##  3rd Qu.:-0.923                   3rd Qu.:-0.991                  
##  Max.   : 1.000                   Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-1,16 fBodyAccJerk-bandsEnergy()-17,32
##  Min.   :-1.000                  Min.   :-1.000                  
##  1st Qu.:-1.000                  1st Qu.:-1.000                  
##  Median :-0.999                  Median :-0.999                  
##  Mean   :-0.868                  Mean   :-0.857                  
##  3rd Qu.:-0.785                  3rd Qu.:-0.781                  
##  Max.   : 1.000                  Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-33,48 fBodyAccJerk-bandsEnergy()-49,64
##  Min.   :-1.000                   Min.   :-1.000                  
##  1st Qu.:-1.000                   1st Qu.:-1.000                  
##  Median :-0.999                   Median :-0.999                  
##  Mean   :-0.906                   Mean   :-0.942                  
##  3rd Qu.:-0.861                   3rd Qu.:-0.920                  
##  Max.   : 1.000                   Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-1,24 fBodyAccJerk-bandsEnergy()-25,48
##  Min.   :-1.000                  Min.   :-1.000                  
##  1st Qu.:-1.000                  1st Qu.:-1.000                  
##  Median :-0.999                  Median :-0.998                  
##  Mean   :-0.846                  Mean   :-0.864                  
##  3rd Qu.:-0.734                  3rd Qu.:-0.802                  
##  Max.   : 1.000                  Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-1,8 fBodyAccJerk-bandsEnergy()-9,16
##  Min.   :-1.000                 Min.   :-1.000                 
##  1st Qu.:-1.000                 1st Qu.:-1.000                 
##  Median :-0.996                 Median :-0.998                 
##  Mean   :-0.838                 Mean   :-0.867                 
##  3rd Qu.:-0.711                 3rd Qu.:-0.796                 
##  Max.   : 0.703                 Max.   : 0.892                 
##  fBodyAccJerk-bandsEnergy()-17,24 fBodyAccJerk-bandsEnergy()-25,32
##  Min.   :-1.000                   Min.   :-1.000                  
##  1st Qu.:-1.000                   1st Qu.:-1.000                  
##  Median :-0.998                   Median :-0.998                  
##  Mean   :-0.839                   Mean   :-0.911                  
##  3rd Qu.:-0.741                   3rd Qu.:-0.872                  
##  Max.   : 0.908                   Max.   : 0.888                  
##  fBodyAccJerk-bandsEnergy()-33,40 fBodyAccJerk-bandsEnergy()-41,48
##  Min.   :-1.000                   Min.   :-1.000                  
##  1st Qu.:-1.000                   1st Qu.:-1.000                  
##  Median :-0.998                   Median :-0.997                  
##  Mean   :-0.915                   Mean   :-0.876                  
##  3rd Qu.:-0.876                   3rd Qu.:-0.809                  
##  Max.   : 0.632                   Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-49,56 fBodyAccJerk-bandsEnergy()-57,64
##  Min.   :-1.000                   Min.   :-1.000                  
##  1st Qu.:-1.000                   1st Qu.:-1.000                  
##  Median :-0.998                   Median :-1.000                  
##  Mean   :-0.922                   Mean   :-0.971                  
##  3rd Qu.:-0.887                   3rd Qu.:-0.984                  
##  Max.   : 1.000                   Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-1,16 fBodyAccJerk-bandsEnergy()-17,32
##  Min.   :-1.000                  Min.   :-1.000                  
##  1st Qu.:-1.000                  1st Qu.:-1.000                  
##  Median :-0.997                  Median :-0.998                  
##  Mean   :-0.841                  Mean   :-0.840                  
##  3rd Qu.:-0.739                  3rd Qu.:-0.738                  
##  Max.   : 0.898                  Max.   : 0.930                  
##  fBodyAccJerk-bandsEnergy()-33,48 fBodyAccJerk-bandsEnergy()-49,64
##  Min.   :-1.000                   Min.   :-1.000                  
##  1st Qu.:-1.000                   1st Qu.:-1.000                  
##  Median :-0.998                   Median :-0.999                  
##  Mean   :-0.878                   Mean   :-0.928                  
##  3rd Qu.:-0.809                   3rd Qu.:-0.895                  
##  Max.   : 1.000                   Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-1,24 fBodyAccJerk-bandsEnergy()-25,48
##  Min.   :-1.000                  Min.   :-1.000                  
##  1st Qu.:-1.000                  1st Qu.:-1.000                  
##  Median :-0.997                  Median :-0.998                  
##  Mean   :-0.813                  Mean   :-0.897                  
##  3rd Qu.:-0.669                  3rd Qu.:-0.838                  
##  Max.   : 0.915                  Max.   : 0.807                  
##  fBodyAccJerk-bandsEnergy()-1,8 fBodyAccJerk-bandsEnergy()-9,16
##  Min.   :-1.000                 Min.   :-1.000                 
##  1st Qu.:-1.000                 1st Qu.:-1.000                 
##  Median :-0.997                 Median :-0.998                 
##  Mean   :-0.897                 Mean   :-0.896                 
##  3rd Qu.:-0.856                 3rd Qu.:-0.854                 
##  Max.   : 1.000                 Max.   : 1.000                 
##  fBodyAccJerk-bandsEnergy()-17,24 fBodyAccJerk-bandsEnergy()-25,32
##  Min.   :-1.000                   Min.   :-1.000                  
##  1st Qu.:-1.000                   1st Qu.:-1.000                  
##  Median :-0.999                   Median :-0.999                  
##  Mean   :-0.928                   Mean   :-0.961                  
##  3rd Qu.:-0.912                   3rd Qu.:-0.956                  
##  Max.   : 1.000                   Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-33,40 fBodyAccJerk-bandsEnergy()-41,48
##  Min.   :-1.000                   Min.   :-1.000                  
##  1st Qu.:-1.000                   1st Qu.:-1.000                  
##  Median :-0.999                   Median :-0.998                  
##  Mean   :-0.965                   Mean   :-0.939                  
##  3rd Qu.:-0.960                   3rd Qu.:-0.924                  
##  Max.   : 1.000                   Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-49,56 fBodyAccJerk-bandsEnergy()-57,64
##  Min.   :-1.000                   Min.   :-1.000                  
##  1st Qu.:-1.000                   1st Qu.:-1.000                  
##  Median :-0.998                   Median :-0.999                  
##  Mean   :-0.929                   Mean   :-0.970                  
##  3rd Qu.:-0.914                   3rd Qu.:-0.987                  
##  Max.   : 1.000                   Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-1,16 fBodyAccJerk-bandsEnergy()-17,32
##  Min.   :-1.000                  Min.   :-1.000                  
##  1st Qu.:-1.000                  1st Qu.:-1.000                  
##  Median :-0.997                  Median :-0.999                  
##  Mean   :-0.875                  Mean   :-0.944                  
##  3rd Qu.:-0.815                  3rd Qu.:-0.928                  
##  Max.   : 1.000                  Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-33,48 fBodyAccJerk-bandsEnergy()-49,64
##  Min.   :-1.000                   Min.   :-1.000                  
##  1st Qu.:-1.000                   1st Qu.:-1.000                  
##  Median :-0.999                   Median :-0.998                  
##  Mean   :-0.955                   Mean   :-0.929                  
##  3rd Qu.:-0.944                   3rd Qu.:-0.913                  
##  Max.   : 1.000                   Max.   : 1.000                  
##  fBodyAccJerk-bandsEnergy()-1,24 fBodyAccJerk-bandsEnergy()-25,48
##  Min.   :-1.000                  Min.   :-1.000                  
##  1st Qu.:-1.000                  1st Qu.:-1.000                  
##  Median :-0.998                  Median :-0.999                  
##  Mean   :-0.895                  Mean   :-0.959                  
##  3rd Qu.:-0.844                  3rd Qu.:-0.949                  
##  Max.   : 1.000                  Max.   : 1.000                  
##  fBodyGyro-mean()-X fBodyGyro-mean()-Y fBodyGyro-mean()-Z
##  Min.   :-1.000     Min.   :-1.000     Min.   :-1.000    
##  1st Qu.:-0.986     1st Qu.:-0.986     1st Qu.:-0.987    
##  Median :-0.902     Median :-0.925     Median :-0.894    
##  Mean   :-0.673     Mean   :-0.702     Mean   :-0.646    
##  3rd Qu.:-0.384     3rd Qu.:-0.466     3rd Qu.:-0.313    
##  Max.   : 1.000     Max.   : 1.000     Max.   : 1.000    
##  fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z fBodyGyro-mad()-X
##  Min.   :-1.000    Min.   :-1.000    Min.   :-1.000    Min.   :-1.000   
##  1st Qu.:-0.989    1st Qu.:-0.983    1st Qu.:-0.988    1st Qu.:-0.987   
##  Median :-0.914    Median :-0.913    Median :-0.899    Median :-0.903   
##  Mean   :-0.738    Mean   :-0.666    Mean   :-0.691    Mean   :-0.687   
##  3rd Qu.:-0.518    3rd Qu.:-0.425    3rd Qu.:-0.413    3rd Qu.:-0.409   
##  Max.   : 1.000    Max.   : 1.000    Max.   : 1.000    Max.   : 1.000   
##  fBodyGyro-mad()-Y fBodyGyro-mad()-Z fBodyGyro-max()-X fBodyGyro-max()-Y
##  Min.   :-1.000    Min.   :-1.000    Min.   :-1.000    Min.   :-1.000   
##  1st Qu.:-0.986    1st Qu.:-0.987    1st Qu.:-0.989    1st Qu.:-0.985   
##  Median :-0.926    Median :-0.894    Median :-0.917    Median :-0.924   
##  Mean   :-0.707    Mean   :-0.642    Mean   :-0.735    Mean   :-0.726   
##  3rd Qu.:-0.486    3rd Qu.:-0.302    3rd Qu.:-0.531    3rd Qu.:-0.555   
##  Max.   : 1.000    Max.   : 1.000    Max.   : 1.000    Max.   : 1.000   
##  fBodyGyro-max()-Z fBodyGyro-min()-X fBodyGyro-min()-Y fBodyGyro-min()-Z
##  Min.   :-1.000    Min.   :-1.000    Min.   :-1.000    Min.   :-1.000   
##  1st Qu.:-0.990    1st Qu.:-0.997    1st Qu.:-0.995    1st Qu.:-0.995   
##  Median :-0.917    Median :-0.983    Median :-0.975    Median :-0.972   
##  Mean   :-0.765    Mean   :-0.932    Mean   :-0.899    Mean   :-0.908   
##  3rd Qu.:-0.580    3rd Qu.:-0.907    3rd Qu.:-0.861    3rd Qu.:-0.870   
##  Max.   : 1.000    Max.   : 0.465    Max.   : 0.794    Max.   : 1.000   
##  fBodyGyro-sma()  fBodyGyro-energy()-X fBodyGyro-energy()-Y
##  Min.   :-1.000   Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.986   1st Qu.:-1.000       1st Qu.:-1.000      
##  Median :-0.909   Median :-0.996       Median :-0.996      
##  Mean   :-0.659   Mean   :-0.914       Mean   :-0.878      
##  3rd Qu.:-0.343   3rd Qu.:-0.863       3rd Qu.:-0.837      
##  Max.   : 1.000   Max.   : 1.000       Max.   : 1.000      
##  fBodyGyro-energy()-Z fBodyGyro-iqr()-X fBodyGyro-iqr()-Y
##  Min.   :-1.000       Min.   :-1.000    Min.   :-1.000   
##  1st Qu.:-1.000       1st Qu.:-0.990    1st Qu.:-0.991   
##  Median :-0.994       Median :-0.941    Median :-0.948   
##  Mean   :-0.868       Mean   :-0.709    Mean   :-0.752   
##  3rd Qu.:-0.775       3rd Qu.:-0.457    3rd Qu.:-0.575   
##  Max.   : 1.000       Max.   : 1.000    Max.   : 1.000   
##  fBodyGyro-iqr()-Z fBodyGyro-entropy()-X fBodyGyro-entropy()-Y
##  Min.   :-1.000    Min.   :-1.000        Min.   :-1.0000      
##  1st Qu.:-0.990    1st Qu.:-0.713        1st Qu.:-0.6606      
##  Median :-0.939    Median :-0.205        Median :-0.1605      
##  Mean   :-0.699    Mean   :-0.108        Mean   :-0.0591      
##  3rd Qu.:-0.438    3rd Qu.: 0.513        3rd Qu.: 0.5603      
##  Max.   : 1.000    Max.   : 1.000        Max.   : 1.0000      
##  fBodyGyro-entropy()-Z fBodyGyro-maxInds-X fBodyGyro-maxInds-Y
##  Min.   :-1.000        Min.   :-1.000      Min.   :-1.000     
##  1st Qu.:-0.779        1st Qu.:-1.000      1st Qu.:-1.000     
##  Median :-0.268        Median :-0.933      Median :-0.935     
##  Mean   :-0.162        Mean   :-0.875      Mean   :-0.811     
##  3rd Qu.: 0.448        3rd Qu.:-0.867      3rd Qu.:-0.742     
##  Max.   : 1.000        Max.   : 1.000      Max.   : 0.806     
##  fBodyGyro-maxInds-Z fBodyGyro-meanFreq()-X fBodyGyro-meanFreq()-Y
##  Min.   :-1.000      Min.   :-1.0000        Min.   :-1.0000       
##  1st Qu.:-1.000      1st Qu.:-0.2737        1st Qu.:-0.3666       
##  Median :-0.931      Median :-0.0991        Median :-0.1761       
##  Mean   :-0.805      Mean   :-0.1012        Mean   :-0.1771       
##  3rd Qu.:-0.655      3rd Qu.: 0.0703        3rd Qu.: 0.0112       
##  Max.   : 0.655      Max.   : 1.0000        Max.   : 0.9937       
##  fBodyGyro-meanFreq()-Z fBodyGyro-skewness()-X fBodyGyro-kurtosis()-X
##  Min.   :-0.9663        Min.   :-1.0000        Min.   :-1.000        
##  1st Qu.:-0.2275        1st Qu.:-0.4139        1st Qu.:-0.754        
##  Median :-0.0510        Median :-0.2171        Median :-0.581        
##  Mean   :-0.0485        Mean   :-0.1747        Mean   :-0.491        
##  3rd Qu.: 0.1257        3rd Qu.: 0.0347        3rd Qu.:-0.302        
##  Max.   : 1.0000        Max.   : 0.9209        Max.   : 0.894        
##  fBodyGyro-skewness()-Y fBodyGyro-kurtosis()-Y fBodyGyro-skewness()-Z
##  Min.   :-1.0000        Min.   :-0.998         Min.   :-0.909        
##  1st Qu.:-0.4442        1st Qu.:-0.814         1st Qu.:-0.474        
##  Median :-0.2408        Median :-0.652         Median :-0.271        
##  Mean   :-0.1728        Mean   :-0.528         Mean   :-0.217        
##  3rd Qu.: 0.0408        3rd Qu.:-0.356         3rd Qu.:-0.007        
##  Max.   : 0.9813        Max.   : 0.978         Max.   : 0.904        
##  fBodyGyro-kurtosis()-Z fBodyGyro-bandsEnergy()-1,8
##  Min.   :-1.000         Min.   :-1.000             
##  1st Qu.:-0.802         1st Qu.:-1.000             
##  Median :-0.637         Median :-0.996             
##  Mean   :-0.536         Mean   :-0.928             
##  3rd Qu.:-0.358         3rd Qu.:-0.898             
##  Max.   : 0.857         Max.   : 1.000             
##  fBodyGyro-bandsEnergy()-9,16 fBodyGyro-bandsEnergy()-17,24
##  Min.   :-1.000               Min.   :-1.000               
##  1st Qu.:-1.000               1st Qu.:-1.000               
##  Median :-0.998               Median :-0.999               
##  Mean   :-0.901               Mean   :-0.918               
##  3rd Qu.:-0.864               3rd Qu.:-0.888               
##  Max.   : 1.000               Max.   : 1.000               
##  fBodyGyro-bandsEnergy()-25,32 fBodyGyro-bandsEnergy()-33,40
##  Min.   :-1.000                Min.   :-1.000               
##  1st Qu.:-1.000                1st Qu.:-1.000               
##  Median :-0.999                Median :-0.998               
##  Mean   :-0.960                Mean   :-0.950               
##  3rd Qu.:-0.952                3rd Qu.:-0.938               
##  Max.   : 1.000                Max.   : 1.000               
##  fBodyGyro-bandsEnergy()-41,48 fBodyGyro-bandsEnergy()-49,56
##  Min.   :-1.000                Min.   :-1.000               
##  1st Qu.:-1.000                1st Qu.:-1.000               
##  Median :-0.998                Median :-0.998               
##  Mean   :-0.952                Mean   :-0.964               
##  3rd Qu.:-0.936                3rd Qu.:-0.959               
##  Max.   : 1.000                Max.   : 1.000               
##  fBodyGyro-bandsEnergy()-57,64 fBodyGyro-bandsEnergy()-1,16
##  Min.   :-1.000                Min.   :-1.000              
##  1st Qu.:-1.000                1st Qu.:-1.000              
##  Median :-1.000                Median :-0.996              
##  Mean   :-0.976                Mean   :-0.918              
##  3rd Qu.:-0.984                3rd Qu.:-0.873              
##  Max.   : 1.000                Max.   : 1.000              
##  fBodyGyro-bandsEnergy()-17,32 fBodyGyro-bandsEnergy()-33,48
##  Min.   :-1.000                Min.   :-1.000               
##  1st Qu.:-1.000                1st Qu.:-1.000               
##  Median :-0.999                Median :-0.998               
##  Mean   :-0.917                Mean   :-0.946               
##  3rd Qu.:-0.886                3rd Qu.:-0.930               
##  Max.   : 1.000                Max.   : 1.000               
##  fBodyGyro-bandsEnergy()-49,64 fBodyGyro-bandsEnergy()-1,24
##  Min.   :-1.000                Min.   :-1.000              
##  1st Qu.:-1.000                1st Qu.:-1.000              
##  Median :-0.998                Median :-0.996              
##  Mean   :-0.969                Mean   :-0.915              
##  3rd Qu.:-0.969                3rd Qu.:-0.866              
##  Max.   : 1.000                Max.   : 1.000              
##  fBodyGyro-bandsEnergy()-25,48 fBodyGyro-bandsEnergy()-1,8
##  Min.   :-1.000                Min.   :-1.000             
##  1st Qu.:-1.000                1st Qu.:-1.000             
##  Median :-0.999                Median :-0.995             
##  Mean   :-0.955                Mean   :-0.870             
##  3rd Qu.:-0.941                3rd Qu.:-0.840             
##  Max.   : 1.000                Max.   : 1.000             
##  fBodyGyro-bandsEnergy()-9,16 fBodyGyro-bandsEnergy()-17,24
##  Min.   :-1.000               Min.   :-1.000               
##  1st Qu.:-1.000               1st Qu.:-1.000               
##  Median :-0.999               Median :-1.000               
##  Mean   :-0.955               Mean   :-0.957               
##  3rd Qu.:-0.953               3rd Qu.:-0.964               
##  Max.   : 1.000               Max.   : 1.000               
##  fBodyGyro-bandsEnergy()-25,32 fBodyGyro-bandsEnergy()-33,40
##  Min.   :-1.000                Min.   :-1.000               
##  1st Qu.:-1.000                1st Qu.:-1.000               
##  Median :-1.000                Median :-1.000               
##  Mean   :-0.966                Mean   :-0.977               
##  3rd Qu.:-0.970                3rd Qu.:-0.976               
##  Max.   : 1.000                Max.   : 1.000               
##  fBodyGyro-bandsEnergy()-41,48 fBodyGyro-bandsEnergy()-49,56
##  Min.   :-1.000                Min.   :-1.000               
##  1st Qu.:-1.000                1st Qu.:-1.000               
##  Median :-0.999                Median :-0.999               
##  Mean   :-0.956                Mean   :-0.950               
##  3rd Qu.:-0.953                3rd Qu.:-0.948               
##  Max.   : 1.000                Max.   : 1.000               
##  fBodyGyro-bandsEnergy()-57,64 fBodyGyro-bandsEnergy()-1,16
##  Min.   :-1.000                Min.   :-1.000              
##  1st Qu.:-1.000                1st Qu.:-1.000              
##  Median :-1.000                Median :-0.996              
##  Mean   :-0.975                Mean   :-0.883              
##  3rd Qu.:-0.986                3rd Qu.:-0.845              
##  Max.   : 1.000                Max.   : 1.000              
##  fBodyGyro-bandsEnergy()-17,32 fBodyGyro-bandsEnergy()-33,48
##  Min.   :-1.000                Min.   :-1.000               
##  1st Qu.:-1.000                1st Qu.:-1.000               
##  Median :-0.999                Median :-0.999               
##  Mean   :-0.949                Mean   :-0.972               
##  3rd Qu.:-0.955                3rd Qu.:-0.970               
##  Max.   : 1.000                Max.   : 1.000               
##  fBodyGyro-bandsEnergy()-49,64 fBodyGyro-bandsEnergy()-1,24
##  Min.   :-1.000                Min.   :-1.000              
##  1st Qu.:-1.000                1st Qu.:-1.000              
##  Median :-0.999                Median :-0.996              
##  Mean   :-0.954                Mean   :-0.871              
##  3rd Qu.:-0.954                3rd Qu.:-0.829              
##  Max.   : 1.000                Max.   : 1.000              
##  fBodyGyro-bandsEnergy()-25,48 fBodyGyro-bandsEnergy()-1,8
##  Min.   :-1.000                Min.   :-1.000             
##  1st Qu.:-1.000                1st Qu.:-1.000             
##  Median :-0.999                Median :-0.994             
##  Mean   :-0.965                Mean   :-0.898             
##  3rd Qu.:-0.966                3rd Qu.:-0.839             
##  Max.   : 1.000                Max.   : 1.000             
##  fBodyGyro-bandsEnergy()-9,16 fBodyGyro-bandsEnergy()-17,24
##  Min.   :-1.000               Min.   :-1.000               
##  1st Qu.:-1.000               1st Qu.:-1.000               
##  Median :-0.999               Median :-0.999               
##  Mean   :-0.932               Mean   :-0.930               
##  3rd Qu.:-0.912               3rd Qu.:-0.912               
##  Max.   : 1.000               Max.   : 1.000               
##  fBodyGyro-bandsEnergy()-25,32 fBodyGyro-bandsEnergy()-33,40
##  Min.   :-1.000                Min.   :-1.000               
##  1st Qu.:-1.000                1st Qu.:-1.000               
##  Median :-0.999                Median :-0.999               
##  Mean   :-0.967                Mean   :-0.972               
##  3rd Qu.:-0.963                3rd Qu.:-0.967               
##  Max.   : 1.000                Max.   : 1.000               
##  fBodyGyro-bandsEnergy()-41,48 fBodyGyro-bandsEnergy()-49,56
##  Min.   :-1.000                Min.   :-1.000               
##  1st Qu.:-1.000                1st Qu.:-1.000               
##  Median :-0.998                Median :-0.996               
##  Mean   :-0.961                Mean   :-0.952               
##  3rd Qu.:-0.951                3rd Qu.:-0.947               
##  Max.   : 1.000                Max.   : 1.000               
##  fBodyGyro-bandsEnergy()-57,64 fBodyGyro-bandsEnergy()-1,16
##  Min.   :-1.000                Min.   :-1.000              
##  1st Qu.:-1.000                1st Qu.:-1.000              
##  Median :-0.999                Median :-0.994              
##  Mean   :-0.969                Mean   :-0.880              
##  3rd Qu.:-0.981                3rd Qu.:-0.803              
##  Max.   : 1.000                Max.   : 1.000              
##  fBodyGyro-bandsEnergy()-17,32 fBodyGyro-bandsEnergy()-33,48
##  Min.   :-1.000                Min.   :-1.000               
##  1st Qu.:-1.000                1st Qu.:-1.000               
##  Median :-0.999                Median :-0.999               
##  Mean   :-0.917                Mean   :-0.969               
##  3rd Qu.:-0.894                3rd Qu.:-0.961               
##  Max.   : 1.000                Max.   : 1.000               
##  fBodyGyro-bandsEnergy()-49,64 fBodyGyro-bandsEnergy()-1,24
##  Min.   :-1.000                Min.   :-1.000              
##  1st Qu.:-1.000                1st Qu.:-1.000              
##  Median :-0.997                Median :-0.994              
##  Mean   :-0.959                Mean   :-0.872              
##  3rd Qu.:-0.959                3rd Qu.:-0.782              
##  Max.   : 1.000                Max.   : 1.000              
##  fBodyGyro-bandsEnergy()-25,48 fBodyAccMag-mean() fBodyAccMag-std()
##  Min.   :-1.000                Min.   :-1.000     Min.   :-1.000   
##  1st Qu.:-1.000                1st Qu.:-0.986     1st Qu.:-0.984   
##  Median :-0.999                Median :-0.886     Median :-0.862   
##  Mean   :-0.968                Mean   :-0.586     Mean   :-0.656   
##  3rd Qu.:-0.961                3rd Qu.:-0.206     3rd Qu.:-0.377   
##  Max.   : 1.000                Max.   : 1.000     Max.   : 1.000   
##  fBodyAccMag-mad() fBodyAccMag-max() fBodyAccMag-min() fBodyAccMag-sma()
##  Min.   :-1.000    Min.   :-1.000    Min.   :-1.000    Min.   :-1.000   
##  1st Qu.:-0.983    1st Qu.:-0.987    1st Qu.:-0.992    1st Qu.:-0.986   
##  Median :-0.868    Median :-0.885    Median :-0.971    Median :-0.886   
##  Mean   :-0.594    Mean   :-0.753    Mean   :-0.891    Mean   :-0.586   
##  3rd Qu.:-0.244    3rd Qu.:-0.566    3rd Qu.:-0.839    3rd Qu.:-0.206   
##  Max.   : 1.000    Max.   : 1.000    Max.   : 1.000    Max.   : 1.000   
##  fBodyAccMag-energy() fBodyAccMag-iqr() fBodyAccMag-entropy()
##  Min.   :-1.000       Min.   :-1.000    Min.   :-1.000       
##  1st Qu.:-1.000       1st Qu.:-0.988    1st Qu.:-0.892       
##  Median :-0.988       Median :-0.936    Median :-0.391       
##  Mean   :-0.817       Mean   :-0.695    Mean   :-0.198       
##  3rd Qu.:-0.701       3rd Qu.:-0.425    3rd Qu.: 0.497       
##  Max.   : 1.000       Max.   : 1.000    Max.   : 1.000       
##  fBodyAccMag-maxInds fBodyAccMag-meanFreq() fBodyAccMag-skewness()
##  Min.   :-1.000      Min.   :-1.0000        Min.   :-1.000        
##  1st Qu.:-1.000      1st Qu.:-0.0989        1st Qu.:-0.575        
##  Median :-0.793      Median : 0.0677        Median :-0.418        
##  Mean   :-0.751      Mean   : 0.0731        Mean   :-0.347        
##  3rd Qu.:-0.517      3rd Qu.: 0.2417        3rd Qu.:-0.196        
##  Max.   : 1.000      Max.   : 1.0000        Max.   : 1.000        
##  fBodyAccMag-kurtosis() fBodyBodyAccJerkMag-mean()
##  Min.   :-1.000         Min.   :-1.000            
##  1st Qu.:-0.844         1st Qu.:-0.990            
##  Median :-0.732         Median :-0.940            
##  Mean   :-0.627         Mean   :-0.624            
##  3rd Qu.:-0.525         3rd Qu.:-0.259            
##  Max.   : 1.000         Max.   : 1.000            
##  fBodyBodyAccJerkMag-std() fBodyBodyAccJerkMag-mad()
##  Min.   :-1.000            Min.   :-0.999           
##  1st Qu.:-0.991            1st Qu.:-0.989           
##  Median :-0.937            Median :-0.934           
##  Mean   :-0.647            Mean   :-0.619           
##  3rd Qu.:-0.314            3rd Qu.:-0.249           
##  Max.   : 1.000            Max.   : 1.000           
##  fBodyBodyAccJerkMag-max() fBodyBodyAccJerkMag-min()
##  Min.   :-1.000            Min.   :-1.000           
##  1st Qu.:-0.993            1st Qu.:-0.987           
##  Median :-0.944            Median :-0.963           
##  Mean   :-0.691            Mean   :-0.806           
##  3rd Qu.:-0.422            3rd Qu.:-0.684           
##  Max.   : 1.000            Max.   : 1.000           
##  fBodyBodyAccJerkMag-sma() fBodyBodyAccJerkMag-energy()
##  Min.   :-1.000            Min.   :-1.000              
##  1st Qu.:-0.990            1st Qu.:-1.000              
##  Median :-0.940            Median :-0.998              
##  Mean   :-0.624            Mean   :-0.842              
##  3rd Qu.:-0.259            3rd Qu.:-0.731              
##  Max.   : 1.000            Max.   : 1.000              
##  fBodyBodyAccJerkMag-iqr() fBodyBodyAccJerkMag-entropy()
##  Min.   :-1.000            Min.   :-1.000               
##  1st Qu.:-0.989            1st Qu.:-1.000               
##  Median :-0.951            Median :-0.741               
##  Mean   :-0.679            Mean   :-0.348               
##  3rd Qu.:-0.372            3rd Qu.: 0.351               
##  Max.   : 1.000            Max.   : 1.000               
##  fBodyBodyAccJerkMag-maxInds fBodyBodyAccJerkMag-meanFreq()
##  Min.   :-1.000              Min.   :-1.0000               
##  1st Qu.:-0.968              1st Qu.:-0.0004               
##  Median :-0.905              Median : 0.1686               
##  Mean   :-0.878              Mean   : 0.1782               
##  3rd Qu.:-0.873              3rd Qu.: 0.3642               
##  Max.   : 1.000              Max.   : 0.9758               
##  fBodyBodyAccJerkMag-skewness() fBodyBodyAccJerkMag-kurtosis()
##  Min.   :-1.0000                Min.   :-1.000                
##  1st Qu.:-0.6075                1st Qu.:-0.882                
##  Median :-0.3648                Median :-0.727                
##  Mean   :-0.3130                Mean   :-0.615                
##  3rd Qu.:-0.0826                3rd Qu.:-0.450                
##  Max.   : 1.0000                Max.   : 1.000                
##  fBodyBodyGyroMag-mean() fBodyBodyGyroMag-std() fBodyBodyGyroMag-mad()
##  Min.   :-1.000          Min.   :-1.000         Min.   :-1.000        
##  1st Qu.:-0.984          1st Qu.:-0.980         1st Qu.:-0.981        
##  Median :-0.886          Median :-0.838         Median :-0.859        
##  Mean   :-0.693          Mean   :-0.693         Mean   :-0.675        
##  3rd Qu.:-0.438          3rd Qu.:-0.452         3rd Qu.:-0.397        
##  Max.   : 1.000          Max.   : 1.000         Max.   : 1.000        
##  fBodyBodyGyroMag-max() fBodyBodyGyroMag-min() fBodyBodyGyroMag-sma()
##  Min.   :-1.000         Min.   :-1.000         Min.   :-1.000        
##  1st Qu.:-0.981         1st Qu.:-0.994         1st Qu.:-0.984        
##  Median :-0.836         Median :-0.960         Median :-0.886        
##  Mean   :-0.727         Mean   :-0.885         Mean   :-0.693        
##  3rd Qu.:-0.541         3rd Qu.:-0.837         3rd Qu.:-0.438        
##  Max.   : 0.842         Max.   : 1.000         Max.   : 1.000        
##  fBodyBodyGyroMag-energy() fBodyBodyGyroMag-iqr()
##  Min.   :-1.000            Min.   :-1.000        
##  1st Qu.:-1.000            1st Qu.:-0.987        
##  Median :-0.986            Median :-0.923        
##  Mean   :-0.874            Mean   :-0.720        
##  3rd Qu.:-0.801            3rd Qu.:-0.484        
##  Max.   : 1.000            Max.   : 1.000        
##  fBodyBodyGyroMag-entropy() fBodyBodyGyroMag-maxInds
##  Min.   :-1.0000            Min.   :-1.000          
##  1st Qu.:-0.6904            1st Qu.:-1.000          
##  Median :-0.1902            Median :-0.949          
##  Mean   :-0.0879            Mean   :-0.889          
##  3rd Qu.: 0.5158            3rd Qu.:-0.846          
##  Max.   : 1.0000            Max.   : 1.000          
##  fBodyBodyGyroMag-meanFreq() fBodyBodyGyroMag-skewness()
##  Min.   :-0.9975             Min.   :-1.000             
##  1st Qu.:-0.2409             1st Qu.:-0.492             
##  Median :-0.0616             Median :-0.309             
##  Mean   :-0.0465             Mean   :-0.254             
##  3rd Qu.: 0.1488             3rd Qu.:-0.070             
##  Max.   : 1.0000             Max.   : 0.969             
##  fBodyBodyGyroMag-kurtosis() fBodyBodyGyroJerkMag-mean()
##  Min.   :-1.000              Min.   :-1.000             
##  1st Qu.:-0.802              1st Qu.:-0.993             
##  Median :-0.656              Median :-0.952             
##  Mean   :-0.565              Mean   :-0.779             
##  3rd Qu.:-0.428              3rd Qu.:-0.612             
##  Max.   : 0.949              Max.   : 1.000             
##  fBodyBodyGyroJerkMag-std() fBodyBodyGyroJerkMag-mad()
##  Min.   :-1.000             Min.   :-1.000            
##  1st Qu.:-0.994             1st Qu.:-0.993            
##  Median :-0.947             Median :-0.945            
##  Mean   :-0.792             Mean   :-0.773            
##  3rd Qu.:-0.643             3rd Qu.:-0.608            
##  Max.   : 1.000             Max.   : 1.000            
##  fBodyBodyGyroJerkMag-max() fBodyBodyGyroJerkMag-min()
##  Min.   :-1.000             Min.   :-1.000            
##  1st Qu.:-0.994             1st Qu.:-0.994            
##  Median :-0.951             Median :-0.976            
##  Mean   :-0.811             Mean   :-0.872            
##  3rd Qu.:-0.689             3rd Qu.:-0.808            
##  Max.   : 1.000             Max.   : 1.000            
##  fBodyBodyGyroJerkMag-sma() fBodyBodyGyroJerkMag-energy()
##  Min.   :-1.000             Min.   :-1.000               
##  1st Qu.:-0.993             1st Qu.:-1.000               
##  Median :-0.952             Median :-0.999               
##  Mean   :-0.779             Mean   :-0.936               
##  3rd Qu.:-0.612             3rd Qu.:-0.922               
##  Max.   : 1.000             Max.   : 1.000               
##  fBodyBodyGyroJerkMag-iqr() fBodyBodyGyroJerkMag-entropy()
##  Min.   :-1.000             Min.   :-1.000                
##  1st Qu.:-0.992             1st Qu.:-0.956                
##  Median :-0.950             Median :-0.456                
##  Mean   :-0.771             Mean   :-0.285                
##  3rd Qu.:-0.604             3rd Qu.: 0.337                
##  Max.   : 1.000             Max.   : 1.000                
##  fBodyBodyGyroJerkMag-maxInds fBodyBodyGyroJerkMag-meanFreq()
##  Min.   :-1.000               Min.   :-1.0000                
##  1st Qu.:-0.968               1st Qu.:-0.0237                
##  Median :-0.905               Median : 0.1340                
##  Mean   :-0.899               Mean   : 0.1253                
##  3rd Qu.:-0.873               3rd Qu.: 0.2891                
##  Max.   : 0.968               Max.   : 0.9467                
##  fBodyBodyGyroJerkMag-skewness() fBodyBodyGyroJerkMag-kurtosis()
##  Min.   :-0.995                  Min.   :-1.000                 
##  1st Qu.:-0.543                  1st Qu.:-0.846                 
##  Median :-0.344                  Median :-0.712                 
##  Mean   :-0.307                  Mean   :-0.625                 
##  3rd Qu.:-0.127                  3rd Qu.:-0.504                 
##  Max.   : 0.990                  Max.   : 0.957                 
##  angle(tBodyAccMean,gravity) angle(tBodyAccJerkMean),gravityMean)
##  Min.   :-0.9766             Min.   :-1.0000                     
##  1st Qu.:-0.1215             1st Qu.:-0.2895                     
##  Median : 0.0095             Median : 0.0089                     
##  Mean   : 0.0087             Mean   : 0.0022                     
##  3rd Qu.: 0.1509             3rd Qu.: 0.2929                     
##  Max.   : 1.0000             Max.   : 1.0000                     
##  angle(tBodyGyroMean,gravityMean) angle(tBodyGyroJerkMean,gravityMean)
##  Min.   :-1.0000                  Min.   :-1.0000                     
##  1st Qu.:-0.4823                  1st Qu.:-0.3763                     
##  Median : 0.0087                  Median :-0.0004                     
##  Mean   : 0.0087                  Mean   :-0.0060                     
##  3rd Qu.: 0.5062                  3rd Qu.: 0.3594                     
##  Max.   : 0.9987                  Max.   : 0.9961                     
##  angle(X,gravityMean) angle(Y,gravityMean) angle(Z,gravityMean)
##  Min.   :-1.000       Min.   :-1.0000      Min.   :-1.0000     
##  1st Qu.:-0.812       1st Qu.:-0.0179      1st Qu.:-0.1434     
##  Median :-0.709       Median : 0.1821      Median : 0.0032     
##  Mean   :-0.489       Mean   : 0.0586      Mean   :-0.0565     
##  3rd Qu.:-0.509       3rd Qu.: 0.2484      3rd Qu.: 0.1077     
##  Max.   : 1.000       Max.   : 0.4782      Max.   : 1.0000     
##     subject         activity   
##  Min.   : 1.0   laying  :1407  
##  1st Qu.: 8.0   sitting :1286  
##  Median :19.0   standing:1374  
##  Mean   :17.4   walk    :1226  
##  3rd Qu.:26.0   walkdown: 986  
##  Max.   :30.0   walkup  :1073
```

```r
sapply(samsungData[1, ], class)
```

```
##                    tBodyAcc-mean()-X                    tBodyAcc-mean()-Y 
##                            "numeric"                            "numeric" 
##                    tBodyAcc-mean()-Z                     tBodyAcc-std()-X 
##                            "numeric"                            "numeric" 
##                     tBodyAcc-std()-Y                     tBodyAcc-std()-Z 
##                            "numeric"                            "numeric" 
##                     tBodyAcc-mad()-X                     tBodyAcc-mad()-Y 
##                            "numeric"                            "numeric" 
##                     tBodyAcc-mad()-Z                     tBodyAcc-max()-X 
##                            "numeric"                            "numeric" 
##                     tBodyAcc-max()-Y                     tBodyAcc-max()-Z 
##                            "numeric"                            "numeric" 
##                     tBodyAcc-min()-X                     tBodyAcc-min()-Y 
##                            "numeric"                            "numeric" 
##                     tBodyAcc-min()-Z                       tBodyAcc-sma() 
##                            "numeric"                            "numeric" 
##                  tBodyAcc-energy()-X                  tBodyAcc-energy()-Y 
##                            "numeric"                            "numeric" 
##                  tBodyAcc-energy()-Z                     tBodyAcc-iqr()-X 
##                            "numeric"                            "numeric" 
##                     tBodyAcc-iqr()-Y                     tBodyAcc-iqr()-Z 
##                            "numeric"                            "numeric" 
##                 tBodyAcc-entropy()-X                 tBodyAcc-entropy()-Y 
##                            "numeric"                            "numeric" 
##                 tBodyAcc-entropy()-Z               tBodyAcc-arCoeff()-X,1 
##                            "numeric"                            "numeric" 
##               tBodyAcc-arCoeff()-X,2               tBodyAcc-arCoeff()-X,3 
##                            "numeric"                            "numeric" 
##               tBodyAcc-arCoeff()-X,4               tBodyAcc-arCoeff()-Y,1 
##                            "numeric"                            "numeric" 
##               tBodyAcc-arCoeff()-Y,2               tBodyAcc-arCoeff()-Y,3 
##                            "numeric"                            "numeric" 
##               tBodyAcc-arCoeff()-Y,4               tBodyAcc-arCoeff()-Z,1 
##                            "numeric"                            "numeric" 
##               tBodyAcc-arCoeff()-Z,2               tBodyAcc-arCoeff()-Z,3 
##                            "numeric"                            "numeric" 
##               tBodyAcc-arCoeff()-Z,4           tBodyAcc-correlation()-X,Y 
##                            "numeric"                            "numeric" 
##           tBodyAcc-correlation()-X,Z           tBodyAcc-correlation()-Y,Z 
##                            "numeric"                            "numeric" 
##                 tGravityAcc-mean()-X                 tGravityAcc-mean()-Y 
##                            "numeric"                            "numeric" 
##                 tGravityAcc-mean()-Z                  tGravityAcc-std()-X 
##                            "numeric"                            "numeric" 
##                  tGravityAcc-std()-Y                  tGravityAcc-std()-Z 
##                            "numeric"                            "numeric" 
##                  tGravityAcc-mad()-X                  tGravityAcc-mad()-Y 
##                            "numeric"                            "numeric" 
##                  tGravityAcc-mad()-Z                  tGravityAcc-max()-X 
##                            "numeric"                            "numeric" 
##                  tGravityAcc-max()-Y                  tGravityAcc-max()-Z 
##                            "numeric"                            "numeric" 
##                  tGravityAcc-min()-X                  tGravityAcc-min()-Y 
##                            "numeric"                            "numeric" 
##                  tGravityAcc-min()-Z                    tGravityAcc-sma() 
##                            "numeric"                            "numeric" 
##               tGravityAcc-energy()-X               tGravityAcc-energy()-Y 
##                            "numeric"                            "numeric" 
##               tGravityAcc-energy()-Z                  tGravityAcc-iqr()-X 
##                            "numeric"                            "numeric" 
##                  tGravityAcc-iqr()-Y                  tGravityAcc-iqr()-Z 
##                            "numeric"                            "numeric" 
##              tGravityAcc-entropy()-X              tGravityAcc-entropy()-Y 
##                            "numeric"                            "numeric" 
##              tGravityAcc-entropy()-Z            tGravityAcc-arCoeff()-X,1 
##                            "numeric"                            "numeric" 
##            tGravityAcc-arCoeff()-X,2            tGravityAcc-arCoeff()-X,3 
##                            "numeric"                            "numeric" 
##            tGravityAcc-arCoeff()-X,4            tGravityAcc-arCoeff()-Y,1 
##                            "numeric"                            "numeric" 
##            tGravityAcc-arCoeff()-Y,2            tGravityAcc-arCoeff()-Y,3 
##                            "numeric"                            "numeric" 
##            tGravityAcc-arCoeff()-Y,4            tGravityAcc-arCoeff()-Z,1 
##                            "numeric"                            "numeric" 
##            tGravityAcc-arCoeff()-Z,2            tGravityAcc-arCoeff()-Z,3 
##                            "numeric"                            "numeric" 
##            tGravityAcc-arCoeff()-Z,4        tGravityAcc-correlation()-X,Y 
##                            "numeric"                            "numeric" 
##        tGravityAcc-correlation()-X,Z        tGravityAcc-correlation()-Y,Z 
##                            "numeric"                            "numeric" 
##                tBodyAccJerk-mean()-X                tBodyAccJerk-mean()-Y 
##                            "numeric"                            "numeric" 
##                tBodyAccJerk-mean()-Z                 tBodyAccJerk-std()-X 
##                            "numeric"                            "numeric" 
##                 tBodyAccJerk-std()-Y                 tBodyAccJerk-std()-Z 
##                            "numeric"                            "numeric" 
##                 tBodyAccJerk-mad()-X                 tBodyAccJerk-mad()-Y 
##                            "numeric"                            "numeric" 
##                 tBodyAccJerk-mad()-Z                 tBodyAccJerk-max()-X 
##                            "numeric"                            "numeric" 
##                 tBodyAccJerk-max()-Y                 tBodyAccJerk-max()-Z 
##                            "numeric"                            "numeric" 
##                 tBodyAccJerk-min()-X                 tBodyAccJerk-min()-Y 
##                            "numeric"                            "numeric" 
##                 tBodyAccJerk-min()-Z                   tBodyAccJerk-sma() 
##                            "numeric"                            "numeric" 
##              tBodyAccJerk-energy()-X              tBodyAccJerk-energy()-Y 
##                            "numeric"                            "numeric" 
##              tBodyAccJerk-energy()-Z                 tBodyAccJerk-iqr()-X 
##                            "numeric"                            "numeric" 
##                 tBodyAccJerk-iqr()-Y                 tBodyAccJerk-iqr()-Z 
##                            "numeric"                            "numeric" 
##             tBodyAccJerk-entropy()-X             tBodyAccJerk-entropy()-Y 
##                            "numeric"                            "numeric" 
##             tBodyAccJerk-entropy()-Z           tBodyAccJerk-arCoeff()-X,1 
##                            "numeric"                            "numeric" 
##           tBodyAccJerk-arCoeff()-X,2           tBodyAccJerk-arCoeff()-X,3 
##                            "numeric"                            "numeric" 
##           tBodyAccJerk-arCoeff()-X,4           tBodyAccJerk-arCoeff()-Y,1 
##                            "numeric"                            "numeric" 
##           tBodyAccJerk-arCoeff()-Y,2           tBodyAccJerk-arCoeff()-Y,3 
##                            "numeric"                            "numeric" 
##           tBodyAccJerk-arCoeff()-Y,4           tBodyAccJerk-arCoeff()-Z,1 
##                            "numeric"                            "numeric" 
##           tBodyAccJerk-arCoeff()-Z,2           tBodyAccJerk-arCoeff()-Z,3 
##                            "numeric"                            "numeric" 
##           tBodyAccJerk-arCoeff()-Z,4       tBodyAccJerk-correlation()-X,Y 
##                            "numeric"                            "numeric" 
##       tBodyAccJerk-correlation()-X,Z       tBodyAccJerk-correlation()-Y,Z 
##                            "numeric"                            "numeric" 
##                   tBodyGyro-mean()-X                   tBodyGyro-mean()-Y 
##                            "numeric"                            "numeric" 
##                   tBodyGyro-mean()-Z                    tBodyGyro-std()-X 
##                            "numeric"                            "numeric" 
##                    tBodyGyro-std()-Y                    tBodyGyro-std()-Z 
##                            "numeric"                            "numeric" 
##                    tBodyGyro-mad()-X                    tBodyGyro-mad()-Y 
##                            "numeric"                            "numeric" 
##                    tBodyGyro-mad()-Z                    tBodyGyro-max()-X 
##                            "numeric"                            "numeric" 
##                    tBodyGyro-max()-Y                    tBodyGyro-max()-Z 
##                            "numeric"                            "numeric" 
##                    tBodyGyro-min()-X                    tBodyGyro-min()-Y 
##                            "numeric"                            "numeric" 
##                    tBodyGyro-min()-Z                      tBodyGyro-sma() 
##                            "numeric"                            "numeric" 
##                 tBodyGyro-energy()-X                 tBodyGyro-energy()-Y 
##                            "numeric"                            "numeric" 
##                 tBodyGyro-energy()-Z                    tBodyGyro-iqr()-X 
##                            "numeric"                            "numeric" 
##                    tBodyGyro-iqr()-Y                    tBodyGyro-iqr()-Z 
##                            "numeric"                            "numeric" 
##                tBodyGyro-entropy()-X                tBodyGyro-entropy()-Y 
##                            "numeric"                            "numeric" 
##                tBodyGyro-entropy()-Z              tBodyGyro-arCoeff()-X,1 
##                            "numeric"                            "numeric" 
##              tBodyGyro-arCoeff()-X,2              tBodyGyro-arCoeff()-X,3 
##                            "numeric"                            "numeric" 
##              tBodyGyro-arCoeff()-X,4              tBodyGyro-arCoeff()-Y,1 
##                            "numeric"                            "numeric" 
##              tBodyGyro-arCoeff()-Y,2              tBodyGyro-arCoeff()-Y,3 
##                            "numeric"                            "numeric" 
##              tBodyGyro-arCoeff()-Y,4              tBodyGyro-arCoeff()-Z,1 
##                            "numeric"                            "numeric" 
##              tBodyGyro-arCoeff()-Z,2              tBodyGyro-arCoeff()-Z,3 
##                            "numeric"                            "numeric" 
##              tBodyGyro-arCoeff()-Z,4          tBodyGyro-correlation()-X,Y 
##                            "numeric"                            "numeric" 
##          tBodyGyro-correlation()-X,Z          tBodyGyro-correlation()-Y,Z 
##                            "numeric"                            "numeric" 
##               tBodyGyroJerk-mean()-X               tBodyGyroJerk-mean()-Y 
##                            "numeric"                            "numeric" 
##               tBodyGyroJerk-mean()-Z                tBodyGyroJerk-std()-X 
##                            "numeric"                            "numeric" 
##                tBodyGyroJerk-std()-Y                tBodyGyroJerk-std()-Z 
##                            "numeric"                            "numeric" 
##                tBodyGyroJerk-mad()-X                tBodyGyroJerk-mad()-Y 
##                            "numeric"                            "numeric" 
##                tBodyGyroJerk-mad()-Z                tBodyGyroJerk-max()-X 
##                            "numeric"                            "numeric" 
##                tBodyGyroJerk-max()-Y                tBodyGyroJerk-max()-Z 
##                            "numeric"                            "numeric" 
##                tBodyGyroJerk-min()-X                tBodyGyroJerk-min()-Y 
##                            "numeric"                            "numeric" 
##                tBodyGyroJerk-min()-Z                  tBodyGyroJerk-sma() 
##                            "numeric"                            "numeric" 
##             tBodyGyroJerk-energy()-X             tBodyGyroJerk-energy()-Y 
##                            "numeric"                            "numeric" 
##             tBodyGyroJerk-energy()-Z                tBodyGyroJerk-iqr()-X 
##                            "numeric"                            "numeric" 
##                tBodyGyroJerk-iqr()-Y                tBodyGyroJerk-iqr()-Z 
##                            "numeric"                            "numeric" 
##            tBodyGyroJerk-entropy()-X            tBodyGyroJerk-entropy()-Y 
##                            "numeric"                            "numeric" 
##            tBodyGyroJerk-entropy()-Z          tBodyGyroJerk-arCoeff()-X,1 
##                            "numeric"                            "numeric" 
##          tBodyGyroJerk-arCoeff()-X,2          tBodyGyroJerk-arCoeff()-X,3 
##                            "numeric"                            "numeric" 
##          tBodyGyroJerk-arCoeff()-X,4          tBodyGyroJerk-arCoeff()-Y,1 
##                            "numeric"                            "numeric" 
##          tBodyGyroJerk-arCoeff()-Y,2          tBodyGyroJerk-arCoeff()-Y,3 
##                            "numeric"                            "numeric" 
##          tBodyGyroJerk-arCoeff()-Y,4          tBodyGyroJerk-arCoeff()-Z,1 
##                            "numeric"                            "numeric" 
##          tBodyGyroJerk-arCoeff()-Z,2          tBodyGyroJerk-arCoeff()-Z,3 
##                            "numeric"                            "numeric" 
##          tBodyGyroJerk-arCoeff()-Z,4      tBodyGyroJerk-correlation()-X,Y 
##                            "numeric"                            "numeric" 
##      tBodyGyroJerk-correlation()-X,Z      tBodyGyroJerk-correlation()-Y,Z 
##                            "numeric"                            "numeric" 
##                   tBodyAccMag-mean()                    tBodyAccMag-std() 
##                            "numeric"                            "numeric" 
##                    tBodyAccMag-mad()                    tBodyAccMag-max() 
##                            "numeric"                            "numeric" 
##                    tBodyAccMag-min()                    tBodyAccMag-sma() 
##                            "numeric"                            "numeric" 
##                 tBodyAccMag-energy()                    tBodyAccMag-iqr() 
##                            "numeric"                            "numeric" 
##                tBodyAccMag-entropy()               tBodyAccMag-arCoeff()1 
##                            "numeric"                            "numeric" 
##               tBodyAccMag-arCoeff()2               tBodyAccMag-arCoeff()3 
##                            "numeric"                            "numeric" 
##               tBodyAccMag-arCoeff()4                tGravityAccMag-mean() 
##                            "numeric"                            "numeric" 
##                 tGravityAccMag-std()                 tGravityAccMag-mad() 
##                            "numeric"                            "numeric" 
##                 tGravityAccMag-max()                 tGravityAccMag-min() 
##                            "numeric"                            "numeric" 
##                 tGravityAccMag-sma()              tGravityAccMag-energy() 
##                            "numeric"                            "numeric" 
##                 tGravityAccMag-iqr()             tGravityAccMag-entropy() 
##                            "numeric"                            "numeric" 
##            tGravityAccMag-arCoeff()1            tGravityAccMag-arCoeff()2 
##                            "numeric"                            "numeric" 
##            tGravityAccMag-arCoeff()3            tGravityAccMag-arCoeff()4 
##                            "numeric"                            "numeric" 
##               tBodyAccJerkMag-mean()                tBodyAccJerkMag-std() 
##                            "numeric"                            "numeric" 
##                tBodyAccJerkMag-mad()                tBodyAccJerkMag-max() 
##                            "numeric"                            "numeric" 
##                tBodyAccJerkMag-min()                tBodyAccJerkMag-sma() 
##                            "numeric"                            "numeric" 
##             tBodyAccJerkMag-energy()                tBodyAccJerkMag-iqr() 
##                            "numeric"                            "numeric" 
##            tBodyAccJerkMag-entropy()           tBodyAccJerkMag-arCoeff()1 
##                            "numeric"                            "numeric" 
##           tBodyAccJerkMag-arCoeff()2           tBodyAccJerkMag-arCoeff()3 
##                            "numeric"                            "numeric" 
##           tBodyAccJerkMag-arCoeff()4                  tBodyGyroMag-mean() 
##                            "numeric"                            "numeric" 
##                   tBodyGyroMag-std()                   tBodyGyroMag-mad() 
##                            "numeric"                            "numeric" 
##                   tBodyGyroMag-max()                   tBodyGyroMag-min() 
##                            "numeric"                            "numeric" 
##                   tBodyGyroMag-sma()                tBodyGyroMag-energy() 
##                            "numeric"                            "numeric" 
##                   tBodyGyroMag-iqr()               tBodyGyroMag-entropy() 
##                            "numeric"                            "numeric" 
##              tBodyGyroMag-arCoeff()1              tBodyGyroMag-arCoeff()2 
##                            "numeric"                            "numeric" 
##              tBodyGyroMag-arCoeff()3              tBodyGyroMag-arCoeff()4 
##                            "numeric"                            "numeric" 
##              tBodyGyroJerkMag-mean()               tBodyGyroJerkMag-std() 
##                            "numeric"                            "numeric" 
##               tBodyGyroJerkMag-mad()               tBodyGyroJerkMag-max() 
##                            "numeric"                            "numeric" 
##               tBodyGyroJerkMag-min()               tBodyGyroJerkMag-sma() 
##                            "numeric"                            "numeric" 
##            tBodyGyroJerkMag-energy()               tBodyGyroJerkMag-iqr() 
##                            "numeric"                            "numeric" 
##           tBodyGyroJerkMag-entropy()          tBodyGyroJerkMag-arCoeff()1 
##                            "numeric"                            "numeric" 
##          tBodyGyroJerkMag-arCoeff()2          tBodyGyroJerkMag-arCoeff()3 
##                            "numeric"                            "numeric" 
##          tBodyGyroJerkMag-arCoeff()4                    fBodyAcc-mean()-X 
##                            "numeric"                            "numeric" 
##                    fBodyAcc-mean()-Y                    fBodyAcc-mean()-Z 
##                            "numeric"                            "numeric" 
##                     fBodyAcc-std()-X                     fBodyAcc-std()-Y 
##                            "numeric"                            "numeric" 
##                     fBodyAcc-std()-Z                     fBodyAcc-mad()-X 
##                            "numeric"                            "numeric" 
##                     fBodyAcc-mad()-Y                     fBodyAcc-mad()-Z 
##                            "numeric"                            "numeric" 
##                     fBodyAcc-max()-X                     fBodyAcc-max()-Y 
##                            "numeric"                            "numeric" 
##                     fBodyAcc-max()-Z                     fBodyAcc-min()-X 
##                            "numeric"                            "numeric" 
##                     fBodyAcc-min()-Y                     fBodyAcc-min()-Z 
##                            "numeric"                            "numeric" 
##                       fBodyAcc-sma()                  fBodyAcc-energy()-X 
##                            "numeric"                            "numeric" 
##                  fBodyAcc-energy()-Y                  fBodyAcc-energy()-Z 
##                            "numeric"                            "numeric" 
##                     fBodyAcc-iqr()-X                     fBodyAcc-iqr()-Y 
##                            "numeric"                            "numeric" 
##                     fBodyAcc-iqr()-Z                 fBodyAcc-entropy()-X 
##                            "numeric"                            "numeric" 
##                 fBodyAcc-entropy()-Y                 fBodyAcc-entropy()-Z 
##                            "numeric"                            "numeric" 
##                   fBodyAcc-maxInds-X                   fBodyAcc-maxInds-Y 
##                            "numeric"                            "numeric" 
##                   fBodyAcc-maxInds-Z                fBodyAcc-meanFreq()-X 
##                            "numeric"                            "numeric" 
##                fBodyAcc-meanFreq()-Y                fBodyAcc-meanFreq()-Z 
##                            "numeric"                            "numeric" 
##                fBodyAcc-skewness()-X                fBodyAcc-kurtosis()-X 
##                            "numeric"                            "numeric" 
##                fBodyAcc-skewness()-Y                fBodyAcc-kurtosis()-Y 
##                            "numeric"                            "numeric" 
##                fBodyAcc-skewness()-Z                fBodyAcc-kurtosis()-Z 
##                            "numeric"                            "numeric" 
##           fBodyAcc-bandsEnergy()-1,8          fBodyAcc-bandsEnergy()-9,16 
##                            "numeric"                            "numeric" 
##         fBodyAcc-bandsEnergy()-17,24         fBodyAcc-bandsEnergy()-25,32 
##                            "numeric"                            "numeric" 
##         fBodyAcc-bandsEnergy()-33,40         fBodyAcc-bandsEnergy()-41,48 
##                            "numeric"                            "numeric" 
##         fBodyAcc-bandsEnergy()-49,56         fBodyAcc-bandsEnergy()-57,64 
##                            "numeric"                            "numeric" 
##          fBodyAcc-bandsEnergy()-1,16         fBodyAcc-bandsEnergy()-17,32 
##                            "numeric"                            "numeric" 
##         fBodyAcc-bandsEnergy()-33,48         fBodyAcc-bandsEnergy()-49,64 
##                            "numeric"                            "numeric" 
##          fBodyAcc-bandsEnergy()-1,24         fBodyAcc-bandsEnergy()-25,48 
##                            "numeric"                            "numeric" 
##           fBodyAcc-bandsEnergy()-1,8          fBodyAcc-bandsEnergy()-9,16 
##                            "numeric"                            "numeric" 
##         fBodyAcc-bandsEnergy()-17,24         fBodyAcc-bandsEnergy()-25,32 
##                            "numeric"                            "numeric" 
##         fBodyAcc-bandsEnergy()-33,40         fBodyAcc-bandsEnergy()-41,48 
##                            "numeric"                            "numeric" 
##         fBodyAcc-bandsEnergy()-49,56         fBodyAcc-bandsEnergy()-57,64 
##                            "numeric"                            "numeric" 
##          fBodyAcc-bandsEnergy()-1,16         fBodyAcc-bandsEnergy()-17,32 
##                            "numeric"                            "numeric" 
##         fBodyAcc-bandsEnergy()-33,48         fBodyAcc-bandsEnergy()-49,64 
##                            "numeric"                            "numeric" 
##          fBodyAcc-bandsEnergy()-1,24         fBodyAcc-bandsEnergy()-25,48 
##                            "numeric"                            "numeric" 
##           fBodyAcc-bandsEnergy()-1,8          fBodyAcc-bandsEnergy()-9,16 
##                            "numeric"                            "numeric" 
##         fBodyAcc-bandsEnergy()-17,24         fBodyAcc-bandsEnergy()-25,32 
##                            "numeric"                            "numeric" 
##         fBodyAcc-bandsEnergy()-33,40         fBodyAcc-bandsEnergy()-41,48 
##                            "numeric"                            "numeric" 
##         fBodyAcc-bandsEnergy()-49,56         fBodyAcc-bandsEnergy()-57,64 
##                            "numeric"                            "numeric" 
##          fBodyAcc-bandsEnergy()-1,16         fBodyAcc-bandsEnergy()-17,32 
##                            "numeric"                            "numeric" 
##         fBodyAcc-bandsEnergy()-33,48         fBodyAcc-bandsEnergy()-49,64 
##                            "numeric"                            "numeric" 
##          fBodyAcc-bandsEnergy()-1,24         fBodyAcc-bandsEnergy()-25,48 
##                            "numeric"                            "numeric" 
##                fBodyAccJerk-mean()-X                fBodyAccJerk-mean()-Y 
##                            "numeric"                            "numeric" 
##                fBodyAccJerk-mean()-Z                 fBodyAccJerk-std()-X 
##                            "numeric"                            "numeric" 
##                 fBodyAccJerk-std()-Y                 fBodyAccJerk-std()-Z 
##                            "numeric"                            "numeric" 
##                 fBodyAccJerk-mad()-X                 fBodyAccJerk-mad()-Y 
##                            "numeric"                            "numeric" 
##                 fBodyAccJerk-mad()-Z                 fBodyAccJerk-max()-X 
##                            "numeric"                            "numeric" 
##                 fBodyAccJerk-max()-Y                 fBodyAccJerk-max()-Z 
##                            "numeric"                            "numeric" 
##                 fBodyAccJerk-min()-X                 fBodyAccJerk-min()-Y 
##                            "numeric"                            "numeric" 
##                 fBodyAccJerk-min()-Z                   fBodyAccJerk-sma() 
##                            "numeric"                            "numeric" 
##              fBodyAccJerk-energy()-X              fBodyAccJerk-energy()-Y 
##                            "numeric"                            "numeric" 
##              fBodyAccJerk-energy()-Z                 fBodyAccJerk-iqr()-X 
##                            "numeric"                            "numeric" 
##                 fBodyAccJerk-iqr()-Y                 fBodyAccJerk-iqr()-Z 
##                            "numeric"                            "numeric" 
##             fBodyAccJerk-entropy()-X             fBodyAccJerk-entropy()-Y 
##                            "numeric"                            "numeric" 
##             fBodyAccJerk-entropy()-Z               fBodyAccJerk-maxInds-X 
##                            "numeric"                            "numeric" 
##               fBodyAccJerk-maxInds-Y               fBodyAccJerk-maxInds-Z 
##                            "numeric"                            "numeric" 
##            fBodyAccJerk-meanFreq()-X            fBodyAccJerk-meanFreq()-Y 
##                            "numeric"                            "numeric" 
##            fBodyAccJerk-meanFreq()-Z            fBodyAccJerk-skewness()-X 
##                            "numeric"                            "numeric" 
##            fBodyAccJerk-kurtosis()-X            fBodyAccJerk-skewness()-Y 
##                            "numeric"                            "numeric" 
##            fBodyAccJerk-kurtosis()-Y            fBodyAccJerk-skewness()-Z 
##                            "numeric"                            "numeric" 
##            fBodyAccJerk-kurtosis()-Z       fBodyAccJerk-bandsEnergy()-1,8 
##                            "numeric"                            "numeric" 
##      fBodyAccJerk-bandsEnergy()-9,16     fBodyAccJerk-bandsEnergy()-17,24 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-25,32     fBodyAccJerk-bandsEnergy()-33,40 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-41,48     fBodyAccJerk-bandsEnergy()-49,56 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-57,64      fBodyAccJerk-bandsEnergy()-1,16 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-17,32     fBodyAccJerk-bandsEnergy()-33,48 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-49,64      fBodyAccJerk-bandsEnergy()-1,24 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-25,48       fBodyAccJerk-bandsEnergy()-1,8 
##                            "numeric"                            "numeric" 
##      fBodyAccJerk-bandsEnergy()-9,16     fBodyAccJerk-bandsEnergy()-17,24 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-25,32     fBodyAccJerk-bandsEnergy()-33,40 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-41,48     fBodyAccJerk-bandsEnergy()-49,56 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-57,64      fBodyAccJerk-bandsEnergy()-1,16 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-17,32     fBodyAccJerk-bandsEnergy()-33,48 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-49,64      fBodyAccJerk-bandsEnergy()-1,24 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-25,48       fBodyAccJerk-bandsEnergy()-1,8 
##                            "numeric"                            "numeric" 
##      fBodyAccJerk-bandsEnergy()-9,16     fBodyAccJerk-bandsEnergy()-17,24 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-25,32     fBodyAccJerk-bandsEnergy()-33,40 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-41,48     fBodyAccJerk-bandsEnergy()-49,56 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-57,64      fBodyAccJerk-bandsEnergy()-1,16 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-17,32     fBodyAccJerk-bandsEnergy()-33,48 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-49,64      fBodyAccJerk-bandsEnergy()-1,24 
##                            "numeric"                            "numeric" 
##     fBodyAccJerk-bandsEnergy()-25,48                   fBodyGyro-mean()-X 
##                            "numeric"                            "numeric" 
##                   fBodyGyro-mean()-Y                   fBodyGyro-mean()-Z 
##                            "numeric"                            "numeric" 
##                    fBodyGyro-std()-X                    fBodyGyro-std()-Y 
##                            "numeric"                            "numeric" 
##                    fBodyGyro-std()-Z                    fBodyGyro-mad()-X 
##                            "numeric"                            "numeric" 
##                    fBodyGyro-mad()-Y                    fBodyGyro-mad()-Z 
##                            "numeric"                            "numeric" 
##                    fBodyGyro-max()-X                    fBodyGyro-max()-Y 
##                            "numeric"                            "numeric" 
##                    fBodyGyro-max()-Z                    fBodyGyro-min()-X 
##                            "numeric"                            "numeric" 
##                    fBodyGyro-min()-Y                    fBodyGyro-min()-Z 
##                            "numeric"                            "numeric" 
##                      fBodyGyro-sma()                 fBodyGyro-energy()-X 
##                            "numeric"                            "numeric" 
##                 fBodyGyro-energy()-Y                 fBodyGyro-energy()-Z 
##                            "numeric"                            "numeric" 
##                    fBodyGyro-iqr()-X                    fBodyGyro-iqr()-Y 
##                            "numeric"                            "numeric" 
##                    fBodyGyro-iqr()-Z                fBodyGyro-entropy()-X 
##                            "numeric"                            "numeric" 
##                fBodyGyro-entropy()-Y                fBodyGyro-entropy()-Z 
##                            "numeric"                            "numeric" 
##                  fBodyGyro-maxInds-X                  fBodyGyro-maxInds-Y 
##                            "numeric"                            "numeric" 
##                  fBodyGyro-maxInds-Z               fBodyGyro-meanFreq()-X 
##                            "numeric"                            "numeric" 
##               fBodyGyro-meanFreq()-Y               fBodyGyro-meanFreq()-Z 
##                            "numeric"                            "numeric" 
##               fBodyGyro-skewness()-X               fBodyGyro-kurtosis()-X 
##                            "numeric"                            "numeric" 
##               fBodyGyro-skewness()-Y               fBodyGyro-kurtosis()-Y 
##                            "numeric"                            "numeric" 
##               fBodyGyro-skewness()-Z               fBodyGyro-kurtosis()-Z 
##                            "numeric"                            "numeric" 
##          fBodyGyro-bandsEnergy()-1,8         fBodyGyro-bandsEnergy()-9,16 
##                            "numeric"                            "numeric" 
##        fBodyGyro-bandsEnergy()-17,24        fBodyGyro-bandsEnergy()-25,32 
##                            "numeric"                            "numeric" 
##        fBodyGyro-bandsEnergy()-33,40        fBodyGyro-bandsEnergy()-41,48 
##                            "numeric"                            "numeric" 
##        fBodyGyro-bandsEnergy()-49,56        fBodyGyro-bandsEnergy()-57,64 
##                            "numeric"                            "numeric" 
##         fBodyGyro-bandsEnergy()-1,16        fBodyGyro-bandsEnergy()-17,32 
##                            "numeric"                            "numeric" 
##        fBodyGyro-bandsEnergy()-33,48        fBodyGyro-bandsEnergy()-49,64 
##                            "numeric"                            "numeric" 
##         fBodyGyro-bandsEnergy()-1,24        fBodyGyro-bandsEnergy()-25,48 
##                            "numeric"                            "numeric" 
##          fBodyGyro-bandsEnergy()-1,8         fBodyGyro-bandsEnergy()-9,16 
##                            "numeric"                            "numeric" 
##        fBodyGyro-bandsEnergy()-17,24        fBodyGyro-bandsEnergy()-25,32 
##                            "numeric"                            "numeric" 
##        fBodyGyro-bandsEnergy()-33,40        fBodyGyro-bandsEnergy()-41,48 
##                            "numeric"                            "numeric" 
##        fBodyGyro-bandsEnergy()-49,56        fBodyGyro-bandsEnergy()-57,64 
##                            "numeric"                            "numeric" 
##         fBodyGyro-bandsEnergy()-1,16        fBodyGyro-bandsEnergy()-17,32 
##                            "numeric"                            "numeric" 
##        fBodyGyro-bandsEnergy()-33,48        fBodyGyro-bandsEnergy()-49,64 
##                            "numeric"                            "numeric" 
##         fBodyGyro-bandsEnergy()-1,24        fBodyGyro-bandsEnergy()-25,48 
##                            "numeric"                            "numeric" 
##          fBodyGyro-bandsEnergy()-1,8         fBodyGyro-bandsEnergy()-9,16 
##                            "numeric"                            "numeric" 
##        fBodyGyro-bandsEnergy()-17,24        fBodyGyro-bandsEnergy()-25,32 
##                            "numeric"                            "numeric" 
##        fBodyGyro-bandsEnergy()-33,40        fBodyGyro-bandsEnergy()-41,48 
##                            "numeric"                            "numeric" 
##        fBodyGyro-bandsEnergy()-49,56        fBodyGyro-bandsEnergy()-57,64 
##                            "numeric"                            "numeric" 
##         fBodyGyro-bandsEnergy()-1,16        fBodyGyro-bandsEnergy()-17,32 
##                            "numeric"                            "numeric" 
##        fBodyGyro-bandsEnergy()-33,48        fBodyGyro-bandsEnergy()-49,64 
##                            "numeric"                            "numeric" 
##         fBodyGyro-bandsEnergy()-1,24        fBodyGyro-bandsEnergy()-25,48 
##                            "numeric"                            "numeric" 
##                   fBodyAccMag-mean()                    fBodyAccMag-std() 
##                            "numeric"                            "numeric" 
##                    fBodyAccMag-mad()                    fBodyAccMag-max() 
##                            "numeric"                            "numeric" 
##                    fBodyAccMag-min()                    fBodyAccMag-sma() 
##                            "numeric"                            "numeric" 
##                 fBodyAccMag-energy()                    fBodyAccMag-iqr() 
##                            "numeric"                            "numeric" 
##                fBodyAccMag-entropy()                  fBodyAccMag-maxInds 
##                            "numeric"                            "numeric" 
##               fBodyAccMag-meanFreq()               fBodyAccMag-skewness() 
##                            "numeric"                            "numeric" 
##               fBodyAccMag-kurtosis()           fBodyBodyAccJerkMag-mean() 
##                            "numeric"                            "numeric" 
##            fBodyBodyAccJerkMag-std()            fBodyBodyAccJerkMag-mad() 
##                            "numeric"                            "numeric" 
##            fBodyBodyAccJerkMag-max()            fBodyBodyAccJerkMag-min() 
##                            "numeric"                            "numeric" 
##            fBodyBodyAccJerkMag-sma()         fBodyBodyAccJerkMag-energy() 
##                            "numeric"                            "numeric" 
##            fBodyBodyAccJerkMag-iqr()        fBodyBodyAccJerkMag-entropy() 
##                            "numeric"                            "numeric" 
##          fBodyBodyAccJerkMag-maxInds       fBodyBodyAccJerkMag-meanFreq() 
##                            "numeric"                            "numeric" 
##       fBodyBodyAccJerkMag-skewness()       fBodyBodyAccJerkMag-kurtosis() 
##                            "numeric"                            "numeric" 
##              fBodyBodyGyroMag-mean()               fBodyBodyGyroMag-std() 
##                            "numeric"                            "numeric" 
##               fBodyBodyGyroMag-mad()               fBodyBodyGyroMag-max() 
##                            "numeric"                            "numeric" 
##               fBodyBodyGyroMag-min()               fBodyBodyGyroMag-sma() 
##                            "numeric"                            "numeric" 
##            fBodyBodyGyroMag-energy()               fBodyBodyGyroMag-iqr() 
##                            "numeric"                            "numeric" 
##           fBodyBodyGyroMag-entropy()             fBodyBodyGyroMag-maxInds 
##                            "numeric"                            "numeric" 
##          fBodyBodyGyroMag-meanFreq()          fBodyBodyGyroMag-skewness() 
##                            "numeric"                            "numeric" 
##          fBodyBodyGyroMag-kurtosis()          fBodyBodyGyroJerkMag-mean() 
##                            "numeric"                            "numeric" 
##           fBodyBodyGyroJerkMag-std()           fBodyBodyGyroJerkMag-mad() 
##                            "numeric"                            "numeric" 
##           fBodyBodyGyroJerkMag-max()           fBodyBodyGyroJerkMag-min() 
##                            "numeric"                            "numeric" 
##           fBodyBodyGyroJerkMag-sma()        fBodyBodyGyroJerkMag-energy() 
##                            "numeric"                            "numeric" 
##           fBodyBodyGyroJerkMag-iqr()       fBodyBodyGyroJerkMag-entropy() 
##                            "numeric"                            "numeric" 
##         fBodyBodyGyroJerkMag-maxInds      fBodyBodyGyroJerkMag-meanFreq() 
##                            "numeric"                            "numeric" 
##      fBodyBodyGyroJerkMag-skewness()      fBodyBodyGyroJerkMag-kurtosis() 
##                            "numeric"                            "numeric" 
##          angle(tBodyAccMean,gravity) angle(tBodyAccJerkMean),gravityMean) 
##                            "numeric"                            "numeric" 
##     angle(tBodyGyroMean,gravityMean) angle(tBodyGyroJerkMean,gravityMean) 
##                            "numeric"                            "numeric" 
##                 angle(X,gravityMean)                 angle(Y,gravityMean) 
##                            "numeric"                            "numeric" 
##                 angle(Z,gravityMean)                              subject 
##                            "numeric"                            "integer" 
##                             activity 
##                             "factor"
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

#### Testing

#### Validation (optional)

### 4. On the training set pick features

### 5. On the training set pick prediction function

### 6. On the training set cross-validate

### 7. If no validation - apply 1x to test set

### 8. If validation - apply to test set and refine 

### 9. If validation - apply 1x to validation
