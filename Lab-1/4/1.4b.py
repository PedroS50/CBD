import redis
import csv

rd = redis.Redis()

inputFile = "nomes-registados-2020.csv"
rdNamesByPop = "namesByPop"
rdNames = "names"

rd.delete(rdNamesByPop)
rd.delete(rdNames)

def main():
	while True:
		word = input("Search for (insert 'Quit' to exit):")
		if word=="Quit":
			break

		results = rd.zrangebylex(rdNames, "["+word, "["+word+"\xff")
		if not results:
			print()
		else:
			orderedResults = [(key.decode('utf-8'), value) for key, value in rd.zrevrangebyscore(rdNamesByPop, "+inf", "-inf", withscores=True) if key in results]
			for name, value in orderedResults:
				print(name)
	return 0

if __name__ == "__main__":
	# Load names into redis DB
	with open(inputFile, 'r') as fileR:
		csvFileR = csv.reader(fileR, delimiter=';')
		for line in csvFileR:
			rd.zadd(rdNames, {line[0]: 0})
			rd.zadd(rdNamesByPop, {line[0]: line[2]})

	main()