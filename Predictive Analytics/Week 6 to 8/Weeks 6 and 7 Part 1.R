# Weeks 6 and 8: Time Series Analysis - part 1

# Examples of different times processes

# First fix the plot default in R



# Strictly stationary processes: an iid and a white noise

# Generate an IID process
set.seed(2023)
iid <- rnorm(100)
plot(iid, main = "IID Process")

# Generate a white noise process
set.seed(2023)
white_noise <- rnorm(100, mean = 0, sd = 4)  # the mean must always be zero, but the variance can take different values
plot(white_noise, main = "White Noise Process")

# Generate a covariance stationary AR(1) process
set.seed(2023)
ar1 <- arima.sim(model = list(order = c(1,0,0), ar = 0.9999), n = 100)
plot(ar1, main = "Stationary AR(1) Process")
acff <- acf(ar1)
pacff <- pacf(ar1)


# Generate a trend stationary process
set.seed(2023)
trend <- arima.sim(model = list(order = c(1,0,0), ar = 0.9999), n = 100, innov = rnorm(100, mean = 0, sd = 1)) + 1:100
plot(trend, main = "Trend Stationary Process")



# Generate a process with stochastic trend
set.seed(2023)
stochastic_trend <- arima.sim(model = list(order = c(1,1,1), ar = 0.7, ma = -0.4), n = 100) 
plot(stochastic_trend, main = "Stochastic Trend Process")


# Generate a random walk process
set.seed(2023)
random_walk <- cumsum(rnorm(300))
plot(random_walk, type="l", main = "Random Walk Process")
acf(random_walk)


# Plot each process separately
par(mfrow = c(2,3))
plot(iid, main = "IID Process")
plot(white_noise, main = "White Noise Process")
plot(ar1, main = "AR(1) Process")
plot(random_walk, main = "Random Walk Process")
plot(trend, main = "Trend Stationary Process")
plot(stochastic_trend, main = "Process with Stochastic Trend")

