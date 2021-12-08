class ToModel {
  late int _albumId;
  late int _id;
  late String _title;
  late String _url;
  late String _thumbnailUrl;

  ToModel(
      {required int albumId,
      required int id,
      required String title,
      required String url,
      required String thumbnailUrl}) {
    this._albumId = albumId;
    this._id = id;
    this._title = title;
    this._url = url;
    this._thumbnailUrl = thumbnailUrl;
  }

  int get albumId => _albumId;
  set albumId(int albumId) => _albumId = albumId;
  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;
  String get url => _url;
  set url(String url) => _url = url;
  String get thumbnailUrl => _thumbnailUrl;
  set thumbnailUrl(String thumbnailUrl) => _thumbnailUrl = thumbnailUrl;

  ToModel.fromJson(Map<String, dynamic> json) {
    _albumId = json['albumId'];
    _id = json['id'];
    _title = json['title'];
    _url = json['url'];
    _thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this._albumId;
    data['id'] = this._id;
    data['title'] = this._title;
    data['url'] = this._url;
    data['thumbnailUrl'] = this._thumbnailUrl;
    return data;
  }
}
