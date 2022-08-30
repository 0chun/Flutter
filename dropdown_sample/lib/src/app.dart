import 'package:dropdown_sample/src/components/dropdown_button.dart';
import 'package:dropdown_sample/src/controller.dart/dropdown_button_controller.dart';
import 'package:dropdown_sample/src/pages/default_page.dart';
import 'package:dropdown_sample/src/pages/page1.dart';
import 'package:dropdown_sample/src/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends GetView<DropdownButtonController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDown Sample'),
      ),
      body: Column(
        children: [
          // DropdownButtonWidget(),
          Expanded(
            child: Center(
              child: Obx(
                (() {
                  switch (controller.currentItem.value) {
                    case DropDownMenu.DEFAULT:
                      return DefaultPage();
                    case DropDownMenu.MENI1:
                      return Page1();
                    case DropDownMenu.MENU2:
                      return Page2();
                  }
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
