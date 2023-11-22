import 'package:go_sandwich/data/model/product.dart';

class Item {
  Item({
    this.product,
    this.quantity = 0,
  });

  Product? product;
  int quantity;
}
