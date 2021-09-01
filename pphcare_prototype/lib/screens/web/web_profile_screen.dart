import 'package:flutter/material.dart';
import 'package:pphcare_prototype/main.dart';
import 'package:pphcare_prototype/services/authentication_service.dart';

class WebProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Container(
          child: Column(
            children: [
              Center(child: Text('Profile Page Now Open')),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    AuthenticationService().signOut();
                    Navigator.pushReplacement(context, PPHCareApp.route());
                  },
                  child: Text('Sign Out'),
                ),
              )
            ],
          ),
        ));
  }
}
