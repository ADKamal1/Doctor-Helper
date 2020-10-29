import 'package:doctor_helper/pages/add_case/add_case_page.dart';
import 'package:doctor_helper/widgets/the_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../utils/consts.dart';

class PatientProfilePage extends StatefulWidget {
  @override
  _PatientProfileState createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
          title: 'Patient Profile',
          leadingIcon: Icons.arrow_back,
          context: context,
          actions: [
            Container(
              color: mainColor,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AddCasePage(),
                    ),
                  );
                },
                child: Text(
                  'Add Case',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]),
      body: ListView(
        physics: scrollPhysics,
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Card(
            color: Color(0xffF2EFEA),
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(18),
            ),
            elevation: 8,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(16),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    'Patient Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Name',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Abanoub Fakhery',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Gender',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Male',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Height',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '179 cm',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Weight',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '62 kg',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Code',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'xxxxxxxxxxxxxxxxxxxxx',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),
          Center(
            child: Text(
              'Patient history',
              style: TextStyle(
                color: mainColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width,
              maxHeight: size.height * 30,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 18,
              itemBuilder: (context, index) {
                return historyItem(size);
              },
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
        ],
      ),
    );
  }

  Widget historyItem(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(8),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(5),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: mainColor,
        ),
      ),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: mainColor.withOpacity(.6),
                borderRadius: BorderRadius.circular(8),
              ),
              width: size.width * .4,
              height: ScreenUtil().setHeight(30),
              child: Center(
                child: Text(
                  'Sunday  7/6/2020',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15),
          ),
          Text(
            'The indication',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15),
          ),
          Text(
            'The treatment',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
        ],
      ),
    );
  }
}
