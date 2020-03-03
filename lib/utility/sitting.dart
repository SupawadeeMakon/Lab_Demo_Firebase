// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:piwfirebase/utility/iot_model.dart';


// class Setting extends StatefulWidget {
//   @override
//   _SettingState createState() => _SettingState();
// }

// class _SettingState extends State<Setting> {
//   // Field
//   IotModel iotModel;
//   String humHight = '',
//          name = '',
//          temHight = '';

//   final formKey = GlobalKey<FormState>();

//   // Method
//   @override
//   initState() {
//     super.initState();
//     readDatabase();
//   }

//   Future<void> readDatabase() async {
//     FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
//     DatabaseReference databaseReference =
//         firebaseDatabase.reference().child('IoT');
//     await databaseReference.once().then((DataSnapshot dataSnapshot) {
//       setState(() {
//         iotModel = IotModel.formMap(dataSnapshot.value);
//         humHight = iotModel.humidityHigh.toString();
//         temHight = iotModel.tempHigh.toString();
//         name = iotModel.name.toString();
//       });
//     });
//   }

//   Widget humidityHigh() {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
//       child: TextFormField(
//         initialValue: humHight,
//         keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
//         decoration: InputDecoration(
//             helperText: 'Current: $humHight',
//             enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
//             labelText: 'Humidity_High'),
//         onSaved: (String value) {
//           if (value.isNotEmpty) {
//             humHight = value.trim();
//           }
//         },
//       ),
//     );
//   }


//   Widget tempHigh() {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
//       child: TextFormField(
//         initialValue: temHight,
//         keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
//         decoration: InputDecoration(
//             helperText: 'Current: $temHight',
//             enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
//             labelText: 'Temp_High'),
//         onSaved: (String value) {
//           if (value.isNotEmpty) {
//             temHight = value.trim();
//           }
//         },
//       ),
//     );
//   }

//   Widget showName() {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
//       child: TextFormField(
//         initialValue: name,
//         keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
//         decoration: InputDecoration(
//             helperText: 'Current: $name',
//             enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
//             labelText: 'Name'),
//         onSaved: (String value) {
//           if (value.isNotEmpty) {
//             name = value.trim();
//           }
//         },
//       ),
//     );
//   }


//   Widget uploadValue() {
//     return RaisedButton.icon(
//       icon: Icon(Icons.cloud_upload),
//       label: Text('Upload Value'),
//       onPressed: () {
//         formKey.currentState.save();
//         editDatabase();
        
//       },
//     );
//   }

//   Future<void> editDatabase() async {
//     print('hH=$humHight,tH=$temHight,tN=$name');
//     IotModel myIotModel = IotModel (
//       iotModel.mode,
//       iotModel.led1,
//     int.parse(humHight),
//     int.parse(temHight),
//     int.parse(name),);    
    
//     Map map = myIotModel.toMap();
//     print('map=$map');

//     FirebaseDatabase firebaseDatabase =FirebaseDatabase.instance;
//     DatabaseReference databaseReference = firebaseDatabase.reference().child('IoT');
//     await databaseReference.set(map).then((response){
//       readDatabase();
//     });
//   }

//   Widget rowTop() {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         humidityHigh(),
//         SizedBox(
//           width: 8.0,
//         ),
//       ],
//     );
//   }

//   Widget rowMedile() {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         tempHigh(),
//         SizedBox(
//           width: 8.0,
//         ),
        
//       ],
//     );
//   }

//   Widget rowButton() {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         showName(),
//         SizedBox(
//           width: 8.0,
//         ),
        
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
        
//         child: Text('$name'),
        
//       ),
//     );
    
//     // return SingleChildScrollView(
//     //   //สั่งให้ scroll ได้
//     //   child: Container(
//     //     padding: EdgeInsets.only(
//     //       top: 40.0,
//     //     ),
//     //     color: Colors.pink.shade200,
//     //     child: Form(
//     //       key: formKey,
//     //       child: Column(
//     //         children: <Widget>[
//     //           //showName(),
//     //           //rowTop(),
//     //           SizedBox(
//     //             height: 16.0,
//     //           ),
//     //          // rowMedile(),
//     //           SizedBox(
//     //             height: 16.0,
//     //           ),
//     //          // rowButton(),
//     //           SizedBox(
//     //             height: 16.0,
//     //           ),
//     //           uploadValue(),
//     //         ],
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }
