import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:go_sandwich/data/model/product.dart';
import 'package:go_sandwich/pages/detail_product/detail_product_page.dart';
import 'package:go_sandwich/utils/colors.dart';
import 'package:go_sandwich/utils/data_common.dart';
import 'package:go_sandwich/widgets/card_product.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _query = '';

  List<Product> filteredProductDatas = [];

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
              padding: const EdgeInsets.fromLTRB(36, 36, 36, 78),
              decoration: BoxDecoration(
                color: ColorTheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorTheme.secondary,
                      labelStyle: const TextStyle(height: 1, color: Colors.black),
                      contentPadding: const EdgeInsets.symmetric(vertical: 4),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color(0xffffbbda),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 2,
                          color: ColorTheme.secondary,
                        ),
                      ),
                      labelText: 'Search Sandwich',
                      prefixIcon: const Icon(Icons.search, color: Colors.black),
                    ),
                    onChanged: (value) {
                      setState(() {
                        filteredProductDatas = productDatas
                            .where((element) =>
                                element.name.toLowerCase().contains(value.toLowerCase()))
                            .toList();
                        _query = value;
                      });
                    },
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
                    child: _query != ''
                        ? filteredProductDatas.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: (filteredProductDatas.length / 2).ceil(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: CardProduct(
                                              product: filteredProductDatas[index * 2],
                                              onTap: () {
                                                context.pushNamed(DetailProduct.routeName,
                                                    extra: filteredProductDatas[index * 2]);
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 24),
                                          Expanded(
                                            child: index * 2 + 1 < filteredProductDatas.length
                                                ? CardProduct(
                                                    product: filteredProductDatas[index * 2 + 1],
                                                    onTap: () {
                                                      context.pushNamed(DetailProduct.routeName,
                                                          extra:
                                                              filteredProductDatas[index * 2 + 1]);
                                                    },
                                                  )
                                                : Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const Text('Product not found.')
                        : ListView.builder(
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
    );
  }
}
