coursera-getting-and-cleaning-data-project<pre>
是獲取和清潔數據Coursera課程的課程項目。R腳本run_analysis.R執行以下操作：<pre>   
如果數據集不存在於工作目錄中，請下載該數據集 <pre>
   
加載活動和功能信息<pre>    
加載訓練和測試數據集，只保留反映平均值或標準偏差的列<pre>
加載每個數據集的活動和主題數據，並將這些列與數據集合併<pre> 
合併兩個數據集<pre>
將列activity和subject列轉換為因子<pre>
創建一個整潔的數據集，其中包含每個主題和活動對的每個變量的平均值（平均值）<pre>
最終結果顯示在文件中tidy.txt。<pre>   
