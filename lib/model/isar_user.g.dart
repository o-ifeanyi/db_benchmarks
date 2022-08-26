// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarUserModelCollection on Isar {
  IsarCollection<IsarUserModel> get isarUserModels => getCollection();
}

const IsarUserModelSchema = CollectionSchema(
  name: 'IsarUserModel',
  schema:
      '{"name":"IsarUserModel","idName":"id","properties":[{"name":"age","type":"Long"},{"name":"createdAt","type":"Long"},{"name":"email","type":"String"},{"name":"username","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'age': 0, 'createdAt': 1, 'email': 2, 'username': 3},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarUserModelGetId,
  setId: _isarUserModelSetId,
  getLinks: _isarUserModelGetLinks,
  attachLinks: _isarUserModelAttachLinks,
  serializeNative: _isarUserModelSerializeNative,
  deserializeNative: _isarUserModelDeserializeNative,
  deserializePropNative: _isarUserModelDeserializePropNative,
  serializeWeb: _isarUserModelSerializeWeb,
  deserializeWeb: _isarUserModelDeserializeWeb,
  deserializePropWeb: _isarUserModelDeserializePropWeb,
  version: 3,
);

int? _isarUserModelGetId(IsarUserModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarUserModelSetId(IsarUserModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarUserModelGetLinks(IsarUserModel object) {
  return [];
}

void _isarUserModelSerializeNative(
    IsarCollection<IsarUserModel> collection,
    IsarRawObject rawObj,
    IsarUserModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.age;
  final _age = value0;
  final value1 = object.createdAt;
  final _createdAt = value1;
  final value2 = object.email;
  final _email = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_email.length) as int;
  final value3 = object.username;
  final _username = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_username.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _age);
  writer.writeDateTime(offsets[1], _createdAt);
  writer.writeBytes(offsets[2], _email);
  writer.writeBytes(offsets[3], _username);
}

IsarUserModel _isarUserModelDeserializeNative(
    IsarCollection<IsarUserModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarUserModel(
    age: reader.readLong(offsets[0]),
    createdAt: reader.readDateTime(offsets[1]),
    email: reader.readString(offsets[2]),
    id: id,
    username: reader.readString(offsets[3]),
  );
  return object;
}

P _isarUserModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarUserModelSerializeWeb(
    IsarCollection<IsarUserModel> collection, IsarUserModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'age', object.age);
  IsarNative.jsObjectSet(
      jsObj, 'createdAt', object.createdAt.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'email', object.email);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'username', object.username);
  return jsObj;
}

IsarUserModel _isarUserModelDeserializeWeb(
    IsarCollection<IsarUserModel> collection, dynamic jsObj) {
  final object = IsarUserModel(
    age: IsarNative.jsObjectGet(jsObj, 'age') ?? double.negativeInfinity,
    createdAt: IsarNative.jsObjectGet(jsObj, 'createdAt') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'createdAt'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0),
    email: IsarNative.jsObjectGet(jsObj, 'email') ?? '',
    id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    username: IsarNative.jsObjectGet(jsObj, 'username') ?? '',
  );
  return object;
}

P _isarUserModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'age':
      return (IsarNative.jsObjectGet(jsObj, 'age') ?? double.negativeInfinity)
          as P;
    case 'createdAt':
      return (IsarNative.jsObjectGet(jsObj, 'createdAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'createdAt'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'email':
      return (IsarNative.jsObjectGet(jsObj, 'email') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'username':
      return (IsarNative.jsObjectGet(jsObj, 'username') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarUserModelAttachLinks(
    IsarCollection col, int id, IsarUserModel object) {}

extension IsarUserModelQueryWhereSort
    on QueryBuilder<IsarUserModel, IsarUserModel, QWhere> {
  QueryBuilder<IsarUserModel, IsarUserModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarUserModelQueryWhere
    on QueryBuilder<IsarUserModel, IsarUserModel, QWhereClause> {
  QueryBuilder<IsarUserModel, IsarUserModel, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension IsarUserModelQueryFilter
    on QueryBuilder<IsarUserModel, IsarUserModel, QFilterCondition> {
  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition> ageEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'age',
      value: value,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      ageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'age',
      value: value,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition> ageLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'age',
      value: value,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition> ageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'age',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createdAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      emailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      emailGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      emailLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      emailBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'email',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'email',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      usernameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      usernameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      usernameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      usernameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'username',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      usernameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      usernameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      usernameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterFilterCondition>
      usernameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'username',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarUserModelQueryLinks
    on QueryBuilder<IsarUserModel, IsarUserModel, QFilterCondition> {}

extension IsarUserModelQueryWhereSortBy
    on QueryBuilder<IsarUserModel, IsarUserModel, QSortBy> {
  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> sortByAge() {
    return addSortByInternal('age', Sort.asc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> sortByAgeDesc() {
    return addSortByInternal('age', Sort.desc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> sortByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> sortByEmail() {
    return addSortByInternal('email', Sort.asc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> sortByEmailDesc() {
    return addSortByInternal('email', Sort.desc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> sortByUsername() {
    return addSortByInternal('username', Sort.asc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy>
      sortByUsernameDesc() {
    return addSortByInternal('username', Sort.desc);
  }
}

extension IsarUserModelQueryWhereSortThenBy
    on QueryBuilder<IsarUserModel, IsarUserModel, QSortThenBy> {
  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> thenByAge() {
    return addSortByInternal('age', Sort.asc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> thenByAgeDesc() {
    return addSortByInternal('age', Sort.desc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> thenByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> thenByEmail() {
    return addSortByInternal('email', Sort.asc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> thenByEmailDesc() {
    return addSortByInternal('email', Sort.desc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy> thenByUsername() {
    return addSortByInternal('username', Sort.asc);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QAfterSortBy>
      thenByUsernameDesc() {
    return addSortByInternal('username', Sort.desc);
  }
}

extension IsarUserModelQueryWhereDistinct
    on QueryBuilder<IsarUserModel, IsarUserModel, QDistinct> {
  QueryBuilder<IsarUserModel, IsarUserModel, QDistinct> distinctByAge() {
    return addDistinctByInternal('age');
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QDistinct> distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('email', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarUserModel, IsarUserModel, QDistinct> distinctByUsername(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('username', caseSensitive: caseSensitive);
  }
}

extension IsarUserModelQueryProperty
    on QueryBuilder<IsarUserModel, IsarUserModel, QQueryProperty> {
  QueryBuilder<IsarUserModel, int, QQueryOperations> ageProperty() {
    return addPropertyNameInternal('age');
  }

  QueryBuilder<IsarUserModel, DateTime, QQueryOperations> createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<IsarUserModel, String, QQueryOperations> emailProperty() {
    return addPropertyNameInternal('email');
  }

  QueryBuilder<IsarUserModel, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarUserModel, String, QQueryOperations> usernameProperty() {
    return addPropertyNameInternal('username');
  }
}
