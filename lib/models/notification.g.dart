// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationConfigAdapter extends TypeAdapter<NotificationConfig> {
  @override
  final int typeId = 0;

  @override
  NotificationConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationConfig(
      time: fields[0] as String,
      days: (fields[1] as List).cast<int>(),
      id: fields[2] as int,
    )..notificationIds = (fields[3] as List).cast<int>();
  }

  @override
  void write(BinaryWriter writer, NotificationConfig obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.days)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.notificationIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
