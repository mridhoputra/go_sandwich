import 'package:go_sandwich/data/model/item.dart';

class Cart {
  Cart({
    this.items,
    this.totalPrice = 0,
  });

  List<Item>? items;
  int totalPrice;

  void addItem(Item newItem) {
    items ??= [];

    // Check if the item already exists in the cart
    var existingItemIndex = items!.indexWhere(
      (item) => item.product!.name == newItem.product!.name,
    );

    if (existingItemIndex != -1) {
      // If the item exists, update quantity and totalPrice
      items![existingItemIndex].quantity += newItem.quantity;
    } else {
      // If the item doesn't exist, add it to the cart
      items!.add(newItem);
    }

    // Update totalPrice
    updateTotalPrice();
  }

  void updateItemQuantity(Item item, int newQuantity) {
    if (items != null) {
      var existingItemIndex = items!.indexWhere(
        (cartItem) => cartItem.product!.name == item.product!.name,
      );

      if (existingItemIndex != -1) {
        // Ensure the new quantity is greater than 0
        items![existingItemIndex].quantity = newQuantity > 0 ? newQuantity : 1;
        updateTotalPrice();
      }
    }
  }

  void deleteItem(Item item) {
    items?.removeWhere((cartItem) => cartItem.product!.name == item.product!.name);
    updateTotalPrice();
  }

  void updateTotalPrice() {
    totalPrice =
        items?.fold<int>(0, (sum, item) => sum + (item.quantity * (item.product?.price ?? 0))) ?? 0;
  }

  void removeItems(List<Item> itemsToRemove) {
    if (items != null) {
      items!.removeWhere((cartItem) => itemsToRemove.contains(cartItem));
      updateTotalPrice();
    }
  }
}
