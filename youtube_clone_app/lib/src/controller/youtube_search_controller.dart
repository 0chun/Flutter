import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_clone_app/src/models/youtube_video_result.dart';
import 'package:youtube_clone_app/src/repository/youtube_repository.dart';

class YoutubeSearchController extends GetxController {
  String key = 'SearchKey';
  RxList<String> history = RxList<String>.empty(growable: true);
  // RxList<String> history = [''].obx;
  late SharedPreferences profs;
  ScrollController scrollController = ScrollController();
  late String _currnetKeyword;
  Rx<YoutubeVideoResult> youtubeVideoResult = YoutubeVideoResult(items: []).obs;

  @override
  void onInit() async {
    _event();
    profs = await SharedPreferences.getInstance();
    List<dynamic> initData = (profs.get(key) ?? []) as List<dynamic>;
    history(initData.map((e) => e.toString()).toList());

    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // print(scrollController.position.pixels);
        // print(youtubeResult.value.nextPagetoken);
        _searchYoutube(_currnetKeyword);
      }
    });
  }

  void search(String searchKey) {
    history.addIf(!history.contains(searchKey), searchKey);
    profs.setStringList(key, history);
    _currnetKeyword = searchKey;
    _searchYoutube(searchKey);
  }

  void _searchYoutube(String searchKey) async {
    YoutubeVideoResult? youtubeVideoResultFromServer =
        await YoutubeRepository.to.search(searchKey, youtubeVideoResult.value.nextPagetoken ?? '');
    //youtubeVideoResult(youtubeVideoResultFromServer);

    if (youtubeVideoResultFromServer != null &&
        youtubeVideoResultFromServer.items != null &&
        youtubeVideoResultFromServer.items!.length > 0) {
      youtubeVideoResult.update((youtube) {
        youtube!.nextPagetoken = youtubeVideoResultFromServer.nextPagetoken;
        youtube.items!.addAll(youtubeVideoResultFromServer.items!);
      });
    }
  }
}
