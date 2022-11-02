import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime('London', 'Europe/London','uk.png'),
    WorldTime('Berlin', 'Europe/Berlin','germany.png'),
    WorldTime('Athens', 'Europe/Berlin', 'greece.png'),
    WorldTime('Cairo', 'Africa/Cairo', 'egypt.png'),
    WorldTime('Nairobi', 'Africa/Nairobi',  'kenya.png'),
    WorldTime('Chicago', 'America/Chicago',  'usa.png'),
    WorldTime('New York', 'America/New_York',  'usa.png'),
    WorldTime('Seoul', 'Asia/Seoul',  'south_korea.png'),
    WorldTime('Jakarta', 'Asia/Jakarta',  'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pushNamed(context, '/home', arguments: {
      'location': instance.location,
      'url': instance.url,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
        centerTitle: true,
        backgroundColor: Color(0xFF1e135f),
      ),

      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar( // here comes the image
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
