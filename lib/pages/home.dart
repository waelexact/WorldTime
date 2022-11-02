import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/night.jpg'),
          fit: BoxFit.cover,
      )
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // link to choose location
              Container(
                padding: EdgeInsets.all(30.0),
                child: TextButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/chooselocation');
                    },
                  icon: Icon(
                      Icons.add,
                    color: Colors.grey[200],
                    size: 15.0,
                  ),
                  label: Text(
                    'Choose another location',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              // showing selected data
              Center(
                child: Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey[300],
                  ),
                ),
              ),

              Center(
                  child: Image.asset(
                        'assets/${data['flag']}',
                        width: 20,
                        height: 17,
                        fit:BoxFit.fill
                    ),
                  ),

              SizedBox(height: 30.0),

              Center(
                child: Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 55.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
