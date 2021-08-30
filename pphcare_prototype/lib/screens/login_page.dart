import 'package:flutter/material.dart';
import 'package:pphcare_prototype/screens/menu_page.dart';
import 'package:pphcare_prototype/services/authentication_service.dart';
import 'package:pphcare_prototype/services/validator.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  late FocusNode _focusEmail = FocusNode();
  late FocusNode _focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Philip Parkinson Homecare, LogIn'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailTextController,
                  focusNode: _focusEmail,
                  validator: (value) => Validator.validateEmail(email: value!),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  controller: _passwordTextController,
                  focusNode: _focusPassword,
                  obscureText: true,
                  validator: (value) =>
                      Validator.validatePassword(password: value!),
                ),
                SizedBox(height: 8.0),
                Container(
                  height: 60,
                  width: 200,
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        print("Log In Pressed");
                        if (_formKey.currentState!.validate()) {
                          print("Current State is Validated");
                          if (await AuthenticationService()
                                  .signInUsingEmailPassword(
                                      email: _emailTextController.text.trim(),
                                      password: _passwordTextController.text
                                          .trim()) ==
                              "Signed In") {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MenuPage()),
                            );
                          }
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
