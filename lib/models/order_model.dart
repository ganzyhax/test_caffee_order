class Order {
  late final int id;
  late final String name;
  late final int price;

  Order({
    required this.id,
    required this.name,
    required this.price,
  });

  Order.fromMap(Map<String, dynamic> result)
      : id = result["id"],
        name = result["name"],
        price = result["price"];

  Map<String, Object> toMap() {
    return {'id': id, 'name': name, 'price': price};
  }
}
