class Candidature {
  late int id;
  late int repair;
  late String text;
  late String status;
  late String created;
  late int user;

  Candidature(
      {required id, required repair, required text, required status, required created, required user});

  Candidature.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    repair = json['repair'];
    text = json['text'];
    status = json['status'];
    created = json['created'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['repair'] = repair;
    data['text'] = text;
    data['status'] = status;
    data['created'] = created;
    data['user'] = user;
    return data;
  }
}
