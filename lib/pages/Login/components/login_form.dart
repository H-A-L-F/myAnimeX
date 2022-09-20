import 'package:flutter/material.dart';
import 'package:myanimex/constants.dart';
import 'package:myanimex/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  saveUser(String email) async {
    prefs!.setString('email', email);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please provide an email';
              }
              return null;
            },
            controller: emailController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: colPrimaryBase,
            onSaved: (email) {},
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Your username",
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please provide a password';
                }
                if (value.length < 8) {
                  return 'Password must be atleast 8 characters';
                }
                if (!value.contains(RegExp('^[a-zA-Z0-9_]*'))) {
                  return 'Password must be alphanumeric';
                }
                return null;
              },
              controller: passController,
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
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // on success
                saveUser(emailController.text);
                Navigator.of(context).pushNamed(
                  '/home',
                  arguments: emailController.text,
                );
              }
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
