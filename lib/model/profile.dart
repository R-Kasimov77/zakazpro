class Profile {
  late int id;
  late String username;
  late String firstName;
  late String lastName;
  late bool isActive;
  late String dateJoined;
  // Null? accountType;
  // Null? about;
  late String phone;
  // Null? city;
  // Null? photo;
  // Null? experience;
  late bool isLegalEntity;
 late  List<Null> workCategories;

  Profile(
      {required id,
      required username,
      required firstName,
      required lastName,
      required isActive,
      required dateJoined,
      // this.accountType,
      // this.about,
      required phone,
      // this.city,
      // this.photo,
      // this.experience,
      required isLegalEntity,
      required workCategories});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    // accountType = json['account_type'];
    // about = json['about'];
    phone = json['phone'];
    // city = json['city'];
    // photo = json['photo'];
    // experience = json['experience'];
    isLegalEntity = json['is_legal_entity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['is_active'] = isActive;
    data['date_joined'] = dateJoined;
    // data['account_type'] = this.accountType;
    // data['about'] = this.about;
    data['phone'] = phone;
    // data['city'] = this.city;
    // data['photo'] = this.photo;
    // data['experience'] = this.experience;
    data['is_legal_entity'] = isLegalEntity;

    return data;
  }
}
