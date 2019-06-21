#!/usr/bin/env python
from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from scipy.io import loadmat


anaData = loadmat('./enthB_analy_result.mat')
anaZ = anaData['enthB_analy_z']
anaE = anaData['enthB_analy_E']
anaT = anaData['enthB_analy_T']
anaW = anaData['enthB_analy_omega']

cp_ice = 2009.0
rho_ice = 910.0

data = Dataset('./output.nc','r')

T = data.variables['temperature'][-1,:,:]
horiMeanT = np.mean(T, axis=0)
Ts = data.variables['surfaceTemperature'][-1,:]
meanTs = np.mean(Ts)
Tall = np.append(meanTs,horiMeanT)

E = data.variables['enthalpy'][-1,:,:]
horiMeanE = np.mean(E, axis=0)

W = data.variables['waterfrac'][-1,:,:]
horiMeanW = np.mean(W, axis=0)

z = 1-(np.arange(50)+1)/50.0

plt.figure (1)
plt.subplot(1,3,1)
plt.plot((horiMeanE/910.0+cp_ice*50)/1.0e3,z)
plt.plot(anaE/1000, anaZ)
plt.xlabel('$E$ (10$^3$ J kg$^{-1}$)', fontsize=36)
plt.ylabel('$z/H$', fontsize=36)
plt.xticks(np.arange(92,109,step=4), fontsize=28)
plt.yticks(fontsize=28)
plt.text(93,0.05,'a', fontsize=40)
plt.grid(True)

plt.subplot(1,3,2)
plt.plot(Tall-273.15,np.append(1,z))
plt.plot(anaT-273.15, anaZ)
plt.xlabel('$T$ ($^\circ$C)', fontsize=36)
#plt.ylabel('$\zeta$', fontsize=20)
plt.xticks(np.arange(-3.5,0.51,step=1), fontsize=28)
plt.yticks(fontsize=28)
plt.text(-3.2,0.05,'b', fontsize=40)
plt.grid(True)
#plt.gca().invert_yaxis()


plt.subplot(1,3,3)
plt.plot(horiMeanW*100,z)
plt.plot(anaW*100, anaZ)
plt.xlabel('$\omega$ (%)', fontsize=36)
#plt.ylabel('$\zeta$',fontsize=20)
#plt.xlim(-0.5,3)
plt.xticks(np.arange(-0.5, 2.51, step=1), fontsize=28)
plt.yticks(fontsize=28)
plt.text(-0.3,0.05,'c', fontsize=40)
plt.grid(True)

plt.show()

