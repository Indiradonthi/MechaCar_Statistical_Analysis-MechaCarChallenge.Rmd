

# Load Libraries

library(readr)
library(dplyr)
library(ggplot2)


# Load Data

MechaCar_Df <- read_csv("https://2u-data-curriculum-team.s3.amazonaws.com/dataviz-online/module_15/MechaCar_mpg.csv")
View(MechaCar_Df)

# Plots

ggplot(MechaCar_Df, aes(vehicle_length, mpg)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


ggplot(MechaCar_Df, aes(vehicle_weight, mpg)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


ggplot(MechaCar_Df, aes(spoiler_angle, mpg)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


ggplot(MechaCar_Df, aes(ground_clearance, mpg)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


ggplot(MechaCar_Df, aes(AWD, mpg)) + 
  geom_col()



# Deliverable 1: Linear Regression to Predict MPG

# First I am going to see what variables I have in the dataset to begin with
names(MechaCar_Df)
# "vehicle_length"   "vehicle_weight"   "spoiler_angle"   
# "ground_clearance" "AWD"              "mpg"

lm1 <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle +
                 ground_clearance + AWD, data= MechaCar_Df)

summary(lm1)
# 
# Call:
#   lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
#        ground_clearance + AWD, data = MechaCar_Df)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -19.4701  -4.4994  -0.0692   5.4433  18.5849 
# 
# Coefficients:
#                     Estimate Std. Error t value  Pr(>|t|)    
# (Intercept)        -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
#   vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
#   vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
#   spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
#   ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
#   AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 8.774 on 44 degrees of freedom
# Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
# F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11



# Deliverable 2: Summary Statistics on Suspension Coils

Suspension_Df <- read_csv("https://2u-data-curriculum-team.s3.amazonaws.com/dataviz-online/module_15/Suspension_Coil.csv")
View(Suspension_Df)

# First I am going to see what variables I have in the dataset to begin with
names(Suspension_Df)
#  "VehicleID"         "Manufacturing_Lot" "PSI"

# Total Summary
Suspension_Df %>%
  summarize(PSI_mean = mean(PSI), 
            PSI_median = median(PSI), 
            PSI_variance = var(PSI),
            PSI_sd = sd(PSI))

# PSI_mean PSI_median PSI_variance PSI_sd
#  1499.       1500         62.3   7.89

# For each manufacturing Lot

Suspension_Df %>%
  group_by(Manufacturing_Lot) %>%
  summarize(PSI_mean = mean(PSI), 
            PSI_median = median(PSI), 
            PSI_variance = var(PSI),
            PSI_sd = sd(PSI))

#Manufacturing_Lot PSI_mean PSI_median PSI_variance PSI_sd
# Lot1                 1500       1500         0.980  0.990
# Lot2                 1500.      1500         7.47   2.73 
# Lot3                 1496.      1498.      170.    13.0 

# Perform a Sample T-Test

Lot1_df <- subset(Suspension_Df, Manufacturing_Lot == "Lot1")
Lot2_df <- subset(Suspension_Df, Manufacturing_Lot == "Lot2")
Lot3_df <- subset(Suspension_Df, Manufacturing_Lot == "Lot3")

# 1vs2
t.test(Lot1_df$PSI, Lot2_df$PSI)

# Welch Two Sample t-test
# 
# data:  Lot1_df$PSI and Lot2_df$PSI
# t = -0.49, df = 62, p-value = 0.6
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -1.0218  0.6218
# sample estimates:
#   mean of x mean of y 
# 1500      1500 


# 1vs3
t.test(Lot1_df$PSI, Lot3_df$PSI)

# Welch Two Sample t-test
# 
# data:  Lot1_df$PSI and Lot3_df$PSI
# t = 2.1, df = 50, p-value = 0.04
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   0.1418 7.5782
# sample estimates:
#   mean of x mean of y 
# 1500      1496 

# 2vs3
t.test(Lot2_df$PSI, Lot3_df$PSI)

# 
# Welch Two Sample t-test
# 
# data:  Lot2_df$PSI and Lot3_df$PSI
# t = 2.2, df = 53, p-value = 0.04
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   0.2786 7.8414
# sample estimates:
#   mean of x mean of y 
# 1500      1496 


# Lot1 vs Popultion 1500
t.test(Lot1_df$PSI, mu=1500)

# One Sample t-test
# 
# data:  Lot1_df$PSI
# t = 0, df = 49, p-value = 1
# alternative hypothesis: true mean is not equal to 1500
# 95 percent confidence interval:
#   1500 1500
# sample estimates:
#   mean of x 
# 1500 

# Lot2 vs Popultion 1500
t.test(Lot2_df$PSI, mu=1500)

# One Sample t-test
# 
# data:  Lot2_df$PSI
# t = 0.52, df = 49, p-value = 0.6
# alternative hypothesis: true mean is not equal to 1500
# 95 percent confidence interval:
#   1499 1501
# sample estimates:
#   mean of x 
# 1500 


# Lot3 vs Popultion 1500
t.test(Lot3_df$PSI, mu=1500)
# 
# One Sample t-test
# 
# data:  Lot3_df$PSI
# t = -2.1, df = 49, p-value = 0.04
# alternative hypothesis: true mean is not equal to 1500
# 95 percent confidence interval:
#   1492 1500
# sample estimates:
#   mean of x 
# 1496 
