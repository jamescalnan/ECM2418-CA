# for i in range(1,3):
# 	for j in range(1,3):
# 		for k in range(1,3):
# 			print(i, j, k)



def loopDown(x, y, z):
	if x > 9 or y > 9 or z > 9:
		print("finished")
		return

	print(f'{x}, {y}, {z}')
	loopDown(x, y, z)
	loopDown(x, y + 1, z)
	loopDown(x, y, z + 1)


loopDown(1, 1, 1)
