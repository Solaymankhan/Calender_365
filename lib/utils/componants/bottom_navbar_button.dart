import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

BottomNavigationBarItem bottom_navbar_button(icon,icon_size,button_color,label_txt){
  return BottomNavigationBarItem(
      icon: Icon(icon,size: icon_size).box.roundedFull.padding(EdgeInsets.all(10))
          .color(button_color).make(), label: label_txt);
}