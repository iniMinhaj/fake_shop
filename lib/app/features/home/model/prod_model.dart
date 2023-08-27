// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProdModel {
  String id;
  String title;
  String price;
  String description;
  String category;
  String image;
  ProdModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  ProdModel copyWith({
    String? id,
    String? title,
    String? price,
    String? description,
    String? category,
    String? image,
  }) {
    return ProdModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
  }

  factory ProdModel.fromMap(Map<String, dynamic> map) {
    return ProdModel(
      id: map['id'] as String,
      title: map['title'] as String,
      price: map['price'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdModel.fromJson(String source) =>
      ProdModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProdModel(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image)';
  }

  @override
  bool operator ==(covariant ProdModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.description == description &&
        other.category == category &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        description.hashCode ^
        category.hashCode ^
        image.hashCode;
  }
}
