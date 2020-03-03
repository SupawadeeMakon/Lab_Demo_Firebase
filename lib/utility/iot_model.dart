class IotModel {
  // Field
  int led1, mode,led2;
  String name;// humidityHigh, tempHigh;
  
  // Constructor
  IotModel(
    this.led1,
    this.led2,
    this.mode,
    this.name,
    //this.humidityHigh,
    //this.tempHigh,
  );

  IotModel.formMap(Map<dynamic, dynamic> map) {
    name = map['name'];
    led1 = map['led1'];
    led2 = map['led2'];
    mode = map['mode'];
    //humidityHigh = map['tempHigh'];
    //tempHigh = map['humHigh'];
  }

  Map<dynamic, dynamic> toMap() {
    final Map<dynamic, dynamic> map = Map<dynamic, dynamic>();
    map['led1'] = led1;
    map['led2'] = led2;
    map['mode'] = mode;
    //map['tempHigh'] = tempHigh;
    //map['humHigh'] = humidityHigh;
    map['name'] = name;

    return map;
  }
}
