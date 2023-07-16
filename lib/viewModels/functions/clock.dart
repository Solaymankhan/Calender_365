import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class clock extends StatelessWidget {
  clock({Key? key,required this.size,required this.color,required this.weight}) : super(key: key);
  var size,color,weight;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: Stream.periodic(Duration(seconds: 1), (_) => DateTime.now()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DateTime? currentTime = snapshot.data;
          String timeString = DateFormat('hh:mm:ss a').format(currentTime!);
          return Text(
            timeString,
            style: TextStyle(
              color: color,
                fontWeight: weight,
                fontSize: size),
          );
        } else {
          return Text('Loading...',
              style: TextStyle(
                  color: color,
                  fontWeight: weight,
                  fontSize: size));
        }
      },
    );
  }
}