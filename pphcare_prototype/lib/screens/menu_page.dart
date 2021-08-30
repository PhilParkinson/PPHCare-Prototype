import 'package:flutter/material.dart';
import 'package:pphcare_prototype/services/platform_info.dart';
import 'package:pphcare_prototype/widgets/side_drawer.dart';

class MenuPage extends StatefulWidget {
  late bool isWeb;

  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => MenuPage());

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late bool _isWeb;
  int _selectedDestination = 0;

  @override
  void initState() {
    _isWeb = PlatformInfo().isWeb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (_isWeb == true) {
      return Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(
          title: Text('Menu Web'),
        ),
        body: Center(
          child: Text('Side Menu Tutorial'),
        ),
      );
    } else if (_isWeb == false) {
      return Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(
          title: Text('Menu Mobile'),
        ),
        body: Center(
          child: Text('Side Menu Tutorial'),
        ),
      );
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

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
