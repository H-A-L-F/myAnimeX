import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myanimex/pages/Home/components/carousel.dart';

class RealHome extends StatelessWidget {
  const RealHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Carousel(),
      ],
    );
  }
}
