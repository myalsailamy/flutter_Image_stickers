import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'StickerView.dart';

class StickerViewScreen extends StatefulWidget {
  @override
  _StickerViewScreenState createState() => _StickerViewScreenState();
}

class _StickerViewScreenState extends State<StickerViewScreen> {
  StickerView _stickerView = StickerView(
    Container(
      decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage("assets/car_digram.jpg"))),
    ),
    [
      Image.asset("assets/icons8-superman-50.png"),
      Image.asset("assets/icons8-captain-america-50.png"),
      Image.asset("assets/icons8-avengers-50.png"),
      Image.asset("assets/icons8-iron-man-50.png"),
      Image.asset("assets/icons8-batman-50.png"),
      Image.asset("assets/icons8-thor-50.png"),
      Image.asset("assets/icons8-venom-head-50.png"),
      Image.asset("assets/icons8-homer-simpson-50.png"),
      Image.asset("assets/icons8-spider-man-head-50.png"),
      Image.asset("assets/icons8-harry-potter-50.png"),
      Image.asset("assets/icons8-genie-lamp-50.png"),
      Image.asset("assets/icons8-cyborg-50.png"),
      Image.asset("assets/icons8-one-ring-50.png"),
    ],
    panelHeight: 100,
    panelBackgroundColor: Colors.blue,
//    panelStickerBackgroundColor: Colors.pink,
    panelStickercrossAxisCount: 5,
    panelStickerAspectRatio: 1.0,
    stickerSize: 70,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Simple Sticker View"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save_alt),
              onPressed: () async {
                Uint8List image = await _stickerView.exportImage();

//                Map<PermissionGroup, PermissionStatus> permissions =
//                    await PermissionHandler()
//                        .requestPermissions([PermissionGroup.storage]);
                await ImageGallerySaver.saveImage(image);
              },
            )
          ],
        ),
        body: _stickerView);
  }
}
