#install.packages("moderndive")
DM <- read.csv("C:/Users/rohan/Desktop/HOME/Personal/Purdue/Courses/Module_2/WebDataAnalytics/Assignments/Assignment_2/Assignment 2/panel_output.csv", sep=",", header=T); # data is loaded to a frame

#The attach() function in R can be used to make objects within dataframes accessible in R with fewer keystrokes
attach(DM) 

#Features
names(DM)

#Unique Value count of each variable
rapply(DM,function(x)length(unique(x)))

#The str function shows an outline of the structure of its argument
str(year)

###############################################################################
#Create summary
summary(DM)
########################################################################################################
############################################### T tests ################################################
########################################################################################################
summary(DM)
DM$Visitor_Average_Rating = ((DM$yelp_count*DM$yelp_average)-(DM$yelp_NYC_count*DM$yelp_NYC_average))/(DM$yelp_count - DM$yelp_NYC_count)
max(DM$Visitor_Average_Rating)
#Ratings Check

##Number of Ratings t test
t.test(DM$Visitor_Average_Rating, DM$yelp_NYC_average, alternative = 'two.sided')
print("Given that the p value is less than 0.05, we 95% confidence we can say that there is a difference between the reviews of New Yorker and visitors")
t.test(DM$Visitor_Average_Rating, DM$yelp_NYC_average, alternative = 'greater')
print('Through further testing, we can see that the average ratings of visitors to New york is greater.')

############################################################################################################
#########################
#########################
#  Linear Regression    #
#########################
#Creating regression using input_for _model.csv which is an output from python Das_Rohan_Assignment_2_Q1

DM_2 <- read.csv("C:/Users/rohan/Desktop/HOME/Personal/Purdue/Courses/Module_2/WebDataAnalytics/Assignments/Assignment_2/Assignment 2/input_for_model.csv", sep=",", header=T); # data is loaded to a frame
attach(DM) 
summary(DM_2)

DM_2$year = factor(DM_2$year)
DM_2$Rating = factor(DM_2$Rating)
DM_2$price_category = factor(DM_2$price_category)
DM_2$zipcode = factor(DM_2$zipcode)
DM_2$airbnb = factor(DM_2$airbnb)
DM_2$NYC_reviewer = factor(DM_2$NYC_reviewer)

summary(DM_2)

Linear_reg = lm(DM_2$yelp_average~ DM_2$year+ DM_2$zipcode+ DM_2$airbnb+ DM_2$Rating + DM_2$price_category+ 
                  DM_2$yelp_average*DM_2$yelp_count + DM_2$yelp_NYC_count*DM_2$yelp_NYC_average)

summary(Linear_reg)


library(moderndive)
res <- as.data.frame(get_regression_table(
  Linear_reg,
  conf.level = 0.95,
  digits = 3,
  print = FALSE,
  default_categorical_levels = FALSE
))
View(res)
write.csv(res,"C:/Users/rohan/Desktop/HOME/Personal/Purdue/Courses/Module_2/WebDataAnalytics/Assignments/Assignment_2/Assignment 2/LinearRegressionModel.csv")

###########################################
