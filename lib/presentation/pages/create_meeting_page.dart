import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meet_up_app/presentation/components/app_bars.dart';
import 'package:meet_up_app/presentation/components/login_text_field.dart';
import 'package:meet_up_app/utils/app_icons.dart';

class CreateMeetingPage extends StatelessWidget {
  const CreateMeetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.instance.transparentAppBarWithBlackStatusBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                (AppIcons.pen..size = 32).build(),
                const SizedBox(height: 32),
                const Text(
                  "Create a name",
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: -0.33,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: MediaQuery.of(context).size.height * 0.15,
                  ),
                  child: LoginTextField(
                    hintText: "HintText",
                    obscure: false,
                    onChanged: (value) {},
                    keyBoardType: TextInputType.name,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}
