import 'package:hive/hive.dart';

import '../../../pets_home/data/models/pets.dart';

class PetsAdapter extends TypeAdapter<Pets> {
  @override
  final int typeId = 0;

  @override
  Pets read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pets(
      id: fields[0] as String,
      name: fields[1] as String,
      referenceImageId: fields[2] as String,
      description: fields[3] as String,
      origin: fields[4] as String,
      lifeSpan: fields[5] as String,
      weight: fields[6] as Weight,
    );
  }

  @override
  void write(BinaryWriter writer, Pets obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.referenceImageId)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.origin)
      ..writeByte(5)
      ..write(obj.lifeSpan)
      ..writeByte(6)
      ..write(obj.weight);
  }
}

class WeightAdapter extends TypeAdapter<Weight> {
  @override
  final int typeId = 1;

  @override
  Weight read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weight(imperial: fields[0] as String, metric: fields[1] as String);
  }

  @override
  void write(BinaryWriter writer, Weight obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.imperial)
      ..writeByte(1)
      ..write(obj.metric);
  }
}
