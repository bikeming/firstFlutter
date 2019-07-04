import 'package:firstflutter/bean/datas.dart';

class HomeBlocBean {

  int curPage;
  List<Datas> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

	HomeBlocBean.fromJsonMap(Map<String, dynamic> map): 
		curPage = map["curPage"],
		datas = List<Datas>.from(map["datas"].map((it) => Datas.fromJsonMap(it))),
		offset = map["offset"],
		over = map["over"],
		pageCount = map["pageCount"],
		size = map["size"],
		total = map["total"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['curPage'] = curPage;
		data['datas'] = datas != null ? 
			this.datas.map((v) => v.toJson()).toList()
			: null;
		data['offset'] = offset;
		data['over'] = over;
		data['pageCount'] = pageCount;
		data['size'] = size;
		data['total'] = total;
		return data;
	}
}
