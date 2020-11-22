capicua = function() { 
	// Get all phones from db
	var phones = db.phones.find({},{"display": 1, "_id": 0}).toArray();
	var result = [];

	for (var n = 0; n < phones.length; n++) {
		var num = phones[n].display.split("-")[1];
		var len = num.length-1;
		var count = 0;
		var flag = true
		
		while (len > count) {
			if (num.charAt(count) != num.charAt(len)) {
				flag = false;
			}

			count++;
			len--;
		}

		if (flag) {
			result.push(phones[n]);
		}
	}
	return result;
}