# Weeks 6 and 7: Question 1, applied questions

# Generate the main variables
set.seed(2023)

y <- rnorm(200)
u <- rnorm(200, mean=0, sd=1)
t <- seq(1, 200, by = 1)

#plot(y)
#plot(u)
#plot(t)

# generating a AR(1) process

# Stationary process 

phi0 <- 2
phi11 <- 0.5
phi12 <- 0.7
phi13 <- 0.9
phi14 <- 1.0

y1 <- phi0 + phi11 * lag(y,1) + u
y2 <- phi0 + phi12 * lag(y,1) + u
y3 <- phi0 + phi13 * lag(y,1) + u
y4 <- phi0 + phi14 * lag(y,1) + u

plot(y)
plot(y1)
plot(y2)
plot(y3)
plot(y4)

