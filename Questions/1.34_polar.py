import numpy as np
import matplotlib.pyplot as plt

def r(lamb):
	theta = np.linspace(-np.pi*.5, 0, 1000)
	thetb = np.linspace(0, np.arccos(1./lamb), 1000)
	plt.axes(polar = True)
	plt.plot(theta, np.cos(theta)/lamb, c='k')
	plt.plot(thetb, 1./(lamb*np.cos(thetb)), c='k')
	plt.show()
r(4.5)
