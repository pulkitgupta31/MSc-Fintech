# Question 2, Applied Problems

dmat <- read_excel("sims.xlsx")

# generating log form

summary(dmat)

lmt <- log(dmat$mt)

lpt <- log(dmat$pt)

lot <- log(dmat$ot)

plot(dmat$rt, type = "l", main = "My Data Plot", xlab = "Observation", ylab = "Value")


plot(lmt, type = "l", main = "My Data Plot", xlab = "Observation", ylab = "Value")


plot(lpt, type = "l", main = "My Data Plot", xlab = "Observation", ylab = "Value")


plot(lot, type = "l", main = "My Data Plot", xlab = "Observation", ylab = "Value")


# Applying ARIMA models 
#library(astsa)
#library(tseries)

# Identification
#part 1
acf1 <- acf(dmat$rt)
pacf1 <- pacf(dmat$rt)

# part 2
drt <- diff(dmat$rt)
plot(drt, type = "l", main = "My Data Plot", xlab = "Observation", ylab = "Value")

acf1 <- acf(drt)
pacf1 <- pacf(drt)

model1 <- arima(drt, order=c(1,0,0))  # AR(1)
summary(model1)

model2 <- arima(drt, order=c(0,0,1))  # MA(1)
summary(model2)

model3 <- arima(drt, order=c(1,0,1))  # ARMA(1,1)
summary(model3)

# Choose the model with lwest information criterion 

library(forecast)
bjmodel <- auto.arima(dmat$rt)
summary(bjmodel)

# Forecasting The data

# Split the data into training and test sets

install.packages("lubridate")
library(lubridate)
dmat$date <- mdy(dmat$date) 

tain <- subset(dmat, date >= mdy("Jan59") & date <= mdy("Dec94"))


dmat$date <- as.Date(dmat$date, format="%b%y")

train <- subset(dmat, date >= as.Date("Jan59", format="%b%y") & date <= as.Date("Dec94", format="%b%y"))

test <- subset(dmat, date >= as.Date("Jan95", format="%b%y"))
train


# Fit an ARIMA model to the training data using auto.arima()
fit <- auto.arima(train)

# Use the forecast() function to make predictions for the test data
forecast <- forecast(fit, h = length(test))

