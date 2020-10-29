import 'package:doctor_helper/widgets/the_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../utils/consts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        title: 'Profile',
        leadingIcon: Icons.arrow_back,
        context: context,
      ),
      body: SingleChildScrollView(
        physics: scrollPhysics,
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  decoration: new BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: mainColor,
                    ),
                    borderRadius: new BorderRadius.all(
                      Radius.circular(100.0),
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                      'assets/images/male.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(25),
              ),
              ListTile(
                leading: Icon(
                  Icons.text_fields,
                ),
                title: Text('Name'),
                subtitle: Text(
                  'Mina 3atef',
                  style: TextStyle(color: mainColor),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.merge_type,
                ),
                title: Text('Gender'),
                subtitle: Text(
                  'Male',
                  style: TextStyle(color: mainColor),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                ),
                title: Text('Location'),
                subtitle: Text(
                  '35.41565,   57.156441',
                  style: TextStyle(color: mainColor),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.calendar_today,
                ),
                title: Text('Works days'),
                subtitle: Text(
                  'Satarday, Sunday, Monday',
                  style: TextStyle(color: mainColor),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.phone,
                ),
                title: Text('Phone'),
                subtitle: Text(
                  '01xxxxxxxxx',
                  style: TextStyle(color: mainColor),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.lock,
                ),
                title: Text('Password'),
                subtitle: Text(
                  'xxxxxxxxxxxxx',
                  style: TextStyle(color: mainColor),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
