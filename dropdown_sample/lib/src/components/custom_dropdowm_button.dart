import 'package:dropdown_sample/src/controller.dart/dropdown_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDowmButton extends StatelessWidget {
  const CustomDropDowmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DropDownList(),
          opaque: false,
          transition: Transition.fadeIn,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Text('기본메뉴'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}

class DropDownList extends GetView<DropdownButtonController> {
  const DropDownList({Key? key}) : super(key: key);

  Widget _dropdownList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: DropDownMenu.values
          .map((menu) => GestureDetector(
                onTap: () {
                  controller.changeDropDownMenu(menu.index);
                  Get.back();
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Text(menu.name),
                    color: controller.currentItem.value.index == menu.index
                        ? Colors.blue[300]
                        : Colors.white),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: GestureDetector(
                onTap: Get.back,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: controller.dropdownPositionY,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Container(
                  color: Colors.white,
                  child: Container(
                    width: Get.size.width,
                    child: _dropdownList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
