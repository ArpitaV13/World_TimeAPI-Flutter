import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../services/world_time.dart';

class choose_location extends StatefulWidget {
  const choose_location({super.key});

  @override
  State<choose_location> createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {

  List<WorldTime> locations=[
    WorldTime(location: 'Berlin', flag: 'greece.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Adidjan', flag: 'africa.png', url: 'Africa/Abidjan'),
    WorldTime(location: 'Anchorage', flag: 'usa.png', url: 'America/Anchorage'),
    WorldTime(location: 'Adak', flag: 'usa.png', url: 'America/Adak'),
    WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata')

  ];

  void updateTime(index) async{
    WorldTime instance =locations[index];
    await instance.getTime();
    Navigator.pop(context,{
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDayTime':instance.isDayTime,
   });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
       
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:5.0,horizontal:0),
            child: Card(
               
              child:ListTile(
                
                onTap: (){
                  updateTime(index);
                },
                title:Text(locations[index].location),
              )
            ),
          );
        },
      )
    );
  }
}