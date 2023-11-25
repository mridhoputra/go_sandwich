import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_sandwich/provider/main_provider.dart';
import 'package:go_sandwich/utils/colors.dart';
import 'package:go_sandwich/widgets/card_stock.dart';
import 'package:provider/provider.dart';

class StockPage extends StatefulWidget {
  static const routeName = '/profile-stock';
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.lightBlue,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Consumer<MainProvider>(builder: (context, data, child) {
            return SingleChildScrollView(
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
                      child: (data.stock.items?.isNotEmpty ?? false)
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.stock.items?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  child: CardStock(
                                    item: data.stock.items![index],
                                    onAddItem: () {
                                      data.updateStockItem(data.stock.items![index].product!,
                                          data.stock.items![index].quantity + 1);
                                    },
                                    onSubstractItem: () {
                                      if (data.stock.items![index].quantity - 1 >= 0) {
                                        data.updateStockItem(data.stock.items![index].product!,
                                            data.stock.items![index].quantity - 1);
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: 'Tidak bisa kurang dari 0',
                                            toastLength: Toast.LENGTH_LONG);
                                      }
                                    },
                                  ),
                                );
                              },
                            )
                          : const Text('Belum ada produk yang ditambahkan ke keranjang'),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
