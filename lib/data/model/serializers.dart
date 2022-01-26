import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:meet_up_app/data/model/client/user.dart';
import 'package:meet_up_app/utils/log.dart';

part 'serializers.g.dart';

const _tag = "serializers";

@SerializersFor([
  User,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();

T? deserialize<T>(dynamic value) {
  try {
    final serializer = serializers.serializerForType(T) as Serializer<T>?;

    if (serializer != null) {
      return serializers.deserializeWith<T>(
        serializer,
        value,
      );
    }
  } on Exception catch (e) {
    Log.message(_tag, "${value["\$"]}: ${value["id"]}\n$e");
  }
}

Object? serialize<T>(T value) {
  print("serializers.serialize(value) ${serializers.serialize(value)}");
  return serializers.serialize(value);
}

List<T> deserializeIterable<T>(Iterable<Map<dynamic, dynamic>> value) => value
    .map((value) => deserialize<T>(value))
    .whereType<T>()
    .toList(growable: false);

List<Object> serializeIterable<T>(Iterable<T> value) {
  return value
      .map((value) => serialize<T>(value))
      .whereType<Object>()
      .toList(growable: false);
}
