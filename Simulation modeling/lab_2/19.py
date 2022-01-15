import matplotlib.pyplot as plt
A = 0.00000014
M = 16807
X = [3,6,9,13,19,27,31]
P = [0.04, 0.12,0.22,0.28,0.2,0.1,0.04]
P1 =[]
Kilkist_num = []
Interval =[]
Random_num = []
a = []
a.append(A)
i = 1
while i < 100:
   temp = a[i-1] * M
   a.append(temp-int(temp))
   #print(a[i])
   i = i+1
i = 0
t = 0
print("Випадкові числа:",a)
print("Інтервали:")
Interval.append(0)
while i < len(P):
   t= t + P[i]
   Interval.append(round(t,2))
   print(Interval[i],"-",Interval[i+1])
   i = i + 1
i = 0
j = -1
while j < len(Interval)-1:
   j = j + 1
   i = 0
   while i < len(a):
      if Interval[j] < a[i] < Interval[j + 1]:
         Random_num.append(X[j])
      i = i + 1
print("Змодельована послідовність",Random_num)
i = 0
j = 0
t = 0
while j < len(X):
   while i < len(Random_num):
      if Random_num[i]==X[j]:
         t=t+1
      i = i + 1
   P1.append(t/len(Random_num))
   Kilkist_num.append(t)
   t=0
   j=j+1
   i=0
r = []
for i in range(7):
    r.append(i+1);
print("Відносна чаастота(Pi):",P1)
print("Кількість кожного елементу:",Kilkist_num)
mat_spod =0
mat_spod2 =0
i=0
while i<len(X):
   mat_spod+=X[i]*P1[i]
   mat_spod2 +=P1[i]*X[i]**2
   i=i+1
despersia=mat_spod2-mat_spod**2
print("Математичне сподівання:",mat_spod)
print("Дисперсія:",despersia)
i=0
print("|Інтервал|Частота попадання|Відносна частота|")
while i <len(r):
   print("|" , r[i] , " |       " , Kilkist_num[i], "       |      " , P1[i] , "     |")
   i=i+1
plt.plot(r, P1, 'r-')
plt.xlabel('Інтервал')
plt.ylabel('Відносна частота потраплянь')
plt.title('Графік частот')
plt.show()
