/*


import 'package:calendar_365/viewModels/helpers/adUnit_platform_helper.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class home_page_adds extends GetxController{


  late BannerAd topBannerAd,bottomBannerAd;
  RxBool isTopBannerAdLoaded=false.obs,
         isTopAdClicked=false.obs,
      isBottomBannerAdLoaded=false.obs,
      isBottomAdClicked=false.obs;

  @override
  void onInit() {
    */
/*
    _createhomeBottomBannerAd();
    _createhomeTopBannerAd();*//*

    super.onInit();
  }

  void _createhomeTopBannerAd(){
    topBannerAd= BannerAd(
      size: AdSize.banner,
      adUnitId: adUnit_platform_helper.bannerAdUnitId,
      request: AdRequest(),
      listener: BannerAdListener(
          onAdLoaded: (_){
            isTopBannerAdLoaded.value=true;
            isTopAdClicked.value=false;
            print("add_is_loaded");
          },
          onAdFailedToLoad: (ad,error){
            print("Faied to load");
            ad.dispose();
          },
          onAdClicked: (_){
            isTopAdClicked.value=true;
            print("add_is_clicked");
          },
          onAdImpression: (_){
            print("add_is_onAdImpression");
          },
          onAdOpened: (_){
            print("add_is_opened");
          }
      ),
    );
    topBannerAd.load();
  }

  void _createhomeBottomBannerAd(){
    bottomBannerAd= BannerAd(
      size: AdSize.banner,
      adUnitId: adUnit_platform_helper.bannerAdUnitId,
      request: AdRequest(),
      listener: BannerAdListener(
          onAdLoaded: (_){
            isBottomBannerAdLoaded.value=true;
            isBottomAdClicked.value=false;
            print("add_is_loaded");
          },
          onAdFailedToLoad: (ad,error){
            print("Faied to load");
            ad.dispose();
          },
          onAdClicked: (_){
            isBottomAdClicked.value=true;
            print("add_is_clicked");
          },
          onAdImpression: (_){
            print("add_is_onAdImpression");
          },
          onAdOpened: (_){
            print("add_is_opened");
          }
      ),
    );
    bottomBannerAd.load();
  }


}*/
