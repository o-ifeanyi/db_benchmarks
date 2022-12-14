// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model/object_box_user.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 6418891006209953602),
      name: 'ObjBoxUserModel',
      lastPropertyId: const IdUid(5, 7862311510330146488),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8724186371832399747),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8532030161129112573),
            name: 'createdAt',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8188850200417676948),
            name: 'username',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3696673154244481234),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7862311510330146488),
            name: 'age',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 6418891006209953602),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ObjBoxUserModel: EntityDefinition<ObjBoxUserModel>(
        model: _entities[0],
        toOneRelations: (ObjBoxUserModel object) => [],
        toManyRelations: (ObjBoxUserModel object) => {},
        getId: (ObjBoxUserModel object) => object.id,
        setId: (ObjBoxUserModel object, int id) {
          object.id = id;
        },
        objectToFB: (ObjBoxUserModel object, fb.Builder fbb) {
          final usernameOffset = fbb.writeString(object.username);
          final emailOffset = fbb.writeString(object.email);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.createdAt.millisecondsSinceEpoch);
          fbb.addOffset(2, usernameOffset);
          fbb.addOffset(3, emailOffset);
          fbb.addInt64(4, object.age);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ObjBoxUserModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              createdAt: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0)),
              username: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              email: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              age: const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ObjBoxUserModel] entity fields to define ObjectBox queries.
class ObjBoxUserModel_ {
  /// see [ObjBoxUserModel.id]
  static final id =
      QueryIntegerProperty<ObjBoxUserModel>(_entities[0].properties[0]);

  /// see [ObjBoxUserModel.createdAt]
  static final createdAt =
      QueryIntegerProperty<ObjBoxUserModel>(_entities[0].properties[1]);

  /// see [ObjBoxUserModel.username]
  static final username =
      QueryStringProperty<ObjBoxUserModel>(_entities[0].properties[2]);

  /// see [ObjBoxUserModel.email]
  static final email =
      QueryStringProperty<ObjBoxUserModel>(_entities[0].properties[3]);

  /// see [ObjBoxUserModel.age]
  static final age =
      QueryIntegerProperty<ObjBoxUserModel>(_entities[0].properties[4]);
}
