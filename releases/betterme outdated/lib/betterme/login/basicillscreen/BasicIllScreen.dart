import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

import 'package:keyboard_actions/keyboard_actions.dart';

class BasicIllScreen extends StatelessWidget {
  final FocusNode _nodeText1 = FocusNode();

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: false,
      actions: [
        KeyboardActionsItem(focusNode: _nodeText1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text('질병기초정보'),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    KeyboardActions(
                      disableScroll: true,
                      config: _buildConfig(context),
                      child: TextFormField(
                        initialValue: controller.disease == null
                            ? ""
                            : controller.disease,
                        maxLines: 10,
                        focusNode: _nodeText1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          hintText: "질병기초정보",
                        ),
                        onChanged: (text) {
                          controller.diseaseSelected(text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
