import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pphcare_prototype/models/care_plan.dart';
import 'package:pphcare_prototype/models/care_plan_tasks.dart';
import 'package:pphcare_prototype/models/client.dart';
import 'package:pphcare_prototype/models/record_of_care.dart';
import 'package:pphcare_prototype/screens/mobile/care_plan_carer_view.dart';
import 'package:pphcare_prototype/services/database_service.dart';
import 'package:pphcare_prototype/widgets/text_information.dart';

class CarePlanTasksCarerView extends StatelessWidget {
  final PPHCareClient client;
  final CarePlan carePlan;
  final RecordOfCare dailyRecord;
  final CallRecord callRecord;

  CarePlanTasksCarerView(
      {required this.client,
      required this.carePlan,
      required this.dailyRecord,
      required this.callRecord});

  List<CarePlanTask> _carePlanTasks = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DatabaseService().getCarePlanTasks(client.uid, carePlan.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            snapshot.data!.docs.forEach((element) {
              // _carePlanTasks.add(CarePlanTask.fromJSON(element));
              _carePlanTasks.add(CarePlanTask(
                  uid: element.get('uid'),
                  order: element.get('order') as int,
                  description: element.get('description'),
                  medication: element.get('medication') as bool));
              _carePlanTasks.sort((a, b) => a.order.compareTo(b.order));
            });
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(8),
              itemCount: _carePlanTasks.length,
              itemBuilder: (BuildContext context, int index) {
                return CarePlanTaskListTile(
                    task: _carePlanTasks[index],
                    client: client,
                    recordOfCare: dailyRecord);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

class CarePlanTaskListTile extends StatefulWidget {
  final CarePlanTask task;
  final PPHCareClient client;
  final RecordOfCare recordOfCare;

  const CarePlanTaskListTile(
      {required this.task, required this.client, required this.recordOfCare});

  @override
  _CarePlanTaskListTileState createState() => _CarePlanTaskListTileState();
}

class _CarePlanTaskListTileState extends State<CarePlanTaskListTile> {
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order number: ${widget.task.order.toString()}',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                'Task Description: ${widget.task.description}',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Checkbox(
              value: _isDone,
              onChanged: (value) {
                setState(() {
                  if (_isDone) {
                    _isDone = false;
                    widget.recordOfCare
                        .removeTaskFromCompletedList(widget.task);
                  } else {
                    _isDone = true;
                    widget.recordOfCare.addCompletedTask(widget.task);
                  }
                });
              })
        ],
      ),
    );
  }
}
