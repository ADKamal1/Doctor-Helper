import 'package:doctor_helper/pages/home/patient_profile_page.dart';
import 'package:doctor_helper/widgets/the_app_bar.dart';
import 'package:flutter/material.dart';

import '../../utils/consts.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        title: 'History',
        leadingIcon: Icons.arrow_back,
        context: context,
      ),
      body: ListView.separated(
        physics: scrollPhysics,
        separatorBuilder: (context, index) {
          return Divider(
            color: mainColor,
            indent: 10,
            height: 40,
            endIndent: 10,
            thickness: 1.5,
          );
        },
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => PatientProfilePage(),
                ),
              );
            },
            title: Text('Patient name'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Patient type'),
                Text('Sunday 7/6/2020'),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('170 cm'),
                Text('70 kg'),
                Text('36 years'),
              ],
            ),
            leading: Icon(
              Icons.visibility,
              color: mainColor,
            ),
          );
        },
      ),
    );
  }
}
