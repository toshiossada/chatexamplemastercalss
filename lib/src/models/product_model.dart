class ProductModel {
  final int id;
  final String description;
  final double price;
  final String image;

  ProductModel({
    required this.id,
    required this.description,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      description: json['description'],
      price: json['price'].toDouble(),
      image: json['thumbnail'],
    );
  }
}
