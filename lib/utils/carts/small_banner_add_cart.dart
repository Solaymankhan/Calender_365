/*




import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:velocity_x/velocity_x.dart';

class small_banner_add_cart extends StatelessWidget {
  small_banner_add_cart({Key? key,required this.ad,required this.isBannerAdLoaded,
    required this.isAdClicked,required this.bannerHeight,required this.bannerWidth}) : super(key: key);

  var ad,isBannerAdLoaded,isAdClicked,bannerHeight,bannerWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(isBannerAdLoaded)
          AdWidget(ad: ad),
        if(isAdClicked)
          Container(
            height: bannerHeight,
            width: bannerWidth,
            color: Colors.transparent,
          )
      ],).centered()
        .box.margin(EdgeInsets.only(top:10,bottom: 10))
        .height(isBannerAdLoaded?bannerHeight:0)
        .width(double.infinity).make();
  }
}

*/
