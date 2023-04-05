In recent months, there has been an increase in the number of pediatric patients visiting the dentist. This is caused by several factors, one of which is the pattern of consumption habits of children. So an analysis is needed to determine the relationship between the increasing number of pediatric patient visits to the dentist and children's consumption behavior.

The steps used in this analysis are as follows:
1. Import data from two datasets, namely, data on dentist visits and sales volume (candy and cereal).
2. Merge the two datasets using the "merge" function.
3. Eliminate unused data columns and summarize the data. Then, visualize using a scatterplot, to find out the pattern of the relationship between the number of doctor visits and the level of candy and cereal sales.
> On the plot, it is known that there is no linear relationship between the two data sets when they are in the same time period. In reality, there is a waiting period after consuming candy or cereal until finally visiting the doctor.
> So based on these facts, it provides information that after consuming candy or cereal within 4 months, there is an increase in the number of visits to the dentist (there is a linear relationship between the sales period and doctor visits).
4. When carrying out a regression analysis, there are assumptions that must be met, namely that the predictor and response variables must have a linear relationship. So in this analysis, the predictor variable used was the number of candy and cereal sales in the 4-month waiting period, while the response variable was the number of doctor visits.
  ---------------------------------------

**The conclusions resulting from this analysis are:**
  
a. Sales of candy and cereals had a positive relationship with the number of pediatric patient visits to the dentist during the waiting period of 4 months after sales.

b. Every time there is an increase in candy sales of 10,000, it will increase the number of doctor visits by 15 people in the next 4 months.

c. whereas if there is an increase in cereal sales of 10,000, it will increase the number of doctor visits by 81 people in the next 4 months.
