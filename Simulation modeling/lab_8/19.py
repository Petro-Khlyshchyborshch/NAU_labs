import random
T=10
progres = []
t=random.random() # отримуємо крок дискритизації
time=[]
i=0
while i<T:# виконувати поки час не перевищить вказаний
    x=0.2*i+250 #розрахунок за вказаним законом
    progres.append(x)
    time.append(i)
    i+=t# збільшенння часу з отриманим кроком

print("{:<20} {:<20}".format("Час","Процес"))
for i in range(0,len(time)):
    print("{:<20} {:<20}".format(time[i], progres[i]))


from matplotlib import pyplot
pyplot.plot(time,progres)
pyplot.show()
