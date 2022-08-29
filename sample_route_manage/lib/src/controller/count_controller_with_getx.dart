import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class CountControllerWithGetx extends GetxController{
  int count = 0;
  void increase(String id) {
    count++;
    update([id]);
  }
}