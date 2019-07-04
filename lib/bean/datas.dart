
class Datas {

  String apkLink;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int superChapterId;
  String superChapterName;
  List<Object> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

	Datas.fromJsonMap(Map<String, dynamic> map): 
		apkLink = map["apkLink"],
		author = map["author"],
		chapterId = map["chapterId"],
		chapterName = map["chapterName"],
		collect = map["collect"],
		courseId = map["courseId"],
		desc = map["desc"],
		envelopePic = map["envelopePic"],
		fresh = map["fresh"],
		id = map["id"],
		link = map["link"],
		niceDate = map["niceDate"],
		origin = map["origin"],
		prefix = map["prefix"],
		projectLink = map["projectLink"],
		publishTime = map["publishTime"],
		superChapterId = map["superChapterId"],
		superChapterName = map["superChapterName"],
		tags = map["tags"],
		title = map["title"],
		type = map["type"],
		userId = map["userId"],
		visible = map["visible"],
		zan = map["zan"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['apkLink'] = apkLink;
		data['author'] = author;
		data['chapterId'] = chapterId;
		data['chapterName'] = chapterName;
		data['collect'] = collect;
		data['courseId'] = courseId;
		data['desc'] = desc;
		data['envelopePic'] = envelopePic;
		data['fresh'] = fresh;
		data['id'] = id;
		data['link'] = link;
		data['niceDate'] = niceDate;
		data['origin'] = origin;
		data['prefix'] = prefix;
		data['projectLink'] = projectLink;
		data['publishTime'] = publishTime;
		data['superChapterId'] = superChapterId;
		data['superChapterName'] = superChapterName;
		data['tags'] = tags;
		data['title'] = title;
		data['type'] = type;
		data['userId'] = userId;
		data['visible'] = visible;
		data['zan'] = zan;
		return data;
	}
}
