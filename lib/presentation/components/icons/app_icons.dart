import 'package:meet_up_app/utils/svg_builder.dart';

class AppIcons {
  static const path = "assets/icons/";

  static const profile = SvgBuilder(path: "${path}profile.svg");

  static const calendar = SvgBuilder(path: "${path}calendar.svg");

  static const settings = SvgBuilder(path: "${path}settings.svg");

  static const logOut = SvgBuilder(path: "${path}log_out.svg");

  static const addPhoto = SvgBuilder(path: "${path}add_photo.svg");
}
