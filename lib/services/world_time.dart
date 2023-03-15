import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class WorldTime{
  String location;
  late String time;
  String flag;
  String url;
  bool isDayTime=false;

  WorldTime({required this.location,required this.flag,required this.url});

    Future<void> getTime() async{

      try{
           Response response= await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map map=jsonDecode(response.body);


    String datetime=map['datetime'];
    String offset_hour=map['utc_offset'].substring(1,3);
    String offset_min=map['utc_offset'].substring(4,);
    

    DateTime now=DateTime.parse(datetime);
    now =now.add(Duration(hours:int.parse(offset_hour),minutes:int.parse(offset_min)));
    print(now);
    
    isDayTime=now.hour>5 && now.hour<18?true:false;
    time=DateFormat.jm().format(now).toString();
    
      }
      catch(e){
        print('error caught');
        time=("Could not fetch data");
      }
   


    

  }
  

 
  
}