import 'package:flutter/material.dart';
import 'package:pphcare_prototype/main.dart';
import 'package:pphcare_prototype/screens/both/login_page.dart';
import 'package:pphcare_prototype/services/authentication_service.dart';
import 'package:pphcare_prototype/widgets/text_information.dart';

class MobileProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextInfo(content: 'Profile Page Now Open'),
          // ignore: deprecated_member_use
          ElevatedButton(
            onPressed: () {
              AuthenticationService().signOut();
              Navigator.pushReplacement(context, PPHCareApp.route());
            },
            child: Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
