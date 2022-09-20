import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myanimex/constants.dart';
import 'package:myanimex/pages/Detail/components/item_display.dart';

class Merch {
  final String name;
  final String image;
  final String price;
  final String desc;

  const Merch(
    this.name,
    this.image,
    this.price,
    this.desc,
  );
}

final List<Merch> merches = [
  const Merch('Reze T-Shirt', 'assets/reze1.jpg', 'Rp 225.000',
      'This unisex essential tee fits like a beloved favorite. Featuring a crew neck, short sleeves and high definition printing makes these a pleasure to wear for all occasions.'),
  const Merch('Makima Poster', 'assets/makima1.jpg', 'Rp 420.000',
      'All of our Tapestries are custom-made-to-order and handcrafted to the highest quality standards.'),
  const Merch('Power Hoodie', 'assets/power1.jpeg', 'Rp 560.000',
      'Material: Cotton and polyester (depending on different type of hoodie). Each panel is individually printed, cut, and sewn to ensure a flawless graphic with no imperfections. And high definition printing makes these a pleasure to wear for all occasions.'),
];

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: merches
            .map(
              (item) => GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/detail',
                    arguments: item,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(defPad),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: colPrimaryBase,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ItemDisplay(
                    merch: item,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
