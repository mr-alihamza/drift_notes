// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_database.dart';

// ignore_for_file: type=lint
class $UserDetailsTableTable extends UserDetailsTable
    with TableInfo<$UserDetailsTableTable, UserDetailsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDetailsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isVerifiedMeta = const VerificationMeta(
    'isVerified',
  );
  @override
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
    'is_verified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_verified" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    phoneNumber,
    imagePath,
    isVerified,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_details_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserDetailsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('is_verified')) {
      context.handle(
        _isVerifiedMeta,
        isVerified.isAcceptableOrUnknown(data['is_verified']!, _isVerifiedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDetailsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDetailsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
      isVerified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_verified'],
      )!,
    );
  }

  @override
  $UserDetailsTableTable createAlias(String alias) {
    return $UserDetailsTableTable(attachedDatabase, alias);
  }
}

class UserDetailsTableData extends DataClass
    implements Insertable<UserDetailsTableData> {
  final int id;
  final String name;
  final String description;
  final String phoneNumber;
  final String imagePath;
  final bool isVerified;
  const UserDetailsTableData({
    required this.id,
    required this.name,
    required this.description,
    required this.phoneNumber,
    required this.imagePath,
    required this.isVerified,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['image_path'] = Variable<String>(imagePath);
    map['is_verified'] = Variable<bool>(isVerified);
    return map;
  }

  UserDetailsTableCompanion toCompanion(bool nullToAbsent) {
    return UserDetailsTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      phoneNumber: Value(phoneNumber),
      imagePath: Value(imagePath),
      isVerified: Value(isVerified),
    );
  }

  factory UserDetailsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDetailsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      isVerified: serializer.fromJson<bool>(json['isVerified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'imagePath': serializer.toJson<String>(imagePath),
      'isVerified': serializer.toJson<bool>(isVerified),
    };
  }

  UserDetailsTableData copyWith({
    int? id,
    String? name,
    String? description,
    String? phoneNumber,
    String? imagePath,
    bool? isVerified,
  }) => UserDetailsTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    imagePath: imagePath ?? this.imagePath,
    isVerified: isVerified ?? this.isVerified,
  );
  UserDetailsTableData copyWithCompanion(UserDetailsTableCompanion data) {
    return UserDetailsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      isVerified: data.isVerified.present
          ? data.isVerified.value
          : this.isVerified,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDetailsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('imagePath: $imagePath, ')
          ..write('isVerified: $isVerified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, phoneNumber, imagePath, isVerified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDetailsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.phoneNumber == this.phoneNumber &&
          other.imagePath == this.imagePath &&
          other.isVerified == this.isVerified);
}

class UserDetailsTableCompanion extends UpdateCompanion<UserDetailsTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> phoneNumber;
  final Value<String> imagePath;
  final Value<bool> isVerified;
  const UserDetailsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.isVerified = const Value.absent(),
  });
  UserDetailsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required String phoneNumber,
    required String imagePath,
    this.isVerified = const Value.absent(),
  }) : name = Value(name),
       description = Value(description),
       phoneNumber = Value(phoneNumber),
       imagePath = Value(imagePath);
  static Insertable<UserDetailsTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? phoneNumber,
    Expression<String>? imagePath,
    Expression<bool>? isVerified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (imagePath != null) 'image_path': imagePath,
      if (isVerified != null) 'is_verified': isVerified,
    });
  }

  UserDetailsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? phoneNumber,
    Value<String>? imagePath,
    Value<bool>? isVerified,
  }) {
    return UserDetailsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imagePath: imagePath ?? this.imagePath,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<bool>(isVerified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDetailsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('imagePath: $imagePath, ')
          ..write('isVerified: $isVerified')
          ..write(')'))
        .toString();
  }
}

abstract class _$UserDetailsDatabase extends GeneratedDatabase {
  _$UserDetailsDatabase(QueryExecutor e) : super(e);
  $UserDetailsDatabaseManager get managers => $UserDetailsDatabaseManager(this);
  late final $UserDetailsTableTable userDetailsTable = $UserDetailsTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userDetailsTable];
}

typedef $$UserDetailsTableTableCreateCompanionBuilder =
    UserDetailsTableCompanion Function({
      Value<int> id,
      required String name,
      required String description,
      required String phoneNumber,
      required String imagePath,
      Value<bool> isVerified,
    });
typedef $$UserDetailsTableTableUpdateCompanionBuilder =
    UserDetailsTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> phoneNumber,
      Value<String> imagePath,
      Value<bool> isVerified,
    });

class $$UserDetailsTableTableFilterComposer
    extends Composer<_$UserDetailsDatabase, $UserDetailsTableTable> {
  $$UserDetailsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserDetailsTableTableOrderingComposer
    extends Composer<_$UserDetailsDatabase, $UserDetailsTableTable> {
  $$UserDetailsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserDetailsTableTableAnnotationComposer
    extends Composer<_$UserDetailsDatabase, $UserDetailsTableTable> {
  $$UserDetailsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => column,
  );
}

class $$UserDetailsTableTableTableManager
    extends
        RootTableManager<
          _$UserDetailsDatabase,
          $UserDetailsTableTable,
          UserDetailsTableData,
          $$UserDetailsTableTableFilterComposer,
          $$UserDetailsTableTableOrderingComposer,
          $$UserDetailsTableTableAnnotationComposer,
          $$UserDetailsTableTableCreateCompanionBuilder,
          $$UserDetailsTableTableUpdateCompanionBuilder,
          (
            UserDetailsTableData,
            BaseReferences<
              _$UserDetailsDatabase,
              $UserDetailsTableTable,
              UserDetailsTableData
            >,
          ),
          UserDetailsTableData,
          PrefetchHooks Function()
        > {
  $$UserDetailsTableTableTableManager(
    _$UserDetailsDatabase db,
    $UserDetailsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserDetailsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserDetailsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserDetailsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> phoneNumber = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<bool> isVerified = const Value.absent(),
              }) => UserDetailsTableCompanion(
                id: id,
                name: name,
                description: description,
                phoneNumber: phoneNumber,
                imagePath: imagePath,
                isVerified: isVerified,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String description,
                required String phoneNumber,
                required String imagePath,
                Value<bool> isVerified = const Value.absent(),
              }) => UserDetailsTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                phoneNumber: phoneNumber,
                imagePath: imagePath,
                isVerified: isVerified,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserDetailsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$UserDetailsDatabase,
      $UserDetailsTableTable,
      UserDetailsTableData,
      $$UserDetailsTableTableFilterComposer,
      $$UserDetailsTableTableOrderingComposer,
      $$UserDetailsTableTableAnnotationComposer,
      $$UserDetailsTableTableCreateCompanionBuilder,
      $$UserDetailsTableTableUpdateCompanionBuilder,
      (
        UserDetailsTableData,
        BaseReferences<
          _$UserDetailsDatabase,
          $UserDetailsTableTable,
          UserDetailsTableData
        >,
      ),
      UserDetailsTableData,
      PrefetchHooks Function()
    >;

class $UserDetailsDatabaseManager {
  final _$UserDetailsDatabase _db;
  $UserDetailsDatabaseManager(this._db);
  $$UserDetailsTableTableTableManager get userDetailsTable =>
      $$UserDetailsTableTableTableManager(_db, _db.userDetailsTable);
}
