import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/src/binding/init_binding.dart';
import 'package:youtube_clone_app/src/components/youtube_bottom_sheet.dart';

class AppController extends GetxService{
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    if(RouteName.values[index] == RouteName.Add) {
      _showBottomSheet();
    } else {
      currentIndex(index);
    }    
  }

  void _showBottomSheet(){
    Get.bottomSheet(YoutubeBottomSheet());
  }
}