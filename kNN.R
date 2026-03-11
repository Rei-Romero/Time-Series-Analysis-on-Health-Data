# Source: https://cran.r-project.org/web/packages/tsfknn/vignettes/tsfknn.html

library(tsfknn)
library(readxl)

df <- read_xlsx("Health_Dataset.xlsx", sheet = 2)

pred <- knn_forecasting(ts(df$`Meningoccocal Disease`, frequency = 52), 
                        h = 3, lags = 1:6, k = 3, transform = "none")

ro <- rolling_origin(pred, h = 3, rolling = FALSE)

plot(ro)


   
