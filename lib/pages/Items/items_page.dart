import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myanimex/constants.dart';

class Merch {
  final String name;
  final String image;
  final String price;

  const Merch(
    this.name,
    this.image,
    this.price,
  );
}

final List<Merch> merches = [
  const Merch('Reze T-Shirt', 'assets/reze1.jpg', 'Rp 225.000'),
  const Merch('Makima Poster', 'assets/makima1.jpg', 'Rp 420.000'),
  const Merch('Power Hoodie', 'assets/power1.jpeg', 'Rp 560.000'),
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
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: colPrimaryBase,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(item.image,
                            fit: BoxFit.fill, width: 1000.0),
                      ),
                      Container(
                        child: Text(
                          item.name,
                          style: const TextStyle(),
                        ),
                      ),
                      Container(
                        child: Text(
                          item.price,
                          style: const TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
