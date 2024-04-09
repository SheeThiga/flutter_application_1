class ProductModel {
  var product_id;
  var product_name;
  var product_image;
  var price;
  var quantity_sold;
  var quantity_remaining;

  ProductModel(
      {required this.product_id,
      required this.product_name,
      required this.product_image,
      required this.price,
      required this.quantity_sold,
      required this.quantity_remaining});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      product_id: json['product_id'] ?? '',
      product_name: json['product_name'] ?? '',
      product_image: json['product_image'] ?? '',
      price: json['price'] ?? '',
      quantity_sold: json['quantity_sold'] ?? '',
      quantity_remaining: json['quantity_remaining'] ?? '',
    );
  }
}
