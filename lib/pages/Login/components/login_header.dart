import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myanimex/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "LOGIN",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset("assets/cmanLogo.png"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
