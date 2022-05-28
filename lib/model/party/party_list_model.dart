class PartyListModel {
  int? id;
  String? body;
  String? title;

  PartyListModel();
  PartyListModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    body = data['body'];
    title = data['title'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'body': body,
      'title': title,
    };
  }
}
