f = input()
f = f[::-1]
print(f)

f = input()
split = f.split()
out = ''
for i in range(len(split)):
	out+=split[i][::-1]+' '
print(out)