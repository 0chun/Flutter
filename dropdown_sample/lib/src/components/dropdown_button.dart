import 'package:dropdown_sample/src/controller.dart/dropdown_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownButtonWidget extends GetView<DropdownButtonController> {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton(
        value: controller.currentItem.value.index,
        items: DropDownMenu.values
            .map((menu) => DropdownMenuItem(
                  value: menu.index,
                  child: Text(menu.name),
                ))
            .toList(),
        onChanged: (int? value) {
          controller.changeDropDownMenu(value!);
        },
      ),
    );
  }
}
