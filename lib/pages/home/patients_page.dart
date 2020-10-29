import 'package:doctor_helper/pages/home/patient_profile_page.dart';
import 'package:doctor_helper/pages/search/search_page.dart';
import 'package:doctor_helper/widgets/the_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../utils/consts.dart';

class PatientsScreen extends StatefulWidget {
  final Function openDrawer;

  const PatientsScreen({Key key, this.openDrawer}) : super(key: key);

  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Patiens',
        leadingIcon: Icons.sort,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchPage(),
              );
            },
          ),
        ],
        onLeadingIconPressed: widget.openDrawer,
      ),
      body: SingleChildScrollView(
        physics: scrollPhysics,
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                width: size.width * .4,
                height: ScreenUtil().setHeight(50),
                child: Center(
                  child: Text(
                    'Sunday  7/6/2020',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      color: index % 2 == 0 ? Colors.black12 : null,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PatientProfilePage(),
                            ),
                          );
                        },
                        title: Text('Patient name'),
                        subtitle: Text('Patient type'),
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
                          index % 2 == 0
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: index % 2 == 0 ? mainColor : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
