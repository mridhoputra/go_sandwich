import 'package:flutter/material.dart';
import 'package:go_sandwich/data/model/item.dart';
import 'package:go_sandwich/utils/colors.dart';
import 'package:go_sandwich/utils/formatter.dart';

typedef OnSelect = void Function(bool? value);
typedef OnPressed = void Function();

class CardCart extends StatelessWidget {
  final Item item;
  final OnSelect onSelect;
  final bool selected;
  final OnPressed onAddItem;
  final OnPressed onRemoveItem;
  final OnPressed onSubstractItem;

  const CardCart({
    super.key,
    required this.item,
    required this.selected,
    required this.onSelect,
    required this.onAddItem,
    required this.onRemoveItem,
    required this.onSubstractItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(value: selected, onChanged: onSelect),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorTheme.secondary,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    item.product?.image ?? '-',
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.product?.name ?? '-',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: onRemoveItem,
                            child: const Icon(
                              Icons.delete_rounded,
                              size: 20,
                              color: Colors.redAccent,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.product?.shortDescription ?? '-',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatRupiah(item.product!.price.toDouble()),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  child: const Icon(Icons.remove, size: 14),
                                  onTap: () {
                                    if (item.quantity > 0) {
                                      onSubstractItem();
                                    }
                                  },
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    item.quantity.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  child: const Icon(Icons.add, size: 14),
                                  onTap: () {
                                    onAddItem();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
