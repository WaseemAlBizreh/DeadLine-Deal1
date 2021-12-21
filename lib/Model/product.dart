class product{
  late String name;
  late String image;
  late String expiration_date;
  late String contact_info;
  late int initial_price;
  late int quantity;
  late int id;
  late int category_id;
  late int owner_id;
  late int first_discount_percentage;
  late int second_discount_percentage;
  late int third_discount_percentage;

  product({
    required this.name,
    required this.image,
    required this.expiration_date,
    required this.initial_price,
    required this.quantity,
    required this.contact_info,
    required this.id,
    required this.category_id,
    required this.owner_id,
    required this.first_discount_percentage,
    required this.second_discount_percentage,
    required this.third_discount_percentage
  });

  factory product.fromJson(Map<String , dynamic> jsonData){
    return product(
      name: jsonData['name'],
      image: jsonData['image'],
      expiration_date: jsonData['expiration_date'],
      initial_price: jsonData['initial_price'],
      quantity: jsonData['quantity'],
      contact_info: jsonData['contact_info'],
      id: jsonData['id'],
      category_id: jsonData['category_id'],
      owner_id: jsonData['owner_id'],
      first_discount_percentage: jsonData['first_discount_percentage'],
      second_discount_percentage: jsonData['second_discount_percentage'],
      third_discount_percentage: jsonData['third_discount_percentage'],
    );
  }
}

class product_list{
  late List<dynamic> products_list;

  product_list({
    required this.products_list
  });

  factory product_list.fromJson(jsonData){
    return product_list(
      products_list: jsonData,
    );
  }
}