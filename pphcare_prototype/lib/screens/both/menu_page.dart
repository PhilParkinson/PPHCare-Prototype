import 'package:flutter/material.dart';
import 'package:pphcare_prototype/models/user.dart';
import 'package:pphcare_prototype/screens/mobile/mobile_home_page.dart';
import 'package:pphcare_prototype/screens/web/web_home_page.dart';
import 'package:pphcare_prototype/services/database_service.dart';
import 'package:pphcare_prototype/services/platform_info.dart';

class MenuPage extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => MenuPage());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PPHCareUser>(
        future: DatabaseService().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot<PPHCareUser> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.position == "Manager") {
              return WebHomePage();
            } else if (snapshot.data!.position == "Carer") {
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
        });
  }
}
