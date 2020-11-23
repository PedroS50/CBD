# Script used to write initials4redis.txt

inputFile = 'female-names.txt'
outputFile = 'initials4redis.txt'

with open(inputFile, 'r') as fileR:
	with open(outputFile, 'w') as fileW:
		line = fileR.readline()
		wordCount = 0
		letter = None

		# If the file is not empty...
		if line is not None:
			letter = line[0].lower()

			while line:
				# currentLetter = first letter of the current line
				currentLetter = line[0].lower()
				if currentLetter != letter:
					fileW.write("SET {} {}\r\n".format(letter.capitalize(), wordCount))
					letter = currentLetter
					wordCount = 0
				wordCount+=1
				line = fileR.readline()
			fileW.write("SET {} {}\r\n".format(letter.capitalize(), wordCount))
# TO USE: cat initials4redis.txt | redis-cli --pipe
