import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/src/controller/video_controller.dart';
import 'package:youtube_clone_app/src/models/video.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatefulWidget {
  final Video? video;
  const VideoWidget({Key? key, this.video}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoController _videoController;
  @override
  void initState() {
    _videoController = Get.put(VideoController(video: widget.video),
        tag: widget.video!.id!.videoId!);
    super.initState();
  }

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          // height: 250,
          color: Colors.grey.withOpacity(0.5),
          child: CachedNetworkImage(
            imageUrl: widget.video!.snippet!.thumbnails!.medium!.url!,
            placeholder: (context, url) => Container(
              height: 230,
              child: Center(child: CircularProgressIndicator()),
            ),
            fit: BoxFit.fitWidth,
          ),
          // child: Image.network(widget.video!.snippet!.thumbnails!.medium!.url!,
          //     fit: BoxFit.fitWidth),
        ),
      ],
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        children: [
          Obx(
            () => CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage:
                  Image.network(_videoController.youtuberThumbnail).image,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.video!.snippet!.title!,
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.topCenter,
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.video!.snippet!.channelTitle!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text('ㆍ'),
                    Obx(
                      () => Text(
                        _videoController.viewCountString,
                        // '조회수 ${_videoController.statistics.value.viewCount}회',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Text('ㆍ'),
                    Text(
                      DateFormat("yyyy-MM-dd")
                          .format(widget.video!.snippet!.publishTime!),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        _thumbnail(),
        _simpleDetailinfo(),
      ]),
    );
  }
}
