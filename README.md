# 基於深度學習與影像辨識的居家腸道疾病健檢系統開發

## 專題介紹影片
 - [專題架構介紹](https://youtu.be/-Y4jloNef_w)
        因影片時長限制，有將解說內容快轉，建議可以以0.75倍速播放，能更清楚瞭解專題整體架構與內容
 - [專題Demo](https://youtu.be/lKP8vwg00AQ)


## 研究內容
大腸癌罹癌與死亡人數，逐年快速攀升，位居所有癌症發生率及死亡率的第2位及第3位。大腸癌早期並無症狀，但可以藉由定期接受篩檢而早期發現早期治療，為治癒率很高的癌症。根據統計，糞便潛血檢查不受飲食或藥物影響，採樣方便，但需去醫院檢查，且50歲以上才有健保給付。我們認為，預防不單是在醫院做檢查，理想的狀況是在日常生活就對自身的健康狀況有大致的把握，因此我們研發了一套系統，利用深度學習與影像辨識，透過手機拍照，就能從排遺中分析腸道的健康狀況。本專題由四個子系統構成：(1)影像辨識系統、(2)光譜分析系統、(3)後端資料儲存與傳輸、(4)前端呈現。

影像辨識系統能夠擷取糞便照片中的6種特徵，整合每種特徵的結果後，計算出健康分數，並提供診斷建議，讓使用者可以透過數字快速了解自己的健康狀況，並透過文字建議，調整日常生活。\
光譜分析系統需使用我們自己開發的光譜相機拍攝相片後，轉換成光譜資料，再透過深度學習的模型，分析其中是否含血。\
後端資料儲存與傳輸，除了建立資料庫儲存使用者資料外，還負責整合影像辨識系統與光譜分析系統，成為前端與模型溝通的橋樑。\
最後的前端系統，可在Android、iOS與Web三個平台使用，從系統中上傳資料及影像、查看會員資訊、記錄登入資訊、呈現使用者健康狀況、進行歷史資料查詢，以及透過API讓光譜相機進行拍照等。


## 參與競賽
 - 2022年8月參加「2022全國大專校院智慧創新暨跨域整合創作競賽」榮獲 [物聯網組 第二名](https://niicc.cilab.csie.ncu.edu.tw/files/2022/2022%E6%99%BA%E6%85%A7%E5%89%B5%E6%96%B0%E6%9A%A8%E8%B7%A8%E5%9F%9F%E6%95%B4%E5%90%88%E5%89%B5%E4%BD%9C%E7%AB%B6%E8%B3%BD_%E5%BE%97%E7%8D%8E%E5%90%8D%E5%96%AE.pdf)
 - 2022年9月參加「2022第27屆全國大專校院資訊應用服務創新競賽」榮獲 [AIoT創新應用組 第一名 及 資訊應用組 第三名](https://innoserve.tca.org.tw/award.aspx)
 - 宜蘭大學資訊工程學系110學年度專題研究製作競賽榮獲第一名
 - 宜蘭大學電機資訊學院110學年度VIP特色專題製作競賽榮獲佳作

### 工作分配
 - **謝奇容** 前端系統設計與製作、API與資料庫初期設計、光譜相機初版3D建模設計、光譜資料辨識深度學習模型前期架構、海報整理與製作
 - 王采筑  光譜相機設計、光譜相機製作、光譜影像編碼、書面報告整理
 - 吳宥俞  影像辨識系統
 - 賴濰凱  影像辨識系統、光譜資料辨識深度學習模型、API與資料庫設計、iOS系統測試、影片剪輯

