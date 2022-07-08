
class ProfileGet {
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
  // List<Null>? workCategories;

  ProfileGet({
    required id,
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
    // this.workCategories
  });

  ProfileGet.fromJson(Map<String, dynamic> json) {
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
    // if (json['work_categories'] != null) {
    //   workCategories = <Null>[];
    //   json['work_categories'].forEach((v) {
    //     workCategories!.add(new Null.fromJson(v));
    //   });
    // }
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
    // if (this.workCategories != null) {
    //   data['work_categories'] =
    //       this.workCategories!.map((v) => v.toJson()).toList();
    // }
    return data;
  }

//   Future<ProfileGet> copyWith(
//       {String? username, String? phone, String? lastname}) async {
//     return ProfileGet(
//         id: id,
//         username: username,
//         firstName: firstName,
//         lastName: lastName,
//         isActive: isActive,
//         dateJoined: dateJoined,
//         accountType: accountType,
//         about: about,
//         phone: phone,
//         city: city,
//         photo: photo,
//         experience: experience,
//         isLegalEntity: isLegalEntity);
//   }
}
