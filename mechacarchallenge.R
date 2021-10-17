# Deliverable One
# Loading dplyr package
install.packages("dplyr")
library(dplyr)

# Reading the file in as a dataframe 
mpg <- read.csv('MechaCar_mpg.csv',stringsAsFactors = F) 

# Performing linear regression using the lm() function.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mpg)

# Using the summary() function to determine the p-value and the r-squared value
# for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mpg))

# Deliverable Two
# Reading the file as a table
suspension_coil <- read.csv('Suspension_Coil.csv', stringsAsFactors = F)

# Creating total_summary using summarize() to get the mean, median, variance, and standard deviation from the PSI column
total_summary <- suspension_coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# Creating lot_summary using group_by() and summarize() to group each manufacturing lot 
# by the mean, median, variance, and standard deviation from the suspension coil’s PSI column
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# Deliverable Three
# Using t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population 
# mean of 1,500 pounds per square inch
t.test(suspension_coil$PSI, mu = 1500) 

# t-test for Lot 1
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot1"), mu=mean(suspension_coil$PSI))

# t-test for Lot 2
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot2"), mu=mean(suspension_coil$PSI))

# t-test for Lot 3
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot3"), mu=mean(suspension_coil$PSI))
