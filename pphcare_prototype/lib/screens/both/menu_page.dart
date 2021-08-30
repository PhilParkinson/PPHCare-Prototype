import 'package:flutter/material.dart';
import 'package:pphcare_prototype/screens/mobile/mobile_home_page.dart';
import 'package:pphcare_prototype/screens/web/web_home_page.dart';
import 'package:pphcare_prototype/services/platform_info.dart';

class MenuPage extends StatelessWidget {
  final bool isWeb = PlatformInfo().isWeb();

  @override
  Widget build(BuildContext context) {
    if (isWeb == true) {
      return WebHomePage();
    } else if (isWeb == false) {
      return MobileHomePage();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
