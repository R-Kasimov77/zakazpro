class Order {
  // late Links links;
  late int count;
  late int totalPages;
  late List<Results> results;

  Order(
      {required links, required count, required totalPages, required results});

  Order.fromJson(Map<String, dynamic> json) {
    // links = (json['links'] != null ? Links.fromJson(json['links']) : null)!;
    count = json['count'];
    totalPages = json['total_pages'];
    results = <Results>[];
    json['results'].forEach((v) {
      results.add(Results.fromJson(v));
    });
  }
}

// class Links {
//   Null? next;
//   Null? previous;

//   Links({this.next, this.previous});

//   Links.fromJson(Map<String, dynamic> json) {
//     next = json['next'];
//     previous = json['previous'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['next'] = this.next;
//     data['previous'] = this.previous;
//     return data;
//   }
// }

class Results {
  late int id;
  // late Author author;
  late List<String> paymentTypes;
  late List<Responses> responses;
  late String status;
  late String city;
  late String address;
  late String description;
  late String created;
  late List<WorkCategory> workCategories;

  Results(
      {required id,
      required author,
      required paymentTypes,
      required responses,
      required status,
      required city,
      required address,
      required description,
      required created,
      required workCategories});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // author = (json['author'] != null ? Author.fromJson(json['author']) : null)!;
    paymentTypes = json['payment_types'].cast<String>();
    responses = <Responses>[];
    json['responses'].forEach((v) {
      responses.add(Responses.fromJson(v));
    });
    status = json['status'];
    city = json['city'];
    address = json['address'];
    description = json['description'];
    created = json['created'];
    workCategories = <WorkCategory>[];
    json['work_categories'].forEach((v) {
      workCategories.add(WorkCategory.fromJson(v));
    });
  }
}

// class Author {
//   late int id;
//   late String username;
//   late String firstName;
//   late String lastName;
//   late bool isActive;
//   late String dateJoined;

//   late String phone;

//   bool isLegalEntity;
//   List<Null> workCategories;

//   Author(
//       {required id,
//       required username,
//       required firstName,
//       required lastName,
//       required isActive,
//       required dateJoined,
//       required phone,
//       required isLegalEntity,
//     //  required workCategories
//      });

//   Author.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     username = json['username'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     isActive = json['is_active'];
//     dateJoined = json['date_joined'];
//     phone = json['phone'];
//     isLegalEntity = json['is_legal_entity'];
//       // workCategories = <Null>[];
//       // json['work_categories'].forEach((v) {
//       //   workCategories.add(void.fromJson(v));
//       // });

//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['username'] = username;
//     data['first_name'] = firstName;
//     data['last_name'] = lastName;
//     data['is_active'] = isActive;
//     data['date_joined'] = dateJoined;
//     data['phone'] = phone;
//     data['is_legal_entity'] = isLegalEntity;
//     // data['work_categories'] =
//     // workCategories!.map((v) => v.toJson()).toList();
//     return data;
//   }
// }

class Responses {
  late int id;
  late User user;
  late String text;
  late String status;
  late String created;
  late int repair;

  Responses(
      {required id,
      required user,
      required text,
      required status,
      required created,
      required repair});

  Responses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
    text = json['text'];
    status = json['status'];
    created = json['created'];
    repair = json['repair'];
  }
}

class User {
  late int id;
  late String username;
  late String firstName;
  late String lastName;
  late bool isActive;
  late String dateJoined;
  late bool isLegalEntity;
  late String? phone;

  User({
    required id,
    required username,
    required firstName,
    required lastName,
    required isActive,
    required dateJoined,
    required isLegalEntity,
    required phone,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    isLegalEntity = json['is_legal_entity'];
    phone = json['phone'];
  }
}

class WorkCategory {
  int? id;
  String? name;

  WorkCategory({
    this.id,
    this.name,
  });

  WorkCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;

    return data;
  }
}
