import 'package:flutter/material.dart';
import 'package:pphcare_prototype/screens/mobile/mobile_home_screen.dart';
import 'package:pphcare_prototype/screens/mobile/mobile_profile_screen.dart';
import 'package:pphcare_prototype/screens/mobile/mobile_rota_screen.dart';
import 'package:pphcare_prototype/screens/mobile/mobile_scanner_screen.dart';

class MobileHomePage extends StatefulWidget {
  MobileHomePage();

  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  int _selectedDestination = 0;
  String _title = 'Home';
  Widget _pageToDisplay = Center(child: Text('This is the home screen'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/PPHCare_logo_c.png'),
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                selected: _selectedDestination == 0,
                onTap: () => selectDestination(
                      0,
                      'Home',
                      MobileHomeScreen(),
                    )),
            ListTile(
                leading: Icon(Icons.qr_code),
                title: Text('Scanner'),
                selected: _selectedDestination == 1,
                onTap: () =>
                    selectDestination(1, 'Scanner', MobileScannerScreen())),
            ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Rota'),
                selected: _selectedDestination == 2,
                onTap: () => selectDestination(
                      2,
                      'Rota',
                      MobileRotaScreen(),
                    )),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              selected: _selectedDestination == 3,
              onTap: () => selectDestination(
                3,
                'Profile',
                MobileProfileScreen(),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _pageToDisplay,
    );
  }

  void selectDestination(int index, String title, Widget page) {
    setState(() {
      _selectedDestination = index;
      _pageToDisplay = page;
      _title = title;
    });
  }
}
