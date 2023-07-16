import 'package:calendar_365/utils/carts/holiday_cart.dart';
import 'package:calendar_365/utils/constants/colors.dart';
import 'package:calendar_365/utils/constants/values.dart';
import 'package:calendar_365/utils/lists/holidays_year_wise_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';


class holidays extends StatelessWidget {
  holidays({Key? key}) : super(key: key);
  DateTime today = DateTime.now();
  RxList myBooleanList=List.generate(holiday_year_wise_list.length, (index) => false).obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: holiday_year_wise_list.length,
            itemBuilder: (context,index1){
              bool is_this_year=(today.year==holiday_starting_year+index1);
              return Obx(
                  ()=>
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            color: is_this_year?grey4Color:grey5Color,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                myBooleanList[index1]=!myBooleanList[index1];
                              },
                              child:Text("${holiday_starting_year+index1}",
                                style: TextStyle(
                                    color: is_this_year?tealColor:orangeSolidColor,
                                    fontWeight: is_this_year?FontWeight.bold:FontWeight.w500,
                                    fontSize: myBooleanList[index1]?22:18
                                ),).paddingAll(10).box.width(double.infinity).make(),
                            ),
                          ),
                          if(myBooleanList[index1])
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: holiday_year_wise_list["${holiday_starting_year+index1}"]!.length,
                                shrinkWrap: true,
                                itemBuilder: (context,index2){
                                  return holiday_cart(
                                      index: index2,
                                      image: holiday_year_wise_list["${holiday_starting_year+index1}"]![index2]['image'],
                                      date: holiday_year_wise_list["${holiday_starting_year+index1}"]![index2]['date'],
                                      holiday_for: holiday_year_wise_list["${holiday_starting_year+index1}"]![index2]['holiday_for']);
                                }).marginOnly(left: 10,right: 10,bottom: 10)
                        ],)
                      .box.margin(EdgeInsets.only(top: index1==0?10:0,bottom:3)).make(),
                );

            }),
    );
  }
}
