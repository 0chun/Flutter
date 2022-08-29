import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/home.dart';
import 'package:sample_route_manage/src/pages/normal/first.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second named Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FirstPage()));
                Get.back();
              },
              child: Text('뒤로 이동'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FirstPage()));
                Get.offAllNamed('/');
              },
              child: Text('홈 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
