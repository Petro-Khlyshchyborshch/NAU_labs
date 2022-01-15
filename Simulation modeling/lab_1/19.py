import matplotlib.pyplot as plt
A = 0.00000014
M = 16807
a = []
b = []
a.append(A)
i = 1
while i < 1000:
   temp = a[i-1] * M
   a.append(temp-int(temp))
   #print(a[i])
   i = i+1
i = 0
j = 0
s = 0
t = 0
while i <len(a):
   while j<len(a):
      if a[i]==a[j] and i!=j:
         t=t+1
         del a[i]
      j=j+1
   b.append(t+1/len(a))
   t=0
   i=i+1
   s=s+1
   j=s

print("Випадкові числа:"+str(a))
#print(b)
mat=0.0
m2x=0.0
i=0
sum=0.0
while i<len(a):
   mat = mat+(a[i]*b[i])
   m2x = m2x + ((a[i] ** 2) * b[i])
   sum = sum+a[i]
   i=i+1
dispersia=m2x - mat**2
i=0
sum=sum/len(a)
vibor_disper=0.0
while i<len(a):
   vibor_disper=vibor_disper+(a[i]-sum)**2
   i=i+1
vibor_disper=vibor_disper/(len(a)-1)
print("Матиматичне сподівання:"+str(mat))
print("Вибіркова середня:"+str(sum))
print("Дисперсія:"+str(dispersia))
print("Вибіркова дисперсія:"+str(vibor_disper))

s=[]
i=0
j=0
up=0.1
down=0.0
print("|Інтервал|Частота попадання|Відносна частота|")
while j<10:
   t = 0
   i=0
   while i<len(a):
      if a[i] > down and a[i] <= up:
         t=t+1
      i=i+1
   print("|"+str(round(down,2))+"-"+str(round(up,2))+" |       "+str(t)+"       |      "+str(t/len(a))+"     |")
   up = up+0.1
   down = down+0.1
   s.append(t)
   j=j+1

x = range(len(s))
ax = plt.gca()
ax.bar(x, s, align='edge')
ax.set_xticks(x)
ax.set_xticklabels(('0.0-0.1', '0.1-0.2', '0.2-0.3', '0.3-0.4', '0.4-0.5', '0.5-0.6', '0.6-0.7', '0.7-0.8', '0.8-0.9', '0.9-1'))
plt.show()
