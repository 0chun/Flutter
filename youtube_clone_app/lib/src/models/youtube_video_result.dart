import 'package:youtube_clone_app/src/models/video.dart';

class YoutubeVideoResult {
  int? totalResult;
  int? resultPerPage;
  String? nextPagetoken;
  List<Video>? items;

  YoutubeVideoResult(
      {this.totalResult, this.resultPerPage, this.nextPagetoken, this.items});

  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) =>
      YoutubeVideoResult(
          totalResult: json['pageInfo']['totalResults'],
          resultPerPage: json['pageInfo']['resultPerPage'],
          nextPagetoken: json['nextPageToken'] ?? '',
          items: List<Video>.from(
              json['items'].map((data) => Video.fromJson(data))));
}
