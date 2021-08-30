import 'package:flutter/material.dart';
import 'package:pphcare_prototype/services/authentication_service.dart';

class MobileProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Profile Page Now Open')),
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: () {
              AuthenticationService().signOut();
            },
            child: Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
