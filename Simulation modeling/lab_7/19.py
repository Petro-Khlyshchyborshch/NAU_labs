import math
def factor(num):
    factorial=1
    if num < 0:
        return 1
    elif num == 0:
        return 1
    else:
        for i in range(1, num + 1):
            factorial = factorial * i
        return factorial
P=[]
F=[]
X_f=[0]
suma =0
k=0
n=10
p=0.4
a=n*p
temp=2.71**(-a)
P.append(temp)
F.append(temp)
suma = temp
while suma<=1:
    temp=(math.e**(-a))*((a**k)/factor(k))
    P.append(temp)
    suma += P[k]
    F.append(suma)
    X_f.append(k + 1)
    k+=1
P_1=[]
for i in range(len(P)):
    P_1.append(round(P[i],2))


print("Ряд розподілу:")
print("X:",X_f)
print("P:",P_1)

from matplotlib import pyplot
pyplot.plot(X_f, P)
pyplot.show()

ax = pyplot.gca()
ax.bar(X_f, F)
pyplot.show()
