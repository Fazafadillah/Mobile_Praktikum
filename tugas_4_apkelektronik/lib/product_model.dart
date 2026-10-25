class Product {
  final String title;
  final String? description;
  final String? image;
  final double price;

  Product({
    required this.title,
    required this.price,
    this.description,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      price: (json['price'] as num).toDouble(),
    );
  }
}
