import matplotlib.pyplot as plt
A = 0.00000014
M = 16807
Random_numb = []
Random_numb_1 = []
Random_numb_2 = []
Random_numb_3 = []
Interval = []
spusok =[0]
Random_numb.append(A)
i=0
while i<=6.1:
   Interval.append(round(i,1))
   i+=0.2
i = 1

while i < 5000000:
   temp = Random_numb[i-1] * M
   Random_numb.append(temp-int(temp))
   #print(Random_numb[i])
   i = i+1

#------------------1 функція
i=0
while i < len(Random_numb)*0.5:
   X= Random_numb[i]*2
   N=Random_numb[i+1]*0.5
   X1=0.25*X
   if X1>N:
      Random_numb_1.append(X)
   i = i+2

i=0
j=0
t=0
while j < 10:
   while i < len(Random_numb_1):
      if Interval[j] < Random_numb_1[i] < Interval[j + 1]:
         t=t+1
      i = i + 1
   j = j + 1
   i = 0
   spusok.append(t)
   t=0

#------------------2 функція
i=0
while i < len(Random_numb)*0.25:
   X= Random_numb[i]*2+2
   N=Random_numb[i+1]*0.25
   X1=0.125*(X-2)
   if X1>N:
      Random_numb_2.append(X)
   i = i+2

i=0
j=10
t=0

while j < 20:
   while i < len(Random_numb_2):
      if Interval[j] < Random_numb_2[i] < Interval[j + 1]:
         t=t+1
      i = i + 1
   j = j + 1
   i = 0
   spusok.append(t)
   t=0

#------------------3 функція
i=0
while i < len(Random_numb)*0.25:
   X= Random_numb[i]*2+4
   N=Random_numb[i+1]*0.25
   X1=(((X-4)*(-0.25))/2)+0.25
   if X1>N:
      Random_numb_3.append(X)
   i = i+2

i=0
j=20
t=0

while j < 30:
   while i < len(Random_numb_3):
      if Interval[j] < Random_numb_3[i] < Interval[j + 1]:
         t=t+1
      i = i + 1
   j = j + 1
   i = 0
   spusok.append(t)
   t=0

t=0
i=0
j=len(Random_numb_1)+len(Random_numb_2)+len(Random_numb_3)
tor=[]
while i<len(spusok):
   tor.append(spusok[i]/j)
   i+=1
full = Random_numb_1+Random_numb_2+Random_numb_3
killk=[]
i=0
j=0
t=0

while j <len(full):
   while i < len(full):
      if full[j]==full[i]:
         t+=1
         del full[i]
      i+=1
   j+=1
   i=j
   killk.append(t)
   t=0


mat_spod =0
mat_spod2 =0
i=0
while i<len(full):
   mat_spod+=full[i]*(killk[i]/len(full))
   mat_spod2 +=(killk[i]/len(full))*full[i]**2
   i=i+1
despersia=mat_spod2-mat_spod**2
print("Математичне сподівання:",mat_spod)
print("Дисперсія:",despersia)


i=0
print("|Інтервал|Частота попадання|Відносна частота|")
while i <30:
   print("|" , Interval[i] ,"-", Interval[i+1] ,"|  " , round(spusok[i],1), "    |      " , round(tor[i],5) , "     |")
   i=i+1

plt.plot(Interval,  tor, 'r-')
plt.xlabel('Інтервал')
plt.ylabel('Відносна частота потраплянь')
plt.title('Графік частот')
plt.show()
