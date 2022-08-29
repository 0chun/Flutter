import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'GetX',
            style: TextStyle(fontSize: 50),
          ),
          GetBuilder<CountControllerWithGetx>(
            id: 'fitst',
            builder: (controller) {
              return Text(
                '${controller.count}',
                style: TextStyle(fontSize: 50),
              );
            },
          ),
          GetBuilder<CountControllerWithGetx>(
            id: 'second',
            builder: (controller) {
              return Text(
                '${controller.count}',
                style: TextStyle(fontSize: 50),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerWithGetx>().increase('fitst');
            },
            child: const Text(
              '+',
              style: TextStyle(fontSize: 30),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerWithGetx>().increase('second');
            },
            child: const Text(
              '+',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
