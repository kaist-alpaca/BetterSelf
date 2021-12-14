import 'package:betterme/betterme/home/functions/ConstructTabBar.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';

class SaveFoodScreenImageLoading extends StatefulWidget {
  var time;
  var data;

  SaveFoodScreenImageLoading({Key? key, required this.time, required this.data})
      : super(key: key);

  @override
  State<SaveFoodScreenImageLoading> createState() =>
      _SaveFoodScreenImageLoading();
}

class _SaveFoodScreenImageLoading extends State<SaveFoodScreenImageLoading> {
  @override
  Widget build(BuildContext context) {
    print('saving food image');
    return FutureBuilder<String>(
        future: ProfileController.to.uploadFoodImage(
          uid: ProfileController.to.myProfile.value.uid!,
          file: widget.data[1],
          time: widget.time.toString().replaceAll(" ", "").replaceAll("-", "_"),
        ),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return ConstructTabBar();
          } else {
            return Material(
              type: MaterialType.transparency,
              child: Container(
                color: Color(0xff0B202A),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        "데이터를 불러오는 중입니다....",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
