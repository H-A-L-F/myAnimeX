import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myanimex/constants.dart';
import 'package:myanimex/pages/Home/components/carousel.dart';

class RealHome extends StatelessWidget {
  const RealHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Carousel(),
        const SizedBox(height: defPad),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: defPad),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colPrimaryContent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: defPad, vertical: defPad),
                child: Text(
                  'About Us',
                  style: TextStyle(
                    color: colPrimaryDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: defPad, vertical: defPad),
                child: Text(
                  'Chainsaw Man Store has the largest range of high quality. With a wide variety of products with unique designs, and especially limited products only at Chainsaw Man Store !',
                  style: TextStyle(
                    color: colPrimaryBase,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
