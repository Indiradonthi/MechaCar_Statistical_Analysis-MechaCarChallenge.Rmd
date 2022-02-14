# MechaCar_Statistical_Analysis-MechaCarChallenge.Rmd

## Overview

The MechaCar is suffering from production troubles that are blocking the manufacturing team’s progress. The upper management has called on the data analytics team to review the production data for insights that may help the manufacturing team.

## CHALLENGE

- Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes.
- Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots.
- Run t-tests to determine if the manufacturing lots are statistically different from the mean population.
- Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. For each statistical analysis, and write a summary interpretation of the findings.

## RESULTS

- **Linear Regression to Predict MPG**

### **Output from the linear regression**

![image](https://user-images.githubusercontent.com/90879122/152166720-d441ad7e-4c51-45bc-ae67-3e5c48a4f78d.png)

- Vehicle Length and ground clearance provided a non-random amount of variance to the mpg values in the dataset.

![image](https://user-images.githubusercontent.com/90879122/152166766-1bc8ab1c-78b0-4ee9-953c-ce57d6572946.png)

![image](https://user-images.githubusercontent.com/90879122/152166932-bfa66628-a275-4b83-8a9c-bc7882ea6981.png)


- The slope of the linear model can not be considered to be zero. Note the upward path of the line on the graph.

- This linear model prediction of mpg of MechaCar prototypes is effectively accurate at 71.5% per the R-squared value.

## Summary 

## total_summary

![image](https://user-images.githubusercontent.com/90879122/153811500-31fa6d23-1656-403b-bd6e-14458b389df2.png)

## lot_summary

![image](https://user-images.githubusercontent.com/90879122/153811526-bc275d51-fe9a-4796-888a-623ece930a50.png)

## T-Tests on Suspension Coils

t-test results per lot have no statistical difference between population means, and pvalues are not low enough to reject the null hypothesis

![image](https://user-images.githubusercontent.com/90879122/153812102-0837f125-28c9-4833-83eb-16d8ad0c60ce.png)

![image](https://user-images.githubusercontent.com/90879122/153812744-58d7eb8d-8e53-4bd5-80c7-a702bcdd92e3.png)

![image](https://user-images.githubusercontent.com/90879122/153812817-009285db-8e34-4ac9-952b-297daad62022.png)


