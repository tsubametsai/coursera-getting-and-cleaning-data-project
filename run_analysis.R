資料庫（reshape2）
文件名 < -  “ getdata_dataset.zip ”
＃＃下載並解壓縮數據集：
if（！ file.exists（filename））{
fileURL  < -  “ https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ”
  download.file（fileURL，文件名，method = “ curl ”）
} 
if（！ file.exists（“ UCI HAR Dataset ”））{
解壓縮（文件名）
}

＃加載活動標籤+功能
activityLabels  < - read.table（“ UCI HAR Dataset / activity_labels.txt ”）
activityLabels [，2 ] < - as.character（activityLabels [，2 ]）
features  < - read.table（“ UCI HAR Dataset / features.txt ”）
特徵 [，2 ] < - as.character（特徵 [，2 ]）

＃僅提取平均值和標準偏差的數據
featuresWanted  < - grep（“。* mean。* |。* std。* ”，features [，2 ]）
featuresWanted.names  < -  功能 [ featuresWanted，2 ]
featuresWanted.names  = gsub（'- mean '，' Mean '，featuresWanted.names）
featuresWanted.names  = GSUB（' -std '，'標準'，featuresWanted.names）
featuresWanted.names  < - gsub（' [ - （）] '，' '，featuresWanted.names）

＃加載數據集
火車 < - read.table（“ UCI HAR數據集/ train / X_train.txt ”）[ featuresWanted ]
trainActivities  < - read.table（“ UCI HAR數據集/火車/ Y_train.txt ”）
trainSubjects  < - read.table（“ UCI HAR Dataset / train / subject_train.txt ”）
火車 < - cbind（trainSubjects，trainActivities，train）
測試 < - read.table（“ UCI HAR數據集/測試/ X_test.txt ”）[ featuresWanted ]
testActivities  < - read.table（“ UCI HAR Dataset / test / Y_test.txt ”）
testSubjects  < - read.table（“ UCI HAR Dataset / test / subject_test.txt ”）
測試 < - cbind（testSubjects，testActivities，test）

＃合併數據集並添加標籤
allData  < - rbind（train，test）
colnames（allData）< - c（“ subject ”，“ activity ”，featuresWanted.names）

＃將活動和主題轉化為因素
allData $ activity  < -  factor（allData $ activity，levels  =  activityLabels [，1 ]，labels  =  activityLabels [，2 ]）
allData $ subject  < - as.factor（allData $ subject）
allData.melted  < - melt（allData，id  = c（“ subject ”，“ activity ”））
allData.mean  < - dcast（allData.melted，受試者 +  活動 〜 變量，平均）
write.table（allData.mean，“ tidy.txt ”，row.names  =  FALSE，quote  =  FALSE）
