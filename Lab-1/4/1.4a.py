import redis

rd = redis.Redis()

inputFile = "female-names.txt"
redisList = "names"

rd.delete(redisList)

def main():
	while True:
		word = input("Search for (insert 'Quit' to exit):")
		if word=="Quit":
			break

		for name in rd.zrangebylex(redisList, "["+word, "["+word+"\xff"):
			print(name.decode('utf-8'))

if __name__ == "__main__":
	# Load names into redis DB
	with open(inputFile, 'r') as fileR:
		line = fileR.readline()
		while line:
			rd.zadd(redisList, {line: 0})
			line = fileR.readline()

	main()	