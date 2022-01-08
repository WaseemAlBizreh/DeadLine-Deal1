class ReqProduct {
  late String name;
  late DateTime endDate; //Date
  late String contact;
  late String category;
  double quantity;//
  double price;//
  int days1;
  int days2;
  int days3;
  double discount1_percentage;
  double discount2_percentage;
  double discount3_percentage;

  ReqProduct({
    required this.name,
    required this.endDate,
    required this.price,
    required this.quantity,
    required this.contact,
    required this.category,
    required this.days1,
    required this.days2,
    required this.days3,
    required this.discount1_percentage,
    required this.discount2_percentage,
    required this.discount3_percentage
  });

  Map<String, String> toJson() {
    Map<String, String> ProductMap = {
      'name': name,
      'endDate': '${endDate}',
      'price': '${price}',
      'quantity': '${quantity}',
      'contact': contact,
      'category': category,
      'r1': '${days1}',
      'r2': '${days2}',
      'r3': '${days3}',
      'dis1': '${discount1_percentage}',
      'dis2': '${discount2_percentage}',
      'dis3': '${discount3_percentage}',
    };
    return ProductMap;
  }
}

class ResProduct {
  late String name;
  late String image; // File
  late String endDate; //Date
  late String contact;
  late String category;
  var quantity;
  var init_price;
  var main_price;
  int days;
  int id;
  int views;
  int like;
  bool isLike;

  ResProduct({
    required this.name,
    required this.image,
    required this.endDate,
    required this.init_price,
    required this.main_price,
    required this.quantity,
    required this.contact,
    required this.category,
    required this.days,
    required this.id,
    required this.views,
    required this.like,
    required this.isLike,
  });

  factory ResProduct.fromJson(Map<String, dynamic> jsonData) {
    return ResProduct(
      name: jsonData['name'] as String,
      image: jsonData['image'],
      endDate: jsonData['endDate'],
      init_price: jsonData['init_price'],
      main_price: jsonData['price'],
      quantity: jsonData['quantity'],
      contact: jsonData['contact'],
      days: jsonData['days'],
      id: jsonData['id'],
      category: jsonData['category'],
      views: jsonData['views_count'],
      like: jsonData['likes_count'],
      isLike: jsonData['isLike'],
    );
  }
}

class product_list {
  late List<dynamic> products_list;

  product_list({required this.products_list});

  factory product_list.fromJson(jsonData) {
    return product_list(
      products_list: jsonData,
    );
  }
}
