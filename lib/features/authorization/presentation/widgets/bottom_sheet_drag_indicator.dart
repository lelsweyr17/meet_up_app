import 'package:flutter/material.dart';

class BottomSheetDragIndicator extends StatelessWidget {
  const BottomSheetDragIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          height: 5,
          width: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.grey[300],
          ),
          // color: Colors.black,
        ),
      ),
    );
  }
}
