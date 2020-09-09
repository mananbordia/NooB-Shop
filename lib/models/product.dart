// This is a blueprint/object of our products
class Product {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite; // Marking it as false by default
  // Constructor with named arguments
  Product(
      {this.title,
      this.id,
      this.description,
      this.imageUrl,
      this.price,
      this.isFavorite = false});
}
