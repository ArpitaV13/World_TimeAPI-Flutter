import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  
  @override
  Widget build(BuildContext context) {
     data=data.isNotEmpty?data: ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage=data['isDayTime']?"day.jpg":"night.jpg";
    print(data);
  
    return  Scaffold(
      
      body:SafeArea(
        
         child:Container(
          decoration:new  BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('$bgImage'),
            fit:BoxFit.cover),
            
          ),
           child: Padding(
             padding: const EdgeInsets.fromLTRB(0,200.0,0,0),
             child: Column(children: 
             [
              ElevatedButton.icon(
                onPressed: ()async {
                  dynamic result=await Navigator.pushNamed(context,'/choose_location');
                  setState(() {
                    data={
                      'time':result['time'],
                      'location':result['location'],
                      'flag':result['flag'],
                      'isDayTime':result['isDayTime'],
                    };
                  });
                }, 
                label:Text('Edit Location'),
                icon:Icon(
                  Icons.edit_location,
                )
                ),
                SizedBox(height:20.0),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                  Text(
                   data!["location"],
                    style:TextStyle(
                      fontSize:40.0,
                      letterSpacing: 2.0,
                      color:Colors.white
                    )
         
                  ),
                  SizedBox(height:20.0),
                  
                ],),
                Text(
                    data!['time'],
                    style:TextStyle(
                      fontSize: 60.0,
                      color:Colors.white,
                    )
                  )
           
             ],),
           ),
         )
      ),
     );
  }
}