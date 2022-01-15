import 'package:flutter/material.dart';
import 'package:meet_up_app/utils/app_icons.dart';
import 'package:meet_up_app/utils/shadows.dart';

class AddPhotoButton extends StatelessWidget {
  const AddPhotoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.08),
          borderRadius: BorderRadius.circular(50),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: (AppIcons.addPhoto..color = Colors.white).build(),
        ),
      ),
    );
  }
}
