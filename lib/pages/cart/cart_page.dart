import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:go_sandwich/pages/detail_product/detail_product_page.dart';
import 'package:go_sandwich/pages/search/search_page.dart';
import 'package:go_sandwich/utils/colors.dart';
import 'package:go_sandwich/utils/data_common.dart';
import 'package:go_sandwich/utils/show_alert.dart';
import 'package:go_sandwich/widgets/card_product.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart';
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Future<bool> _onBackPressed() async {
    await showAlert(
      context: context,
      title: 'Alert',
      onPressed: () async {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        }
      },
      showCancelButton: true,
      content: 'Apakah anda yakin untuk keluar?',
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.lightBlue,
      ),
      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.fromLTRB(36, 36, 36, 78),
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
                    const SizedBox(height: 8),
                    const Text(
                      'Harry Maguire!',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: () {
                        context.pushNamed(SearchPage.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorTheme.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                        child: const Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 8),
                            Text(
                              'Search Sandwich',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Produk',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: (productDatas.length / 2).ceil(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CardProduct(
                                      product: productDatas[index * 2],
                                      onTap: () {
                                        context.pushNamed(DetailProduct.routeName,
                                            extra: productDatas[index * 2]);
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                    child: index * 2 + 1 < productDatas.length
                                        ? CardProduct(
                                            product: productDatas[index * 2 + 1],
                                            onTap: () {
                                              context.pushNamed(DetailProduct.routeName,
                                                  extra: productDatas[index * 2 + 1]);
                                            },
                                          )
                                        : Container(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
