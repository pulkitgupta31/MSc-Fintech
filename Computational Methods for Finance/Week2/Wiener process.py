# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import numpy.random as npr
import numpy as np
import math
import matplotlib.pyplot as plt

#Generalised Wiener process
def wiener1(dt,X0,a,b,Nt):
    """ Input variables:
    dt    time step
    X0    intial value, X(t=0) = X0
    Nt    number of time steps 
    """
    # create result array
    res = np.zeros(Nt)
    # initialize start value
    res[0] = X0
    # calculate and store time series
    for i in range(1,Nt):
        #         X(t+dt)=X(t)+sqrt(dt)*npr.randn(Nt)
        res[i] = res[i-1] + a*dt+b* math.sqrt(dt)*npr.randn(1)

    # return time series
    return res

Time=range(100000)
X1=wiener1(0.001,0,1,2,len(Time)) #Generalised Wiener process
X2=wiener1(0.001,0,0,1,len(Time)) #Wiener process
X3=wiener1(0.001,0,1,0,len(Time)) # a dt (only drift)
plt.plot(Time, X1, label = "Generalised Wiener Process")
plt.plot(Time, X2, label = "Wiener Process")
plt.plot(Time, X3, label = "Only drift")
plt.legend()
plt.show()
