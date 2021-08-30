import 'package:flutter/material.dart';

class MobileRotaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Todays Current Rota')),
          Center(child: Text('Route Details')),
          Center(
            child: Text(
                'Display route details: time in, client name, address, call'),
          )
        ],
      ),
    );
  }
}
