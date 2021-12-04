import 'dart:io';

import 'package:betterme/betterme/home/SearchFoodScreen/SearchFoodScreen.dart';
import 'package:betterme/betterme/home/functions/ConstructTabBar.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:thumbnails/thumbnails.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen>
    with AutomaticKeepAliveClientMixin {
  late CameraController _controller;
  // late List<CameraDescription> _cameras;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Object?> food_list = [];

  @override
  // void initState() {
  //   _controller = CameraController(Get.arguments[0], ResolutionPreset.max);
  //   _controller.addListener(() {
  //     if (mounted) setState(() {});
  //   });
  //   _controller.initialize();
  //   setState(() {});
  //   super.initState();
  // }

  void initState() {
    super.initState();
    ServerConnection.write_log('CameraScreen', 'start', '');
    print(Get.arguments[0]);
    _controller = CameraController(Get.arguments[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    super.build(context);
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            padding: EdgeInsets.zero,
            // alignment: Alignment.bottomCenter,
            onPressed: () {
              ServerConnection.write_log(
                  'CameraScreen', 'end', 'ConstructTabBar');
              Get.offAll(() => ConstructTabBar());
            }),
        actions: [
          TextButton(
            onPressed: () {
              _controller.dispose();
              ServerConnection.write_log(
                  'CameraScreen', 'end', 'SearchFoodScreen');
              Get.off(
                () => SearchFoodScreen(),
                arguments: [food_list, 0],
              );
            },
            child: Text("건너뛰기",
                style: TextStyle(
                  fontSize: defaultSize * 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFFFFFDFD),
                )),
          ),
          SizedBox(width: 15),
        ],
        elevation: 0,
        backgroundColor: Color(0XFF0B202A),
      ),
      backgroundColor: Color(0XFF0B202A),
      key: _scaffoldKey,
      extendBody: true,
      body: OrientationBuilder(builder: (context, orientation) {
        // return _buildCameraPreview(Orientation.portrait);
        return orientation == Orientation.portrait
            ? _buildCameraPreview(Orientation.portrait)
            : Text('sd');
      }),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildCameraPreview(Orientation portrait) {
    final size = MediaQuery.of(context).size;
    var a;
    var ratio;
    var ratio_1;
    // if (_controller.value.aspectRatio == null) {
    //   print("null");
    // }
    // print(_controller.value.aspectRatio);
    try {
      a = 1;
      ratio = 1 / _controller.value.aspectRatio;
      ratio_1 = ratio / size.aspectRatio;
    } catch (e) {
      print("not working");
      a = 2;
      ratio = 0.75;
      ratio_1 = 1.6;
    }
    print("rebuild");
    print(portrait.index);
    print(ratio);
    print(ratio_1);
    print(size.aspectRatio);
    return ClipRect(
      child: Container(
        child: Transform.scale(
          // scale: _controller.value.aspectRatio / size.aspectRatio,
          // scale: 16 / 9,
          scale: 1,
          // scale: ratio_1,
          child: Center(
            child: AspectRatio(
              // aspectRatio: _controller.value.aspectRatio,
              // aspectRatio: 1,
              aspectRatio: ratio,
              child: CameraPreview(_controller),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      color: Color(0XFF0B202A),
      height: 100.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // FutureBuilder(
          //   future: getLastImage(),
          //   builder: (context, snapshot) {
          //     if (snapshot.data == null) {
          //       return Container(
          //         width: 40.0,
          //         height: 40.0,
          //       );
          //     }
          //     return GestureDetector(
          //       onTap: () => Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => Gallery(),
          //         ),
          //       ),
          //       child: Container(
          //         width: 40.0,
          //         height: 40.0,
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(4.0),
          //           child: Image.file(
          //             snapshot.data,
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
          // CircleAvatar(
          //   backgroundColor: Colors.white,
          //   radius: 28.0,
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.add_photo_alternate_rounded,
          //       size: 28.0,
          //       color: Colors.black,
          //     ),
          //     onPressed: () async {
          //       // _captureImage();
          // await ProfileController.to
          //     .pickImage(type: 'gallery', use: 'food');
          // if (ProfileController.to.food != null) {
          //   // ProfileController.to.uploadFoodImage(
          //   //     uid: ProfileController.to.myProfile.value.uid!,
          //   //     index: '0',
          //   //     file: ProfileController.to.food!);
          //   // Navigator.push(
          //   //   context,
          //   //   MaterialPageRoute(
          //   //     builder: (context) => SearchFoodScreen(),
          //   //   ),
          //   // );
          //   _controller.dispose();
          //   Get.off(
          //     () => SearchFoodScreen(),
          //     arguments: [food_list, ProfileController.to.food],
          //   );
          //       }
          //     },
          //   ),
          // ),
          IconButton(
            icon: SvgPicture.asset('images/camerpage_pick_picture.svg'),
            iconSize: 50,
            onPressed: () async {
              ServerConnection.write_log('CameraScreen', 'pick_picture', '');
              await ProfileController.to
                  .pickImage(type: 'gallery', use: 'food');
              if (ProfileController.to.food != null) {
                // ProfileController.to.uploadFoodImage(
                //     uid: ProfileController.to.myProfile.value.uid!,
                //     index: '0',
                //     file: ProfileController.to.food!);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SearchFoodScreen(),
                //   ),
                // );
                _controller.dispose();
                ServerConnection.write_log(
                    'CameraScreen', 'end', 'SearchFoodScreen');
                Get.off(
                  () => SearchFoodScreen(),
                  arguments: [food_list, ProfileController.to.food],
                );
              }
            },
          ),
          IconButton(
            icon: SvgPicture.asset('images/camerapage_take_picture.svg'),
            iconSize: 70,
            onPressed: () {
              _captureImage();
            },
          ),
          SizedBox(width: 50)
          // CircleAvatar(
          //   backgroundColor: Colors.white,
          //   radius: 28.0,
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.camera_alt,
          //       size: 28.0,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {
          //       _captureImage();
          //     },
          //   ),
          // ),
          // CircleAvatar(
          //   backgroundColor: Colors.white,
          //   radius: 28.0,
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.food_bank,
          //       size: 28.0,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {
          // _controller.dispose();
          // Get.off(
          //   () => SearchFoodScreen(),
          //   arguments: [food_list, 0],
          // );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  // Future<FileSystemEntity> getLastImage() async {
  //   final Directory extDir = await getApplicationDocumentsDirectory();
  //   final String dirPath = '${extDir.path}/media';
  //   final myDir = Directory(dirPath);
  //   List<FileSystemEntity> _images;
  //   _images = myDir.listSync(recursive: true, followLinks: false);
  //   _images.sort((a, b) {
  //     return b.path.compareTo(a.path);
  //   });
  //   var lastFile = _images[0];
  //   var extension = path.extension(lastFile.path);
  //   if (extension == '.jpeg') {
  //     return lastFile;
  //   } else {
  //     String thumb = await Thumbnails.getThumbnail(
  //         videoFile: lastFile.path, imageType: ThumbFormat.PNG, quality: 30);
  //     return File(thumb);
  //   }
  // }

  Future<void> _onCameraSwitch() async {
    print("camera switch");
    final CameraDescription cameraDescription =
        (_controller.description == Get.arguments[0])
            ? Get.arguments[1]
            : Get.arguments[0];
    if (_controller != null) {
      await _controller.dispose();
    }
    _controller = CameraController(cameraDescription, ResolutionPreset.medium);
    _controller.addListener(() {
      if (mounted) setState(() {});
      // if (_controller.value.hasError) {
      //   showInSnackBar('Camera error ${_controller.value.errorDescription}');
      // }
    });

    try {
      await _controller.initialize();
    } on CameraException catch (e) {
      // _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _captureImage() async {
    print('_captureImage');
    if (_controller.value.isInitialized) {
      SystemSound.play(SystemSoundType.click);
      final Directory extDir = await getApplicationDocumentsDirectory();
      final String dirPath = '${extDir.path}/media';
      await Directory(dirPath).create(recursive: true);
      final String filePath = '$dirPath/${_timestamp()}.jpeg';
      // print('path: $filePath');
      // await _controller.takePicture(filePath);
      XFile tmp = await _controller.takePicture();
      print(tmp.path);
      // ProfileController.to.uploadFoodImage(
      //     uid: ProfileController.to.myProfile.value.uid!,
      //     index: '0',
      //     file: File(tmp.path));
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => SearchFoodScreen()));
      ServerConnection.write_log('CameraScreen', 'take_picture', '');
      ServerConnection.write_log('CameraScreen', 'end', 'SearchFoodScreen');
      Get.off(
        () => SearchFoodScreen(),
        arguments: [food_list, File(tmp.path)],
      );
    }
  }

  String _timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  // void _showCameraException(CameraException e) {
  //   logError(e.code, e.description);
  //   showInSnackBar('Error: ${e.code}\n${e.description}');
  // }

  // void showInSnackBar(String message) {
  //   _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  // }

  void logError(String code, String message) =>
      print('Error: $code\nError Message: $message');

  @override
  bool get wantKeepAlive => true;
}
