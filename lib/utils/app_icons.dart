import 'package:meet_up_app/utils/svg_builder.dart';

class AppIcons {
  static const path = "assets/icons/";

  static final profile = SvgBuilder(path: "${path}profile.svg");

  static final calendar = SvgBuilder(path: "${path}calendar.svg");

  static final settings = SvgBuilder(path: "${path}settings.svg");

  static final logOut = SvgBuilder(path: "${path}log_out.svg");

  static final addPhoto = SvgBuilder(path: "${path}add_photo.svg");

  static final close = SvgBuilder(path: "${path}close.svg");

  static final hidden = SvgBuilder(path: "${path}hidden.svg");

  static final notHidden = SvgBuilder(path: "${path}not_hidden.svg");

  static final search = SvgBuilder(path: "${path}search.svg");

  static final bookmark = SvgBuilder(path: "${path}bookmark.svg");

  static final pen = SvgBuilder(path: "${path}pen.svg");
}
