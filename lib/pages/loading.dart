import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/services/worldtime.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void Setworldtime() async {
    WorldTime default_instance = WorldTime('Berlin', 'Europe/Berlin', 'germany.png');
    await default_instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : default_instance.location,
      'url': default_instance.url,
      'flag': default_instance.flag,
      'isDaytime': default_instance.isDaytime,
      'time': default_instance.time,
    } );
  }

  @override
  void initState() {
    super.initState();
    Setworldtime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF090805),
      body: SafeArea(
        child: SpinKitFoldingCube(
          color: Colors.pink[400],
          size: 80.0,
        ),
      ),
    );
  }
}
