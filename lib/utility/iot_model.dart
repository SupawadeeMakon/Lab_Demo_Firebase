class IotModel {
  // Field
  int led1,
      mode;

  // Constructor
  IotModel(
      this.led1,
      this.mode);

      IotModel.formMap(Map<dynamic, dynamic> map){
        led1 = map['led1'];
        mode = map['mode'];
      }

      Map<dynamic,dynamic> toMap(){
        final Map<dynamic,dynamic> map = Map<dynamic,dynamic>();
        map['led1']=led1;
        
        map['mode']=mode;


        return map;

      }
}