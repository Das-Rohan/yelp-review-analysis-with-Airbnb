Das_Rohan_Assignment2_Q1_Q2_Q3_Q4.ipynb
	Python file: Q1 to Q4 code and report is present in this file. For Q3, some of the analysis is done using R.
	Q2 output: input_for_model.csv is used for linear regression in R and panel_output.csv is used for t testing in R.
	Inputs: panel.csv, yelp.csv, listings.csv
	Outputs: panel_output.csv, input_for_model.csv
	Q3: Q3 generates a set of files which are saved in a folder named "Key_Phrase_Files". This folder is provided as a subfolder as well
		as part of assignmet 2 submission.
		-NY_Data_# and Visitor_Data_# contain multiple reviews with a character limit of 5000 words to respect Azure's conditions.
		-NY_Log_# and Visitor_Log_# are log files pertaining to respective NY_Data_# and Visitor_Data_#. For Example, NY_Data_1 
			has log file NY_Log_1. The log files will be either blank or will contain the word "Done". If the Log file is blank,
			corresponding NY_Data_# or Visitor_Data_# is sent to Azure for text Analytics and fetching keywords. If it contains
			the word "Done", it means the corresponding NY_Data_# or Visitor_Data_# have their data processed for key word and
			that data is stored in a corresponding file named NY_azure_keyphrases_# or Visitor_azure_keyphrases_#. These files
			are read by the python file for word and phrase processing.
	Q4: The additional data for Q4 is obtained from listings.csv which is obtained from the link http://insideairbnb.com/get-the-data.html 
		for New York city.
Das_Rohan_Assignment2_Rfile.R
	R file: for solving Q2. 
	Inputs: panel_output.csv and input_for_model.csv
	Outputs: LinearRegressionModel.csv which contains the coefficient of Linear regression model along with p values.

Some things to keep in mind:
	Q4:
	sometimes, google provides wrong information for zipcode 10466 which pushes it's mean value very high. I have observed this a couple of times,
	however re running the corresponding piece of code again does provide the correct results. This is a problem purely from the google results. In
	case, during evaluation, the write up does not match the graphs provided after running(if the jupyter note book is not run, the original 
	correct graphs will be visible right after download of the file), just re run the code and the correct observations should get populated.
