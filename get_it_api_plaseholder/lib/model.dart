class PlaceholderModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PlaceholderModel({this.userId, this.id, this.title, this.body});

  PlaceholderModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
