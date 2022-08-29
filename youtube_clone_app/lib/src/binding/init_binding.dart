import 'package:get/instance_manager.dart';
import 'package:youtube_clone_app/src/controller/app_controller.dart';
import 'package:youtube_clone_app/src/repository/youtube_repository.dart';

enum RouteName {
  Home, Explore, Add, Subs, Library
}


class InitBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(YoutubeRepository(), permanent: true);
    Get.put(AppController());
  }

}