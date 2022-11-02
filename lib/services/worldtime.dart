import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location = '';
  String time = '';
  String url = '';
  String flag = '';
  bool isDaytime = true;

  WorldTime(String location, String url, String flag){
    this.location = location;
    this.url = url;
    this.flag = flag;
  }

  Future<void> getTime() async {

    try {

      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map datafetched = jsonDecode(response.body);
      // get data
      String datetime = datafetched['datetime'];
      String offset = datafetched['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}