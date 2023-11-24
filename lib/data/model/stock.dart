import 'package:go_sandwich/data/model/item.dart';

class Stock {
  Stock({
    this.items,
  });

  List<Item>? items;

  bool canAddToCart(Item newItem) {
    if (items != null) {
      var stockItem = items!.firstWhere(
        (stockItem) => stockItem.product!.name == newItem.product!.name,
        orElse: () => Item(product: newItem.product, quantity: 0),
      );

      // Check if the item is in stock
      if (stockItem.quantity >= newItem.quantity) {
        return true;
      } else {
        return false;
      }
    }

    return false;
  }

  void addToCart(Item newItem) {
    if (canAddToCart(newItem) == true) {
      // Decrease stock
      var stockItemIndex = items!.indexWhere(
        (stockItem) => stockItem.product!.name == newItem.product!.name,
      );
      items![stockItemIndex].quantity -= newItem.quantity;
    }
  }

  void addOrUpdateStock(Item newItem) {
    if (canAddToCart(newItem)) {
      var stockItemIndex = items!.indexWhere(
        (stockItem) => stockItem.product!.name == newItem.product!.name,
      );

      if (stockItemIndex != -1) {
        // If the item already exists in stock, update the quantity
        items![stockItemIndex].quantity -= newItem.quantity;
      } else {
        // If the item doesn't exist in stock, add it
        items!.add(Item(
          product: newItem.product,
          quantity: -newItem.quantity, // negative quantity to represent stock
        ));
      }
    }
  }
}
