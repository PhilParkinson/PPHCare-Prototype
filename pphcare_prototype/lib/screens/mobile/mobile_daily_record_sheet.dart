import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pphcare_prototype/models/care_plan.dart';
import 'package:pphcare_prototype/models/client.dart';
import 'package:pphcare_prototype/screens/mobile/care_plan_carer_view.dart';
import 'package:pphcare_prototype/services/database_service.dart';

class MobileDailyRecordScren extends StatelessWidget {
  final String clientUid;
  MobileDailyRecordScren({required this.clientUid});

  PPHCareClient? currentClient;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DatabaseService().getClientFromQRCode(clientUid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Loading'),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            currentClient = PPHCareClient.fromJSON(snapshot);
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                      currentClient!.firstName + ' ' + currentClient!.lastName),
                ),
                body: CarePlanCarerView(currentClient: currentClient!));
          }
        });
  }
}
