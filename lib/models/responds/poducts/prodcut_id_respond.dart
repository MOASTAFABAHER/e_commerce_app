class ProductIdRespond {
  int? status;
  String? message;
  Data? data;

  ProductIdRespond({this.status, this.message, this.data});

  ProductIdRespond.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? categoryName;
  String? name;
  int? price;
  int? qty;
  String? image;
  int? offer;

  Data(
      {this.id,
      this.categoryName,
      this.name,
      this.price,
      this.qty,
      this.image,
      this.offer});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category name'];
    name = json['name'];
    price = json['price'];
    qty = json['qty'];
    image = json['image'];
    offer = json['offer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category name'] = this.categoryName;
    data['name'] = this.name;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['image'] = this.image;
    data['offer'] = this.offer;
    return data;
  }
}
