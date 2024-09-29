# Weeks 6 and 7: Question 1, applied questions

# Initial parameters

n <- 100 # sample size - not given but assumed. You can use more.

# Case 1: parts (a) and (b)
phi0 <- 2
phi1 <- 0.7
phi2 <- 0.25


# Case 2: part (c)

phi3 <- 1

# Generate the data
set.seed(2023) 

u <- rnorm(n, mean=0, sd=1) # the error term
td <- seq(1, n, by = 1)

# Equation (1)

y <- arima.sim(model = list(ar = phi1), n = n,mean=phi0, innov = u) + phi2*td
plot(y, type = "l", xlab = "Time", ylab = "y")
acfy1 <- acf(y)

# Equation (2)

y <- arima.sim(model = list(ar = phi1), n = n,mean=phi0, innov = u) 
plot(y, type = "l", xlab = "Time", ylab = "y")
acfy1 <- acf(y)

# Equation (3)

y <- arima.sim(model = list(ar = phi1), n = n, innov = u) 
plot(y, type = "l", xlab = "Time", ylab = "y")
acfy3 <- acf(y)

# Consider the case of a pure trend stationary process - an alternative way

for (t in 2:n) {
  y[t] <- phi0 + phi2 * td[t] + u[t]
} 

plot(y, type = "l", xlab = "Time", ylab = "y")
acfy4 <- acf(y)


# The case of phi3 = 0.999

# Equation (1)

for (t in 2:n) {
  y[t] <- phi0 + phi3 * y[t-1] + phi2 * td[t] + u[t]
} 

plot(y, type = "l", xlab = "Time", ylab = "y")
acfy5 <- acf(y)

# Equation (2) 

for (t in 2:n) {
  y[t] <- phi0 + phi3 * y[t-1]  + u[t]
} 

plot(y, type = "l", xlab = "Time", ylab = "y")
acfy6 <- acf(y)

# Equation (3)

for (t in 2:n) {
  y[t] <-  phi3 * y[t-1]  + u[t]
} 

plot(y, type = "l", xlab = "Time", ylab = "y")
acfy7 <- acf(y)



