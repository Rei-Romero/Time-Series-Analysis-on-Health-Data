# Source: https://cran.r-project.org/web/packages/tsfknn/vignettes/tsfknn.html

library(tsfknn)
library(readxl)

df <- read_xlsx("Health_Dataset.xlsx", sheet = 2)

pred <- knn_forecasting(ts(df$`Meningoccocal Disease`, frequency = 52), 
                        h = 1, lags = 1:2, k = 2, transform = "none")

ro <- rolling_origin(pred, h = 1, rolling = FALSE)

print(ro$test_sets)
print(ro$predictions)
print(ro$errors)

ro$global_accu

plot(ro)

   