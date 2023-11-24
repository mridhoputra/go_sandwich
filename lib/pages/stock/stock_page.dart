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
import 'package:go_sandwich/widgets/card_stock.dart';

class StockPage extends StatefulWidget {
  static const routeName = '/profile-stock';
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
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
                    'Stok Barang',
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
                                margin: const EdgeInsets.only(bottom: 16),
                                child: CardStock(
                                  item: myCart.items![index],
                                  onAddItem: () {
                                    //TODO:
                                  },
                                  onSubstractItem: () {
                                    //TODO:
                                  },
                                ),
                              );
                            },
                          )
                        : const Text('Belum ada produk yang ditambahkan ke keranjang'),
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
                      'Update Stok Barang',
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
