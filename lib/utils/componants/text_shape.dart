import 'package:flutter/material.dart';


class text_shape extends StatelessWidget {
  text_shape({Key? key,required this.text,required this.txt_color,required this.txt_weight
  ,required this.txt_size}) : super(key: key);
  var text,txt_color,txt_weight,txt_size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: txt_color,
          fontWeight: txt_weight,
          fontSize: txt_size),
    );
  }
}
