# Predictive Analysis for Decision Making
# Semester 2
# Week 2: Introduction to R and Linear Regression
# 

# Part 1: loading

library(readxl)  ## library
"This calls the data under the name nls80"
nls80 <- read_excel("nls80.xlsx")
View(nls80)

"this returns the number of rows and columns"
"Note: number of rows refers to the sample size"
"number of columns refers to the number of variables"

dim(nls80)

n<-nrow(nls80)
print(n)


summary(nls80)

cor(nls80)


numericvars<-sapply(nls80, is.numeric)
numericvars


nls80$meduc <- as.numeric(as.character(nls80$meduc))

# Generating correlation matrix for wage, education, hours and exper

cor(cbind(nls80$lwage, nls80$educ, nls80$hours, nls80$exper))




"The natural logarithm of wage is lnwage"
lnwage <- log(nls80$wage)


hist(nls80$wage)
hist(nls80$lwage)

install.packages("lmtest")
install.packages("tsDyn")


model1 <- lm(lwage ~educ + hours + exper, data=nls80)
summary(model1)

library(lmtest)

bptest(model1)
dwtest(model1)


robust <- coeftest(model1, vcov=vcovHC(model1, type="HC1"))
robust