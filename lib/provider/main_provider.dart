import 'package:flutter/foundation.dart';
import 'package:go_sandwich/data/model/cart.dart';
import 'package:go_sandwich/data/model/item.dart';
import 'package:go_sandwich/data/model/product.dart';
import 'package:go_sandwich/data/model/stock.dart';
import 'package:go_sandwich/data/model/user.dart';

class MainProvider extends ChangeNotifier {
  User _user = User();
  Cart _cart = Cart(items: [], totalPrice: 0);
  Stock _stock = Stock(
    items: [
      Item(
        product: Product(
          name: 'Sandwich Buah Stroberi',
          image: 'assets/images/il_sandwich_strawberry.png',
          price: 12000,
          shortDescription: 'Roti tawar dengan krim dan potongan buah stroberi',
          description:
              'Buah stroberi yang digunakan untuk membuat kreasi fruit sandwich ternyata kaya akan kandungan vitamin C. Vitamin C sangat dibutuhkan untuk menjaga daya tahan tubuhmu setiap hari.',
        ),
        quantity: 10,
      ),
      Item(
        product: Product(
          name: 'Sandwich Buah Kiwi',
          image: 'assets/images/il_sandwich_kiwi.png',
          price: 12000,
          shortDescription: 'Roti tawar dengan krim dan potongan buah kiwi',
          description:
              'Buah kiwi yang digunakan untuk membuat kreasi fruit sandwich ternyata kaya akan kandungan vitamin C. Vitamin C sangat dibutuhkan untuk menjaga daya tahan tubuhmu setiap hari.',
        ),
        quantity: 10,
      ),
      Item(
        product: Product(
          name: 'Sandwich Buah Campuran',
          image: 'assets/images/il_sandwich_mix_2.png',
          price: 12000,
          shortDescription: 'A delicious sandwich',
          description: 'Sandwich Kiwi',
        ),
        quantity: 10,
      ),
    ],
  );

  User get user => _user;
  Cart get cart => _cart;
  Stock get stock => _stock;

  void loginDefaultAccount() {
    _user = User(
      email: 'tester@gmail.com',
      fullName: 'Harry Maguire',
      username: 'tester',
    );
    _cart = Cart(items: [], totalPrice: 0);
    notifyListeners();
  }

  void register(String username, String email, String password, String fullName) {
    _user = User(
      email: email,
      username: username,
      fullName: fullName,
    );
    _cart = Cart(items: [], totalPrice: 0);
    notifyListeners();
  }

  void logout() {
    _user = User();
    notifyListeners();
  }

  Item getStockItem(Product product) {
    return _stock.getStockItem(product);
  }

  String addToCart(Item newItem) {
    if (_stock.canAddToCart(newItem)) {
      _cart.addItem(newItem);
      notifyListeners();
      return 'OK';
    } else {
      return 'Stok ${newItem.product?.name} tidak cukup';
    }
  }

  String updateCartItem(Item item, int newQuantity) {
    if (_stock.canAddToCart(Item(product: item.product, quantity: newQuantity))) {
      _cart.updateItemQuantity(item, newQuantity);
      notifyListeners();
      return 'OK';
    } else {
      return 'Stok ${item.product?.name} tidak cukup';
    }
  }

  String deleteCartItem(Item item) {
    _cart.deleteItem(item);
    notifyListeners();
    return 'OK';
  }

  String checkoutItem(Cart selectedCart) {
    try {
      _stock.subtractPurchasedQuantities(selectedCart);
      _cart.removeItems(selectedCart.items!);
      notifyListeners();
      return 'OK';
    } catch (e) {
      return 'Order gagal';
    }
  }

  void updateStockItem(Product selectedProduct, int newQuantity) {
    _stock.updateStockQuantity(selectedProduct, newQuantity);
    notifyListeners();
  }
}
