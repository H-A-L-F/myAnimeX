import 'package:flutter/material.dart';
import 'package:myanimex/constants.dart';
import 'package:myanimex/pages/Items/items_page.dart';

class ItemDisplay extends StatelessWidget {
  const ItemDisplay({Key? key, required this.merch}) : super(key: key);

  final Merch merch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(merch.image, fit: BoxFit.fill, width: 1000.0),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: defPad),
          child: Text(
            merch.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              color: colPrimaryDark,
            ),
          ),
        ),
        Text(
          merch.desc,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
            color: colPrimaryDark,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colSecondaryBase),
              child: Text(
                merch.price,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: colPrimaryDark,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
