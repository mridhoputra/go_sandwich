import 'package:go_sandwich/data/model/cart.dart';
import 'package:go_sandwich/data/model/item.dart';
import 'package:go_sandwich/data/model/product.dart';

class Stock {
  Stock({
    this.items,
  });

  List<Item>? items;

  Item getStockItem(Product product) {
    if (items != null) {
      return items!.firstWhere(
        (stockItem) => stockItem.product!.name == product.name,
        orElse: () => Item(product: product, quantity: 0),
      );
    }
    return Item(product: product, quantity: 0);
  }

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

  void updateStockQuantity(Product product, int newQuantity) {
    if (items != null) {
      var stockItemIndex = items!.indexWhere(
        (stockItem) => stockItem.product!.name == product.name,
      );

      if (stockItemIndex != -1) {
        // If the product is found in the stock, update its quantity
        items![stockItemIndex].quantity = newQuantity;
      } else {
        // If the product is not found, add a new item to the stock
        items!.add(Item(product: product, quantity: newQuantity));
      }
    }
  }

  void subtractPurchasedQuantities(Cart selectedCart) {
    selectedCart.items?.forEach((item) {
      if (items != null) {
        var stockItem = items!.firstWhere(
          (stockItem) => stockItem.product!.name == item.product!.name,
          orElse: () => Item(product: item.product, quantity: 0),
        );

        stockItem.quantity -= item.quantity;
      }
    });
  }
}
