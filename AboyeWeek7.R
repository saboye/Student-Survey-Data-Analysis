# Assignment: ASSIGNMENT 7
# Name: ABOYE, SAMUEL
# Date: 2024-02-03

# Load the required library for data visualization
library(ggplot2)

# Read the survey data from a CSV file.
survey_data<- read.csv("student-survey.csv")

# Ensure no missing values in the data which could affect the analysis
survey_data<- na.omit(survey_data)

# Data Visualization Section
# Plot to visualize the relationship between time spent reading and time spent watching TV.
ggplot(survey_data, aes(x = TimeReading, y = TimeTV)) +
  geom_point(color = "brown") +
  labs(title = "Time Reading vs. Time TV") +
  theme_minimal()  # Using a minimal theme for better aesthetics

# Plot to explore the association between time spent reading and happiness levels.
ggplot(survey_data, aes(x = TimeReading, y = Happiness)) +
  geom_point(color = "brown") +
  labs(title = "Time Reading vs. Happiness") +
  theme_minimal()

# Plot to investigate the relationship between time spent watching TV and happiness.
ggplot(survey_data, aes(x = TimeTV, y = Happiness)) +
  geom_point(color = "brown") +
  labs(title = "Time TV vs. Happiness") +
  theme_minimal()

# Statistical Analysis Section
# Compute the correlation matrix for TimeReading, TimeTV, and Happiness.
cor_matrix <- cor(survey_data[,c("TimeReading", "TimeTV", "Happiness")], use = "complete.obs")

# Use knitr::kable to display the correlation matrix as a formatted table.
knitr::kable(cor_matrix, caption = "Correlation Matrix for TimeReading, TimeTV, and Happiness")

# Perform a correlation test between TimeReading and TimeTV.
cor_test <- cor.test(survey_data$TimeReading, survey_data$TimeTV, method = "pearson")

# Display the correlation test results in a more readable format.
cat("Correlation coefficient (r):", cor_test$estimate, "\n")
cat("P-value:", format.pval(cor_test$p.value, scientific = TRUE), "\n")




