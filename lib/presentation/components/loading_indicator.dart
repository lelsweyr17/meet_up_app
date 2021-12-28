import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoActivityIndicator();
    } else {
      return const SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(),
      );
    }
  }
}
