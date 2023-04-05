#===========REGRESI (sales of cereal which increased the number of doctor visits)==========



#1. Import data on cereal sales and dentist visits
sales <- read.csv('https://storage.googleapis.com/dqlab-dataset/tingkat_penjualan_kota_x_dqlab.tsv', header=TRUE, sep='\t')
dentist_visits <- read.csv('https://storage.googleapis.com/dqlab-dataset/kunjungan_dokter_gigi_kota_x_dqlab.tsv', header=TRUE, sep='\t')

sales
dentist_visits


#2. Merge two datasets using R 
merge(sales, dentist_visits, by=c('Bulan','Tahun'))
combined_data <- merge(sales, dentist_visits, by.x=c('Bulan','Tahun'), by.y=c('Bulan','Tahun'), sort=FALSE)
combined_data

#3. Summarize the data to be used in the combined data and column elimination
combined_data<- data.frame(month=combined_data$Bulan,
                           year=combined_data$Tahun,
                           dentist_visits=combined_data$tingkat.kunjungan.ke.dokter.gigi,
                           candy_sales=combined_data$penjualan.permen)
summary(combined_data)



## data visualization using scatter plot
plot(combined_data$dentist_visits,combined_data$candy_sales,
     pch=19,
     xlab='Dentist visits',
     ylab='Candy sales',
     main='Doctor visits with candy sales',
     col='green')
## ""In the plot, it is shown that there is no linear relationship between the amount of candy sales 
##and increasing visits to the dentist.""
## ""In fact, after consuming candy (as before: cereal), there is a waiting period until finally visiting the dentist. 
##So that the data wrangling process is carried out, especially for the 6-month data period.""


## Delayed period data.
library (dplyr)
data_delayed_effect <- data.frame(
  month= combined_data$month,
  year= combined_data$year,
  dentist_visits= combined_data$dentist_visits,
  candy_sales= combined_data$candy_sales,
  candy_sales_1= lag(combined_data$candy_sales),
  candy_sales_2= lag(combined_data$candy_sales,2),
  candy_sales_3= lag(combined_data$candy_sales,3),
  candy_sales_4= lag(combined_data$candy_sales,4),
  candy_sales_5= lag(combined_data$candy_sales,5),
  candy_sales_6= lag(combined_data$candy_sales,6)
)

head(data_delayed_effect,10)

plot(data_delayed_effect$dentist_visits, data_delayed_effect$candy_sales_1,
     pch= 19,
     xlab= 'Dentist Visits',
     ylab= 'Candy sales',
     main= 'Doctor visits with candy sales(delay of 1 months)',
     col= 'blue')
plot(data_delayed_effect$dentist_visits, data_delayed_effect$candy_sales_2,
     pch= 19,
     xlab= 'Dentist visits',
     ylab= 'Candy sales',
     main= 'Doctor visits with candy sales(delay of 2 months)',
     col= 'blue')
plot(data_delayed_effect$dentist_visits, data_delayed_effect$candy_sales_3,
     pch= 19,
     xlab='Denstist visits',
     ylab= 'Candy sales',
     main= 'Doctor visits with candy sales(delay of 3 months)',
     col= 'blue')
plot(data_delayed_effect$dentist_visits,data_delayed_effect$candy_sales_4,
     pch= 19,
     xlab= 'Dentist visits',
     ylab= 'Candy sales',
     main= 'Doctor visits with candy sales(delay of 4 months)',
     col= 'blue')
plot(data_delayed_effect$dentist_visits,data_delayed_effect$candy_sales_5,
     pch= 19,
     xlab= 'Denstist visits',
     ylab= 'Candy sales',
     main= 'Doctor visits with candy sales(delay of 5 months)',
     col= 'blue')
plot(data_delayed_effect$dentist_visits,data_delayed_effect$candy_sales_6,
     pch= 19,
     xlab= 'Dentist visits',
     ylab= 'Candy sales',
     main = 'Doctor visits with candy sales(delay of 6 months)',
     col= 'blue')
## ""Based on the scatter plot of the delayed period effect, it can be seen 
##that the delayed period of 4 months is a variable with a fairly strong relationship with doctor visits.""


# 4. Regression analysis with R
data_regresi = data.frame(
  month= data_delayed_effect$month,
  year= data_delayed_effect$year,
  dentist_visits= data_delayed_effect$dentist_visits,
  candy_sales= data_delayed_effect$candy_sales_4
)

## Eliminating NA data
data_regresi= na.omit(data_regresi)
## Regression model with R
model = lm(dentist_visits ~ candy_sales, data=data_regresi)
summary(model)

#Using the predict method to predict doctor visits based on dummy data
data_predict= data.frame(
  month= c(1,2,3,4,5),
  year= c(2000,2000,2000,2000,2000),
  candy_sales= c(123456,654321,321465,421342,254634)
)
predict(model, data_predict) #predict the number of doctor visits in that month


