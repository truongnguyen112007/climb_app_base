import 'dart:io';
import 'package:climb_app_base/components/video_app.dart';
import 'package:climb_app_base/data/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ThumbnailApp extends StatefulWidget {
 final VoidCallback callbackOpenVideo;
  const ThumbnailApp({Key? key, required this.callbackOpenVideo}) : super(key: key);

  @override
  State<ThumbnailApp> createState() => _ThumbnailAppState();
}

class _ThumbnailAppState extends State<ThumbnailApp> {
  String? _thumbnailUrl;

  @override
  void initState() {
    super.initState();
    generateThumbnail();
  }

  Future<File> copyAssetFile(String assetFileName) async {
    Directory tempDir = await getTemporaryDirectory();
    final byteData = await rootBundle.load(assetFileName);

    File videoThumbnailFile = File("${tempDir.path}/$assetFileName")
      ..createSync(recursive: true)
      ..writeAsBytesSync(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return videoThumbnailFile;
  }

  void generateThumbnail() async {
    _thumbnailUrl = await VideoThumbnail.thumbnailFile(
        video:
            "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.WEBP);
    print("TAGb _thumbnailUrl: $_thumbnailUrl");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: _thumbnailUrl != null
          ? Stack(
              alignment: Alignment.center,
              children: [
                Image.file(File(_thumbnailUrl!)),
                InkWell(
                  onTap: (){
                    widget.callbackOpenVideo.call();
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black45,
                    child: Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
