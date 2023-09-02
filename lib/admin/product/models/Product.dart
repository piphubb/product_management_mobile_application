class Product {
  Product({
      this.id, 
      this.title, 
      this.description, 
      this.price, 
      this.discountPercentage, 
      this.rating, 
      this.stock, 
      this.brand, 
      this.category, 
      this.thumbnail, 
      this.images,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'] == null ? 0.0 : double.parse(json['price'].toString());
    discountPercentage = json['discountPercentage']== null ? 0.0 : double.parse(json['discountPercentage'].toString());
    rating = json['rating'] == null ? 0.0 : double.parse(json['rating'].toString());
    stock = json['stock']== null ? 0.0 : double.parse(json['stock'].toString());
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  int? id;
  String? title;
  String? description;
  double? price;
  double? discountPercentage;
  double? rating;
  double? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['price'] = price;
    map['discountPercentage'] = discountPercentage;
    map['rating'] = rating;
    map['stock'] = stock;
    map['brand'] = brand;
    map['category'] = category;
    map['thumbnail'] = thumbnail;
    map['images'] = images;
    return map;
  }

}