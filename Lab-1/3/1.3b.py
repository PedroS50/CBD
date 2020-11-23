import redis

def LoadSet(name, list):
	for item in list:
		rd.sadd(name, item)
	return 0

def LoadList(name, list):
	for item in list:
		rd.rpush(name, item)
	return 0

def LoadHM(name, list1, list2):
	if (len(list1) != len(list2)):
		return False
	for n in range(0, len(list1)):
		rd.hset(name, list1[n], list2[n])
	return True


rd = redis.Redis()

# Values that will be loaded into the DB
users = ["Ana", "Pedro", "Maria", "Luis"]
lectures = ["SIO", "IES", "CBD", "IA", "CSLP"]
grades = [16, 10, 13, 19]

# Load values into set
LoadSet("users", users)

# Load values into list
LoadList("lectures", lectures)

# Load values into hashmap
if LoadHM("results", users, grades)==False:
	print("Lists loaded into hashmap must be the same size!")

# Print results
print("Set values:")
print(rd.smembers("users"))
print("List values:")
print(rd.lrange("lectures", 0, -1))
rd.ltrim("lectures", -1, 0)
print("Hashmap values:")
print(rd.hgetall("results"))