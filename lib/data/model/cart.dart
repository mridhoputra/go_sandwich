import 'package:go_sandwich/data/model/item.dart';

class Cart {
  Cart({
    this.items,
    this.totalPrice = 0,
  });

  List<Item>? items;
  int totalPrice;
}
