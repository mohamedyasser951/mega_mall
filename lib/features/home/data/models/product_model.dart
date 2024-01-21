import 'package:mega_mall/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.category,
      required super.image,
      required super.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: RatingModel.fromJson(json["rating"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
      "rating": rating,
    };
  }
}

class RatingModel extends RatingEntity {
  const RatingModel({required super.rate, required super.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      count: json["count"],
      rate: json["rate"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "count": count,
      "rate": rate,
    };
  }
}
