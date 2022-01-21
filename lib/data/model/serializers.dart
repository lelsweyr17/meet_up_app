import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:meet_up_app/data/model/client/user.dart';
import 'package:meet_up_app/utils/log.dart';

part 'serializers.g.dart';

@SerializersFor([
  User,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(
        StandardJsonPlugin(),
      ))
    .build();

Object? serialize<T>(T value) => serializers.serializeWith(
      serializers.serializerForType(T) as Serializer<T>,
      value,
    );

T? deserialize<T>(dynamic value) {
  try {
    final serializer = serializers.serializerForType(T) as Serializer<T>;

    if (serializer != null) {
      return serializers.deserializeWith<T>(
        serializer,
        value,
      );
    }
    return null;
  } on Exception catch (e) {
    Log.message("serializers", "${value["\$"]}: ${value["id"]}\n$e");
    return null;
  }
}
