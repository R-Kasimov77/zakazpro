class CreateOrderModel {
  List<String>? paymentTypes;
  String? city;
  String? address;
  String? description;

  CreateOrderModel(
      {this.paymentTypes, this.city, this.address, this.description});

  CreateOrderModel.fromJson(Map<String, dynamic> json) {
    paymentTypes = json['payment_types'].cast<String>();
    city = json['city'];
    address = json['address'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_types'] = this.paymentTypes;
    data['city'] = this.city;
    data['address'] = this.address;
    data['description'] = this.description;
    return data;
  }
}
