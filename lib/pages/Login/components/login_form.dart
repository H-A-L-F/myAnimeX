import 'package:flutter/material.dart';
import 'package:myanimex/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: colPrimaryBase,
            onSaved: (email) {},
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Your email",
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Padding(
                padding: EdgeInsets.all(defPad),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defPad),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: colPrimaryBase,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Your password",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defPad),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defPad),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
