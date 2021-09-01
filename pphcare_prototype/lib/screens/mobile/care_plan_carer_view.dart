import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pphcare_prototype/models/care_plan.dart';
import 'package:pphcare_prototype/models/care_plan_tasks.dart';
import 'package:pphcare_prototype/models/client.dart';
import 'package:pphcare_prototype/models/record_of_care.dart';
import 'package:pphcare_prototype/screens/both/menu_page.dart';
import 'package:pphcare_prototype/screens/mobile/care_tasks_carer_view.dart';
import 'package:pphcare_prototype/screens/mobile/mobile_home_page.dart';
import 'package:pphcare_prototype/screens/mobile/mobile_home_screen.dart';
import 'package:pphcare_prototype/services/authentication_service.dart';
import 'package:pphcare_prototype/services/database_service.dart';
import 'package:pphcare_prototype/widgets/text_information.dart';

class CarePlanCarerView extends StatelessWidget {
  PPHCareClient currentClient;
  CarePlanCarerView({required this.currentClient});

  RecordOfCare DRS = RecordOfCare(
      tasksCompleted: [],
      uid: UniqueKey().toString(),
      callLenght: 0,
      callUid: UniqueKey().toString());

  CallRecord? callRecord;

  @override
  Widget build(BuildContext context) {
    createCallRecord();
    return Container(
        child: StreamBuilder(
      stream: DatabaseService().getCarePlanInfoForClient(currentClient.uid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          CarePlan carePlan = CarePlan.fromJSON(snapshot);
          return Column(
            children: [
              TextInfo(content: carePlan.call),
              TextInfo(content: carePlan.length.toString()),
              TextInfo(content: carePlan.carers.toString()),
              CarePlanTasksCarerView(
                client: currentClient,
                carePlan: carePlan,
                callRecord: callRecord!,
                dailyRecord: DRS,
              ),
              ElevatedButton(
                  onPressed: () {
                    checkOutButtonPressed(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextInfo(content: 'Check Out'),
                  ))
            ],
          );
        }
      },
    ));
  }

  void createCallRecord() async {
    User? currentCarer = await AuthenticationService().getCurrentUser();
    if (currentCarer != null) {
      callRecord = await CallRecord(
          uid: DRS.callUid,
          arrivalTime: DateTime.now(),
          carerUid: currentCarer.uid,
          clientUid: currentClient.uid,
          drsUid: DRS.uid);
    }
  }

  void checkOutButtonPressed(BuildContext context) {
    print('Check Out Pressed');
    callRecord!.updateCallRecord(DateTime.now());
    print(DRS.tasksCompleted.length);
    print(callRecord!.callLength);
    Navigator.pushReplacement(context, MenuPage.route());
  }
}
