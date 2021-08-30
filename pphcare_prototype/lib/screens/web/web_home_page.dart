import 'package:flutter/material.dart';
import 'package:pphcare_prototype/screens/web/web_profile_screen.dart';

class WebHomePage extends StatefulWidget {
  WebHomePage();

  @override
  _WebHomePageState createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  int _selectedDestination = 0;
  String _title = 'Home';
  Widget _pageToDisplay = WebProfileScreen();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Image.asset('assets/PPHCare_logo_c.png'),
              ),
              ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Home'),
                  selected: _selectedDestination == 0,
                  onTap: () => selectDestination(
                        0,
                        'Home',
                        Center(
                          child: Text('this is the home screen'),
                        ),
                      )),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Staff'),
                selected: _selectedDestination == 1,
                onTap: () => selectDestination(
                    1,
                    'Staff',
                    Center(
                      child: Text('this is the staff screen'),
                    )),
              ),
              ListTile(
                leading: Icon(Icons.label),
                title: Text('Clients'),
                selected: _selectedDestination == 2,
                onTap: () => selectDestination(
                    2,
                    'Clients',
                    Center(
                      child: Text('this is the clients screen'),
                    )),
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text('Routes'),
                selected: _selectedDestination == 3,
                onTap: () => selectDestination(
                    3,
                    'Routes',
                    Center(
                      child: Text('this is the routes screen'),
                    )),
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text('Rota'),
                selected: _selectedDestination == 4,
                onTap: () => selectDestination(
                    4,
                    'Rota',
                    Center(
                      child: Text('this is the rota screen'),
                    )),
              ),
              ListTile(
                  leading: Icon(Icons.bookmark),
                  title: Text('Profile'),
                  selected: _selectedDestination == 5,
                  onTap: () => selectDestination(
                        5,
                        'Profile',
                        WebProfileScreen(),
                      )),
            ],
          ),
        ),
        VerticalDivider(
          width: 1,
          thickness: 1,
        ),
        Expanded(
          child: _pageToDisplay,
        ),
      ],
    );
  }

  void selectDestination(int index, String title, Widget page) {
    setState(() {
      _selectedDestination = index;
      _title = title;
      _pageToDisplay = page;
    });
  }
}
