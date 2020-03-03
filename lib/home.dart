import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:piwfirebase/utility/iot_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool modeBool = false, led1Bool = false;
  int modeInt = 0, led1Int = 0,led2Int=0;
  String textname,led2="Status";
  IotModel iotModel;

  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  @override //run ก่อน buil 2ก้าว
  void initState() {
    super.initState();
    readData();
    // print('Read Data Work');
  }

  Future<void> readData() async {
    print('Read Data Work');

    DatabaseReference databaseReference =
        firebaseDatabase.reference().child('IoT');
    await databaseReference.once().then((DataSnapshot dataSnapshot) {
      //print('Data=>${dataSnapshot.value}');

      print('dataSnapshot = ${dataSnapshot.value}');
      iotModel = IotModel.formMap(dataSnapshot.value);

      /*อ่านค่าจากFirebase มาเก็บในตัวแปร*/
      modeInt = iotModel.mode;
      led1Int = iotModel.led1;
      led2Int = iotModel.led2;
      textname = iotModel.name;
      checkSwitch();
    });
  }

  Future<void> editDatabase() async {
    //ฟังก์ชันโยนค่าขึ้นFirebase

    print('mode=$modeBool');
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference =
        firebaseDatabase.reference().child('IoT');

    Map<dynamic, dynamic> map = Map();
    map['mode'] = modeInt;
    map['led1'] = led1Int;
    map['led2'] = led2Int;

    //โยนขึ้น Firebase
    await databaseReference.set(map).then((response) {
      print('Edit Success');
    });
  }

  void checkSwitch() {
    setState(() {
      if (iotModel.mode == 0) {
        modeBool = false;
      } else {
        modeBool = true;
      }

      if (iotModel.led1 == 0) {
        led1Bool = false;
      } else {
        led1Bool = true;
      }
    });
    print('mode=$modeBool,led1=$led1Bool');
  }

  Widget switchMode() {
    return Container(
      child: Card(
        color: Colors.red.shade300,
        //ใส่กรอบให้switch
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            //เรียงตัวจากบนลงล่าง
            children: <Widget>[
              Text('Mode'),
              Row(
                //เรียงตัวซ้ายไปขวา
                children: <Widget>[
                  Text('Auto'),
                  Switch(
                    value: modeBool,
                    onChanged: (bool value) {
                      changeModeBool(value);
                    },
                  ),
                  Text('Manual')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget switchLed1() {
    return Container(
      child: Card(
        color: Colors.yellow.shade600,
        //ใส่กรอบให้switch
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            //เรียงตัวจากบนลงล่าง
            children: <Widget>[
              Text('Led1'),
              Row(
                //เรียงตัวซ้ายไปขวา
                children: <Widget>[
                  Text('off'),
                  Switch(
                    value: led1Bool,
                    onChanged: (bool value) {
                      changeLed1Bool(value);
                    },
                  ),
                  Text('on')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonLed2(){
    return Container(
        padding: new EdgeInsets.all(32.0),
        child: SizedBox(
                  height: 100,
                  width: 300, // specific value
                  child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: () {
                        
                        setState(() {
                            led2Int = led2Int;
                            if (led2Int==0) {
                            led2Int = 1;
                            led2="ON";
                            } else {
                            led2Int = 0;
                            led2="OFF";
                            }
                            print('$led2Int');
                          editDatabase();
                      });
                      },
                      icon: Icon(Icons.ac_unit),
                      label: Text('LED2:$led2'))),
      );
    
  }    
  

  void changeModeBool(bool value) {
    setState(() {
      modeBool = value;
      if (modeBool) {
        modeInt = 1;
      } else {
        modeInt = 0;
      }
      editDatabase();
    });
  }

  void changeLed1Bool(bool value) {
    setState(() {
      led1Bool = value;
      if (led1Bool) {
        led1Int = 1;
      } else {
        led1Int = 0;
      }

      editDatabase();
    });
  }

  
  Widget modeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[switchMode()],
    );
  }

  Widget topRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[switchLed1()],
    );
  }

  Widget bottonRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[buttonLed2()],
    );
  }

  Widget showText() {
    return Center(
      child: Container(
        
        child: Text('$textname'),
        
      ),
    );
  }

  

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //ใส่สีbackgroud
          gradient: RadialGradient(
        colors: [Colors.white, Colors.pink.shade200],
        radius: 1.0, //การกระจายสี
      )),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            showText(), modeRow(), topRow(), bottonRow()],
        ),
      ),
    );
  }
}
