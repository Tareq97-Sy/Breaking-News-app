

import 'package:get/get.dart';

abstract class Dimensions{

 static double screenHeight = Get.height;
  static double screenWidth = Get.width;

  static double pageView = screenHeight/2.28;
  static double pageViewContainer = screenHeight/3.04;
  static double pageViewTextContainer = screenHeight/5.3;
  
  static double height10 = screenHeight/64;
  static double height5 = screenHeight/128;
  static double height15 =screenHeight/42.6;
  static double height20 = screenHeight/32;
  static double height45 = screenHeight/14.2;
  static double height250 = screenHeight/2.65;

  static double width10 = screenWidth/32;
  static double width15 =screenWidth/21.3;
  static double width20 = screenWidth/16;
  static double width45 = screenWidth/7.11;
  static double width7 = screenWidth/45.71;
  static double width100 = screenWidth/6.4;

  static double font20 = screenHeight/32;
  static double font26 = screenHeight/24.61;

  static double raduis20 = screenHeight/32;
  static double raduis35 = screenHeight/18.28;
  static double raduis30 = screenHeight/21.3;
  
  static double iconSize24 = screenHeight/26.6;
  static double iconSize12 = screenHeight/42.6;

  //list view size
  static double listViewImgSize = screenWidth/4;
  //popular food page 
  static double popularImgHeight = screenHeight/3.2;


}