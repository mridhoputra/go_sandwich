import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:go_sandwich/data/model/cart.dart';
import 'package:go_sandwich/data/model/item.dart';
import 'package:go_sandwich/pages/checkout/checkout_page.dart';
import 'package:go_sandwich/utils/colors.dart';
import 'package:go_sandwich/utils/data_common.dart';
import 'package:go_sandwich/utils/formatter.dart';
import 'package:go_sandwich/widgets/card_cart.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart';
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Cart myCart = Cart(
    items: [
      Item(
        product: productDatas[0],
        quantity: 1,
      ),
      Item(
        product: productDatas[1],
        quantity: 1,
      ),
    ],
    totalPrice: 24000,
  );
  Cart selectedCart = Cart(items: [], totalPrice: 0);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.lightBlue,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 96),
              decoration: BoxDecoration(
                color: ColorTheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Keranjang Saya',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: (myCart.items?.isNotEmpty ?? false)
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: myCart.items?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 16, right: 12),
                                child: CardCart(
                                  item: myCart.items![index],
                                  onRemoveItem: () {
                                    //TODO:
                                  },
                                  onAddItem: () {
                                    //TODO:
                                  },
                                  onSubstractItem: () {
                                    //TODO:
                                  },
                                  onSelect: (value) {
                                    if (selectedCart.items?.any((item) =>
                                            item.product?.name ==
                                            myCart.items![index].product?.name) ??
                                        false) {
                                      if (value == false) {
                                        setState(() {
                                          selectedCart.items?.removeWhere((item) =>
                                              item.product?.name ==
                                              myCart.items![index].product?.name);
                                          selectedCart.totalPrice = selectedCart.totalPrice -
                                              (myCart.items![index].quantity *
                                                  myCart.items![index].product!.price);
                                        });
                                      }
                                    } else {
                                      if (value == true) {
                                        setState(() {
                                          selectedCart.items?.add(myCart.items![index]);
                                          selectedCart.totalPrice = selectedCart.totalPrice +
                                              (myCart.items![index].quantity *
                                                  myCart.items![index].product!.price);
                                        });
                                      }
                                    }
                                  },
                                  selected: selectedCart.items?.any((item) =>
                                          item.product?.name ==
                                          myCart.items![index].product?.name) ??
                                      false,
                                ),
                              );
                            },
                          )
                        : const Text('Belum ada produk yang ditambahkan ke keranjang'),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Total: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        formatRupiah(selectedCart.totalPrice.toDouble()),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedCart.items?.isNotEmpty ?? false) {
                        context.pushNamed(CheckoutPage.routeName, extra: selectedCart);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Belum ada barang yang ditambahkan ke keranjang',
                            toastLength: Toast.LENGTH_LONG);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Checkout',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
