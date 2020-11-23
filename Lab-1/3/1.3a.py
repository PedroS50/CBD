import redis

r = redis.Redis()
data = r.info()
for key in data:
	print(key, ": ", data[key])
	