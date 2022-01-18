import 'package:flutter/material.dart';
import 'package:meet_up_app/utils/people_images.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: (PeopleImages.person1
        ..size = size
        ..isIcon = false)
          .build(),
    );
  }
}