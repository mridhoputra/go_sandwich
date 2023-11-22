import 'package:flutter/material.dart';
import 'package:go_sandwich/data/model/product.dart';
import 'package:go_sandwich/utils/formatter.dart';

typedef OnTap = void Function();

class CardProduct extends StatelessWidget {
  final Product product;
  final OnTap onTap;
  const CardProduct({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: const Offset(0, 4),
              color: const Color(0xFF111111).withOpacity(0.05),
            ),
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 1,
              color: const Color(0xFF111111).withOpacity(0.04),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              height: 170,
              product.image,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      product.shortDescription,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      formatRupiah(product.price.toDouble()),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
