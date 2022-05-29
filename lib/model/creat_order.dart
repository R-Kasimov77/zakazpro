class Createorder {
  int? id;
  Author? author;
  List<String>? paymentTypes;
  // List<Null>? responses;
  String? status;
  String? city;
  String? address;
  String? description;
  String? created;
  // List<Null>? workCategories;

  Createorder({
    this.id,
    this.author,
    this.paymentTypes,
    // this.responses,
    this.status,
    this.city,
    this.address,
    this.description,
    this.created,
    // this.workCategories
  });

  Createorder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author =
        json['author'] != null ? Author.fromJson(json['author']) : null;
    paymentTypes = json['payment_types'].cast<String>();
    if (json['responses'] != null) {
      // responses = <Null>[];
      json['responses'].forEach((v) {
        // responses!.add(new Null.fromJson(v));
      });
    }
    status = json['status'];
    city = json['city'];
    address = json['address'];
    description = json['description'];
    created = json['created'];
    if (json['work_categories'] != null) {
      // workCategories = <Null>[];
      json['work_categories'].forEach((v) {
        // workCategories!.add(new Null.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  // data['id'] = this.id;
  // if (this.author != null) {
  //   data['author'] = this.author!.toJson();
  // }
  // data['payment_types'] = this.paymentTypes;
  // if (this.responses != null) {
  // data['responses'] = this.responses!.map((v) => v.toJson()).toList();
  // }
  // data['status'] = this.status;
  // data['city'] = this.city;
  // data['address'] = this.address;
  // data['description'] = this.description;
  // data['created'] = this.created;
  // if (this.workCategories != null) {
  //   data['work_categories'] =
  //       this.workCategories!.map((v) => v.toJson()).toList();
  // }
  // return data;
}
// }

class Author {
  late int id;
  late String username;
  late String firstName;
  late String lastName;
  late bool isActive;
  late String dateJoined;
  late Null accountType;
  late Null about;
  late String phone;
  late Null city;
  late Null photo;
  late Null experience;
  late bool isLegalEntity;
  late List<Null> workCategories;

  Author(
      {required id,
      required username,
      required firstName,
      required lastName,
      required isActive,
      required dateJoined,
      required accountType,
      required about,
      required phone,
      required city,
      required photo,
      required experience,
      required isLegalEntity,
      required workCategories});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    accountType = json['account_type'];
    about = json['about'];
    phone = json['phone'];
    city = json['city'];
    photo = json['photo'];
    experience = json['experience'];
    isLegalEntity = json['is_legal_entity'];
    if (json['work_categories'] != null) {
      workCategories = <Null>[];
      json['work_categories'].forEach((v) {
        // workCategories!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['is_active'] = isActive;
    data['date_joined'] = dateJoined;
    data['account_type'] = accountType;
    data['about'] = about;
    data['phone'] = phone;
    data['city'] = city;
    data['photo'] = photo;
    data['experience'] = experience;
    data['is_legal_entity'] = isLegalEntity;
    return data;
  }
}
