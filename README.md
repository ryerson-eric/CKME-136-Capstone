# CKME-136-Capstone
Future Sales Prediction 

<Prediction Future Sales>
Introduction

In Business, sales prediction plays an important role to plan for growth, inventory control and cash flow. And lots of businesses have a difficulty to predict future sales. 
To help future business prediction, I researched historical daily sales data containing item, store, price and total number of sold items. Principal component analysis (PCA) will be used to identify important variables. Regression techniques such as linear regression models and classification and KNN regression will be used as well, to identify relations between items and shops. To analyze historical sales records and predict future sales, the tool, R and python will be used.   
Literature Review

Literature about concept of sales prediction 
Frost, AJA “The Ultimate Guide to sales Forecasting and Predictive sales Analytics.” Web
https://blog.hubspot.com/sales/sales-forecasting
This article illustrated basic concept and importance of predictive sales analysis. The importance of sales forecasting is making future sales strategy also can be powerful motivation tool. There are lots of different methods to predict sales forecasting, such as Opportunity Stage Forecasting, Length of Sales Cycle Forecasting, Intuitive Forecasting, Historical Forecasting, Multi-variable Forecasting and Pipeline Forecasting. 
Literature about Regression model and time series forecasting 
Koushik, Raja B., Ravindran Sharan Kumar “R Data Science Essentials” Packt publishing. Print 
This book introduced different regression models using R for solving business cases. It also explained importance of evaluating and improving of the accuracy of regression models, for example replacing n/a values to mean or median, removing the highly correlated values and removing outlier. 
Specially in sales forecasting or weather forecasting which have certain pattern or trending, time series forecasting method used. This book mainly focused on autoregressive integrated moving average (ARIMA) and Holt-winters method.  

M.Pavlyshenko, Bohdan “Machine Learning Models for sales Time Series Forecasting”. Web   
https://res.mdpi.com/data/data-04-00015/article_deploy/data-04-00015-v2.pdf?filename=&attachment=1
In this article, author Bohdan studied how they predicted long term sales with incomplete short-term period of time of data. With assumption that sales has certain patterns corresponding external factors for instance promo, seasonality and trend.  The article reveals regression approaches is powerful tool to predict long term sales. To analyze pattern of sales, first descriptive analytics methods were used also since data contains limited time of period, supervised machine leaning method which was Random Forest was applied for study.  
Dataset
Give the description of the dataset that you are using along with the individual attributes you will or will not use in your analysis. Also mention the source of the dataset (where did you get it from). In case the data is curated and created by you please explain the details. Descriptive statistics of the attributes and datasets can also be provided here.
I use the csv. file of the historical sales data provided by one of largest Russian software firms, 1C Company provided by Kaggle.com.  These datasets contain item category, items, shops, sales train and test. The Sales train dataset contains daily data from January 2013 to October 2015. My final project will be predicted sales shops and products on November 2015 with train data set.  
Since these data sets are recorded in Russian, English version of item and shop data sets will be used from Predict Future Supplementary in Kaggle. This supplementary data sets contains additional Russian holiday calendar data sets which will be very useful to analyze between sales and seasonality.  Each data sets attributes are listed below: 
•	ID - an Id that represents a (Shop, Item) tuple within the test set
•	Shop id - unique identifier of a shop
•	Item id - unique identifier of a product
•	Item category id - unique identifier of item category
•	Item cnt day - number of products sold. You are predicting a monthly amount of this measure
•	Item price - current price of an item
•	date - date in format dd/mm/yyyy
•	date block num - a consecutive month number, used for convenience. From January 2013 = 0 to October 2015 = 33
•	Item name - name of item
•	Shop name - name of shop
•	Item category name - name of item category

To explore data set I merged train data set by its shop Id, item id and item category id. Using “sum(is.na)” in R, I confirmed my data set does not have any N/A value. 
Approach
.
 
Step 1: <Data Collection>
Write details of the step 1. If there is any source code that you’d like to share then provide the link of the Github.
•	Downloading the dataset
•	Importing the data into R and python 
•	Importing data set into R
https://github.com/ryerson-eric/CKME-136-Capstone/blob/master/Data%20Collection

Step 2: <Data Cleaning>

•	Checking data sets
•	Merging dataset to one data frame
•	Testing if dataset contains N/A values. 
•	Checking any duplicated data 
•	Checking mean and median and verifying any outlier data
https://github.com/ryerson-eric/CKME-136-Capstone/blob/master/Data%20Cleaning

Step 3: <Data Exploration>

•	Merging dataset to one data frame
•	Summarizing data
•	Checking data with few questions
•	What is most popular item?
•	Which shop is most selling item?
•	What are total sales per each months or years?
https://github.com/ryerson-eric/CKME-136-Capstone/blob/master/Data%20Exploration


