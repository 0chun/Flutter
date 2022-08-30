import 'package:get/state_manager.dart';

enum DropDownMenu { DEFAULT, MENI1, MENU2 }

extension DronDownMenuExtension on DropDownMenu {
  String get name {
    switch (this) {
      case DropDownMenu.DEFAULT:
        return '기본메뉴';
      case DropDownMenu.MENI1:
        return '메뉴1';
      case DropDownMenu.MENU2:
        return '메뉴2';
    }
  }
}

class DropdownButtonController extends GetxController {
  Rx<DropDownMenu> currentItem = DropDownMenu.DEFAULT.obs;

  void changeDropDownMenu(int? itemIndex) {
    // var selectedItem =
    //     DropDownMenu.values.where((menu) => menu.index == itemIndex).first;
     var selectedItem =   DropDownMenu.values.elementAt(itemIndex!);
    currentItem(selectedItem);
  }
}
