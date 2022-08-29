import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:youtube_clone_app/src/app.dart';
import 'package:youtube_clone_app/src/binding/init_binding.dart';
import 'package:youtube_clone_app/src/components/youtube_detail.dart';
import 'package:youtube_clone_app/src/controller/youtube_detail_controller.dart';
import 'package:youtube_clone_app/src/controller/youtube_search_controller.dart';
import 'package:youtube_clone_app/src/pages/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.blue),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialBinding: InitBinding(),
      initialRoute: '/',
      // theme: ThemeData(
      //     primaryColor: Colors.white,
      //     primarySwatch: Colors.blue,
      //     visualDensity: VisualDensity.adaptivePlatformDensity),
      getPages: [
        GetPage(name: '/', page: () => App()),
        GetPage(
          name: '/detail/:videoId',
          page: () => YoutubeDetail(),
          binding: BindingsBuilder(
            () => Get.lazyPut<YoutubeDetailController>(
                () => YoutubeDetailController()),
          ),
        ),GetPage(
          name: '/search',
          page: () => YoutubeSearch(),
          binding: BindingsBuilder(
            () => Get.lazyPut<YoutubeSearchController>(
                () => YoutubeSearchController()),
          ),
        )
      ],
    );
  }
}
