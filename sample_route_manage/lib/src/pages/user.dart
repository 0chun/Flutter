import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/home.dart';
import 'package:sample_route_manage/src/pages/normal/first.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${Get.parameters['uid']}'),
            Text('${Get.parameters['name']}님 하이'),
            Text('${Get.parameters['age']}'),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FirstPage()));
                Get.back();
              },
              child: Text('뒤로 이동'),
            ),
          
          ],
        ),
      ),
    );
  }
}
