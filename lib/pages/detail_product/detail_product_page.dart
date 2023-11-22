import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:go_sandwich/data/model/item.dart';
import 'package:go_sandwich/data/model/product.dart';
import 'package:go_sandwich/utils/colors.dart';
import 'package:go_sandwich/utils/formatter.dart';

class DetailProduct extends StatefulWidget {
  static const routeName = '/detail-product';
  final Product product;
  const DetailProduct({super.key, required this.product});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  Item item = Item();

  List<Product> productDatas = [
    Product(
      name: 'Sandwich Buah Stroberi',
      image: 'assets/images/il_sandwich_strawberry.png',
      price: 12000,
      shortDescription: 'A delicious sandwich',
      description: 'Sandwich Strawberry',
    ),
    Product(
      name: 'Sandwich Buah Kiwi',
      image: 'assets/images/il_sandwich_kiwi.png',
      price: 12000,
      shortDescription: 'A delicious sandwich',
      description: 'Sandwich Kiwi',
    ),
    Product(
      name: 'Sandwich Buah Campuran',
      image: 'assets/images/il_sandwich_mix_2.png',
      price: 12000,
      shortDescription: 'A delicious sandwich',
      description: 'Sandwich Kiwi',
    ),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      item = Item(product: widget.product, quantity: 0);
    });
  }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(36, 24, 36, 36),
                  decoration: BoxDecoration(
                    color: ColorTheme.primary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: const Icon(Icons.arrow_back_rounded, size: 24),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          widget.product.image,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(36, 24, 36, 36),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.product.shortDescription,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatRupiah(widget.product.price.toDouble()),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: ColorTheme.secondary,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  child: const Icon(Icons.remove),
                                  onTap: () {
                                    if (item.quantity > 0) {
                                      setState(() {
                                        item.quantity = item.quantity - 1;
                                      });
                                    }
                                  },
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    item.quantity.toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  child: const Icon(Icons.add),
                                  onTap: () {
                                    setState(() {
                                      item.quantity = item.quantity + 1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Stok: 16',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.product.description,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 32),
                      InkWell(
                        onTap: () {
                          //TODO:
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Add to cart',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
