
class LoginResponse {

  bool admin;
  List<Object> chapterTops;
  List<Object> collectIds;
  String email;
  String icon;
  int id;
  String password;
  String token;
  int type;
  String username;

	LoginResponse.fromJsonMap(Map<String, dynamic> map): 
		admin = map["admin"],
		chapterTops = map["chapterTops"],
		collectIds = map["collectIds"],
		email = map["email"],
		icon = map["icon"],
		id = map["id"],
		password = map["password"],
		token = map["token"],
		type = map["type"],
		username = map["username"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['admin'] = admin;
		data['chapterTops'] = chapterTops;
		data['collectIds'] = collectIds;
		data['email'] = email;
		data['icon'] = icon;
		data['id'] = id;
		data['password'] = password;
		data['token'] = token;
		data['type'] = type;
		data['username'] = username;
		return data;
	}
}
