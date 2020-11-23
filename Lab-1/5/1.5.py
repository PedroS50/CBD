import redis
import json
from time import gmtime, strftime

rd = redis.Redis()

loggedUser = None
userDB = "userData"
messageDB = "messageData"
#userData = {'userName':{'password': '','subscriptions':[]}
#messageData = {'userName':['messages']}

'''
	Function addUser()
	Params: 
		-> username (user identification)
		-> password (user authentication password)
	Function used to add a user to the database given a username and a password,
	initializes the user in both userDB and messageDB.
'''
def addUser(name, password):
	rd.hset(userDB, name, json.dumps({'password': password, 'subscriptions':[]}))
	rd.hset(messageDB, name, json.dumps([]))
	print("User added successfully!\n")
	return 0

'''
	Function authenticate()
	Params: 
		-> username (user identification)
		-> password (user authentication password)
	Function used to authenticate a certain user, providing access to the programs main functionalities,
	returning True if the authentication was successfull and False otherwise.
'''
def authenticate(username, password):
	if rd.hexists(userDB, username):
		data = json.loads(rd.hget(userDB, username))
		if data['password'] == password:
			return True
	return False

'''
	Function subscribe()
	Params: 
		-> user1 (user that will be subscribing)
		-> user2 (user which user1 will subscribe)
	Function used to process a subscription between users, if user2 exists and user1 is not already subscribed to him,
	 user2 will be added to user1s subscription list.
'''
def subscribe(user1, user2):
	if not rd.hexists(userDB, user2):
		print("User not found!")
		return 0
	if user1 == user2:
		print("You can't subscribe to yourself!")
		return 0
	# Get user data dictionary
	value = json.loads(rd.hget(userDB, user1))

	# If user1 is not already subscribed to user2, adds user2 to his list of subscribed users
	if value['subscriptions'] is None:
		value.update(subscriptions=[user2])
		rd.hset(userDB, user1, json.dumps(value))
		print("Subscribed to user ", user2, " successfully.")
	else:
		if user2 not in value['subscriptions']:
			value.update(subscriptions=value['subscriptions'] + [user2])
			rd.hset(userDB, user1, json.dumps(value))
			print("Subscribed to user ", user2, " successfully.")
		else:
			print("Already subscribed to user ", user2)

	return 0

'''
	Function subscribe()
	Params: 
		-> user1 (user that will be unsubscribing)
		-> user2 (user which user1 will unsubscribe)
	Function in which user 1 unsubscribes from user2, if user1 is in fact subscribed to user2,
	the subscription list in userDB will be updated, removing user2s username.
'''
def unsubscribe(user1, user2):
	value = json.loads(rd.hget(userDB, user1))
	if value['subscriptions'] is not None:
		if user2 in value['subscriptions']:
			value.update(subscriptions=value['subscriptions'].remove(user2))
			rd.hset(userDB, user1, json.dumps(value))
			print("Unsubscribed from user ", user2, " successfully.")
		else:
			print("You're not subscribed to this user.")
	else:
		print("You're not subscribed to this user.")

	return 0

'''
	Function saveMessage()
	Params: 
		-> user (user that is sending a message)
		-> message (message that is being sent)
	Function that processes the sending of a message, the timestamp and corresponding message will be stored
	inside the users message list on messageDB.
'''
def saveMessage(user, message):
	data = json.loads(rd.hget(messageDB, user))
	data.append(strftime("%Y-%m-%d %H:%M", gmtime()))
	data.append(message)
	rd.hset(messageDB, user, json.dumps(data))
	print(data)
	return 0

'''
	Function checkMessages()
	Params: 
		-> user (user whose messages we are retrieving)
	Function that retrieves all sent messages, with their corresponding timestamps, 
	from a specific user.
'''
def checkMessages(user):
	data = json.loads(rd.hget(messageDB, user))
	if data == []:
		print(user, "hasn't sent any messages!")
	n = 0
	while n < len(data):
		print(user, "(", data[n], ")", ": ", data[n+1])
		n+=2
	return 0

'''
	Function loginMenu()
	Function that handles main menu interactions.
'''
def loginMenu():
	option = None
	while True:
		print("\n### MAIN MENU ###")
		print("1 - Add user")
		print("2 - Login")
		print("3 - List all users")
		print("0 - Quit")
		option = input("Option? ")

		if option != "1" and option != "2" and option != "3" and option != "0":
			continue

		option = int(option)
		if option == 1:
			name = input("Username:  ")
			if rd.hexists(userDB, name):
				print("User already exists")
			else:
				password = input("Password: ")
				addUser(name, password)
			continue

		if option == 2:
			userName =  input("Username: ") 
			password =  input("Password: ") 

			if authenticate(userName, password):
				global loggedUser
				loggedUser = userName
				print("Logged in successfully.\n")
				userMenu()
			else:
				print("Login failed")
			continue

		if option == 3:
			print(rd.hkeys(userDB))
			continue

		if (option==0):
			break
	return option

'''
	Function loginMenu()
	Function that handles user menu interactions, after a user has logged in.
'''
def userMenu():
	option = None
	while option != 0:
		print("\n### USER MENU ###")
		print("1 - Subscribe to user")
		print("2 - Remove subscription")
		print("3 - Check subscribed users")
		print("4 - Send Message")
		print("5 - Check all subscribed users messages")
		print("6 - Check a users messages")
		print("0 - Logout")
		option = input("Option? ")

		if option != "1" and option != "2" and option != "3" and option != "4" and option != "5" and option != "6" and option != "0":
			continue
		option = int(option)

		if option == 1:
			name = input("Subscribe to which user? ")
			subscribe(loggedUser, name)
			continue

		if option == 2:
			name = input("Unsubscribe user: ")
			unsubscribe(loggedUser, name)
			continue
		
		if option == 3:
			value = json.loads(rd.hget(userDB, loggedUser))

			print("You are subscribed to:")
			if value['subscriptions'] is not None:

				for u in value['subscriptions']:
					print("- ", u)
			continue

		if option == 4:
			msg = input()
			if msg != "":
				saveMessage(loggedUser, msg)

			continue

		if option == 5:
			userList = json.loads(rd.hget(userDB, loggedUser))

			if userList['subscriptions'] is not None:
				for u in userList['subscriptions']:
					checkMessages(u)

			continue
		
		if option == 6:
			userList = json.loads(rd.hget(userDB, loggedUser))
			user = input("\nCheck messages for user: ")

			if userList['subscriptions'] is not None:
				if user in userList['subscriptions']:
					checkMessages(user)
				else:
					print("\nYou are not subscribed to that user!")

			continue

		if option == 0:
			break

	return 0


def main():
	while True:
		if loginMenu() == 0:
			break
	return 0

if __name__ == "__main__":
	
	main()