import 'package:betterme/betterme/home/functions/ConstructTabBar.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SaveFoodScreenImageLoading.dart';

class SaveFoodScreenDataLoading extends StatefulWidget {
  SaveFoodScreenDataLoading({Key? key}) : super(key: key);

  @override
  State<SaveFoodScreenDataLoading> createState() =>
      _SaveFoodScreenDataLoading();
}

class _SaveFoodScreenDataLoading extends State<SaveFoodScreenDataLoading> {
  @override
  Widget build(BuildContext context) {
    print('saving food image');
    return FutureBuilder<String>(
        future: ServerConnection.save_food(
          ProfileController.to.originMyProfile.uid!,
          Get.arguments[0],
          Get.arguments[1] == 0 ? '0' : Get.arguments[1],
        ),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            ServerConnection.write_log('SaveFoodScreen', 'save_food', '');
            ServerConnection.write_log(
                'SaveFoodScreen', 'end', 'ConstructTabBar');
            if (Get.arguments[1] != 0) {
              return SaveFoodScreenImageLoading(
                  data: Get.arguments, time: snapshot.data);
            } else {
              return ConstructTabBar();
            }
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
                        "식단 기록을 저장하는 중입니다....",
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
