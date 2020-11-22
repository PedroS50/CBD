# NMEC: 93221
# Pedro Santos
##############

import pymongo
import time
from pymongo import TEXT
from datetime import datetime
from pprint import pprint

client = pymongo.MongoClient("localhost")
db = client["cbd"]
col = db["rest"]

''' Insert, Update, Delete and search Functions '''

def insertDoc(document):
	try:
		return col.insert_one(document).inserted_id
	except Exception as e:
		print("Error inserting document, ", e)

def updateDoc(query, values):
	try:
		count = col.update_many(query, values).modified_count
		return count
	except Exception as e:
		print("Error updating document...")
		print(e)

def deleteDoc(query):
	return col.delete_many(query).deleted_count

def searchDoc(query):
	try:
		return col.find(query)
	except Exception as e:
		print("Error retrieving document...")
		print(e)

''' ----------------------------------- '''

''' Additional Methods '''

def countLocalidades():
	return len(list( col.aggregate( [{ "$group": {"_id": "$localidade"} }] ) ))

def countRestByLocalidade():
	return col.aggregate([ { "$group": {"_id": "$localidade", "count": {"$sum": 1} } } ])

def countRestByLocalidadeByGastronomia():
	return col.aggregate([ {"$group": {"_id": {"localidade": "$localidade","gastronomia": "$gastronomia"}, "count": {"$sum": 1}}} ])

def getRestWithNameCloserTo(name):
	return col.aggregate([ {"$match": {"nome": {"$regex": name}}} ])

''' ------------------ '''

def main():
	''' Test Insert, Update and Delete functions '''

	docId = insertDoc({"address": {"building": "Building", "coord":[6, 9], "rua":"streetname", "zipcode":"3830-748"},
		"localidade":"Ilhavo", "gastronomia":"Mediterranea", "grades":[{"date":datetime(2000, 9, 5,12), "grade":"S", "score":10}],
		"nome":"GoodFood", "restaurante_id":"1234567"})
	print("Added document ", docId, ".")
	doc = searchDoc({"nome": "GoodFood"})
	for d in doc:
		pprint(d)
	print()

	count = updateDoc({"address.building": "Building"}, {"$set": {"nome": "NotSoGoodFood"}})
	print("Modified ", count, " documents.")
	doc = searchDoc({"nome": "NotSoGoodFood"})
	for d in doc:
		pprint(d)
	print()

	count = deleteDoc({"address.zipcode": "3830-748"})
	print("Deleted ", count, " documents.")
	doc = searchDoc({"nome": "NotSoGoodFood"})
	for d in doc:
		pprint(d)
	print()

	''' ---------------------------------------- '''
	''' Test Indexes '''

	print("Before indexing...")
	start_time = time.time()
	searchDoc({"localidade": "Brooklyn"})
	print("Procura por localidade: ", time.time() - start_time, "s")

	start_time = time.time()
	searchDoc({"gastronomia": "Italian"})
	print("Procura por gastronomia: ", time.time() - start_time, "s")
	
	start_time = time.time()
	col.aggregate([{ "$match": {"nome": {"$regex": "Man"}} }])
	print("Procura por nome: ", time.time() - start_time, "s")

	col.create_index("localidade", name="local_ind")
	col.create_index("gastronomia", name="gastr_ind")
	col.create_index([("nome", TEXT)], name="nome_ind")

	print("After indexing...")
	start_time = time.time()
	searchDoc({"localidade": "Brooklyn"})
	print("Procura por localidade: ", time.time() - start_time, "s")

	start_time = time.time()
	searchDoc({"gastronomia": "Italian"})
	print("Procura por gastronomia: ", time.time() - start_time, "s")
	
	start_time = time.time()
	col.aggregate([{ "$match": {"nome": {"$regex": "Man"}} }])
	print("Procura por nome: ", time.time() - start_time, "s\n")

	col.drop_index("local_ind")
	col.drop_index("gastr_ind")
	col.drop_index("nome_ind")
	
	''' ------------ '''
	''' Test Methods '''
	
	print("\n** Número de localidades distintas: ", countLocalidades())

	print("\n** Número de restaurantes por localidade:")
	for item in countRestByLocalidade():
		print(item["_id"], " -> ", item["count"])
		#print(res[key], " -> ", value)

	print("\n** Número de restaurantes por localidade, por gastronomia:")
	for item in countRestByLocalidadeByGastronomia():
		print(item["_id"]["localidade"], " | ", item["_id"]["gastronomia"], " -> ", item["count"])

	print("\n** Nome de restaurantes contendo 'Park' no nome:")
	for item in getRestWithNameCloserTo("Park"):
		print(item["nome"])

	''' ------------ '''

if __name__ == "__main__":
	main()
