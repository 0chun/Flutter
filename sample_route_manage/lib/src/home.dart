// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/pages/normal/first.dart';
import 'package:sample_route_manage/src/pages/reactive_state_manage_page.dart';
import 'package:sample_route_manage/src/pages/simple_state_manage_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('라우트 관리 홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FirstPage()));
                Get.to(FirstPage());
              },
              child: Text('일반적인 라우트'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FirstPage()));
                Get.toNamed('/first');
              },
              child: Text('Named 라우트'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FirstPage()));
                Get.toNamed('/next', arguments: '나나나');
              },
              child: Text('Arguments 전달'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FirstPage()));
                Get.toNamed('/user/28357?name=니니&age=22');
              },
              child: Text('동적 url'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FirstPage()));
                Get.to(SimpleStateManagePage());
              },
              child: Text('단순상태관리'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FirstPage()));
                Get.to(ReactiveStateManagePage());
              },
              child: Text('반응형상태관리'),
            ),
          ],
        ),
      ),
    );
  }
}
