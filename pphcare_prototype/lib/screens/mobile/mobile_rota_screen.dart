import 'package:flutter/material.dart';
import 'package:pphcare_prototype/widgets/text_information.dart';

class MobileRotaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextInfo(content: 'Todays Current Rota'),
          TextInfo(content: 'Route Details'),
          TextInfo(
              content:
                  'Display route details: time in, client name, address, call')
        ],
      ),
    );
  }
}
