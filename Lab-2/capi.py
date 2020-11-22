import pymongo

word = "aabbaa"
client = pymongo.MongoClient("localhost")
db = client["phones"]
col = db["phones"]

def capicua(): 
	# Get all phones from db {},{"display": 1, "_id": 0}
	phones = col.find({},{"display": 1, "_id": 0})
	result = []
	for p in phones:
		num = p["display"].split("-")[1]
		leng = len(num)-1
		count = 0
		flag = True
		while (leng > count):
			if (num[count] != num[leng]):
				flag = False
			count+=1
			leng-=1

		if (flag):
			result.append(p["display"])

	return result

print(capicua())