class ProductModel {
  String? sId;
  String? category;
  String? title;
  String? description;
  int? price;
  List<Null>? image;
  String? updatedOn;
  String? createdOn;

  ProductModel(
      {this.sId,
      this.category,
      this.title,
      this.description,
      this.price,
      this.image,
      this.updatedOn,
      this.createdOn});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    if (json['image'] != null) {
      image = <Null>[];
      json['image'].forEach((v) {
        image!.add(new Null.fromJson(v));
      });
    }
    updatedOn = json['updatedOn'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category'] = this.category;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    data['updatedOn'] = this.updatedOn;
    data['createdOn'] = this.createdOn;
    return data;
  }
}