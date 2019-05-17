num = input()
total=0
for i in range(int(num)):
	if(i%3!=0):
		if(i%5!=0):
			total+=1
	if(i%3==0 and i%5==0):
		total+=1
print(total)