// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductsTableTable extends ProductsTable
    with TableInfo<$ProductsTableTable, ProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
    'sku',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _codigoBarrasMeta = const VerificationMeta(
    'codigoBarras',
  );
  @override
  late final GeneratedColumn<String> codigoBarras = GeneratedColumn<String>(
    'codigo_barras',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _precioVentaMeta = const VerificationMeta(
    'precioVenta',
  );
  @override
  late final GeneratedColumn<double> precioVenta = GeneratedColumn<double>(
    'precio_venta',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precioCompraMeta = const VerificationMeta(
    'precioCompra',
  );
  @override
  late final GeneratedColumn<double> precioCompra = GeneratedColumn<double>(
    'precio_compra',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _satClaveMeta = const VerificationMeta(
    'satClave',
  );
  @override
  late final GeneratedColumn<String> satClave = GeneratedColumn<String>(
    'sat_clave',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _satUnidadMeta = const VerificationMeta(
    'satUnidad',
  );
  @override
  late final GeneratedColumn<String> satUnidad = GeneratedColumn<String>(
    'sat_unidad',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoriaIdMeta = const VerificationMeta(
    'categoriaId',
  );
  @override
  late final GeneratedColumn<String> categoriaId = GeneratedColumn<String>(
    'categoria_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ivaIncluidoMeta = const VerificationMeta(
    'ivaIncluido',
  );
  @override
  late final GeneratedColumn<bool> ivaIncluido = GeneratedColumn<bool>(
    'iva_incluido',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("iva_incluido" IN (0, 1))',
    ),
  );
  static const VerificationMeta _activoMeta = const VerificationMeta('activo');
  @override
  late final GeneratedColumn<bool> activo = GeneratedColumn<bool>(
    'activo',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("activo" IN (0, 1))',
    ),
  );
  static const VerificationMeta _empresaIdMeta = const VerificationMeta(
    'empresaId',
  );
  @override
  late final GeneratedColumn<String> empresaId = GeneratedColumn<String>(
    'empresa_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncPendingMeta = const VerificationMeta(
    'syncPending',
  );
  @override
  late final GeneratedColumn<bool> syncPending = GeneratedColumn<bool>(
    'sync_pending',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sync_pending" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sku,
    codigoBarras,
    nombre,
    descripcion,
    precioVenta,
    precioCompra,
    satClave,
    satUnidad,
    categoriaId,
    ivaIncluido,
    activo,
    empresaId,
    createdAt,
    updatedAt,
    syncPending,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sku')) {
      context.handle(
        _skuMeta,
        sku.isAcceptableOrUnknown(data['sku']!, _skuMeta),
      );
    }
    if (data.containsKey('codigo_barras')) {
      context.handle(
        _codigoBarrasMeta,
        codigoBarras.isAcceptableOrUnknown(
          data['codigo_barras']!,
          _codigoBarrasMeta,
        ),
      );
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    if (data.containsKey('precio_venta')) {
      context.handle(
        _precioVentaMeta,
        precioVenta.isAcceptableOrUnknown(
          data['precio_venta']!,
          _precioVentaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precioVentaMeta);
    }
    if (data.containsKey('precio_compra')) {
      context.handle(
        _precioCompraMeta,
        precioCompra.isAcceptableOrUnknown(
          data['precio_compra']!,
          _precioCompraMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precioCompraMeta);
    }
    if (data.containsKey('sat_clave')) {
      context.handle(
        _satClaveMeta,
        satClave.isAcceptableOrUnknown(data['sat_clave']!, _satClaveMeta),
      );
    }
    if (data.containsKey('sat_unidad')) {
      context.handle(
        _satUnidadMeta,
        satUnidad.isAcceptableOrUnknown(data['sat_unidad']!, _satUnidadMeta),
      );
    }
    if (data.containsKey('categoria_id')) {
      context.handle(
        _categoriaIdMeta,
        categoriaId.isAcceptableOrUnknown(
          data['categoria_id']!,
          _categoriaIdMeta,
        ),
      );
    }
    if (data.containsKey('iva_incluido')) {
      context.handle(
        _ivaIncluidoMeta,
        ivaIncluido.isAcceptableOrUnknown(
          data['iva_incluido']!,
          _ivaIncluidoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ivaIncluidoMeta);
    }
    if (data.containsKey('activo')) {
      context.handle(
        _activoMeta,
        activo.isAcceptableOrUnknown(data['activo']!, _activoMeta),
      );
    } else if (isInserting) {
      context.missing(_activoMeta);
    }
    if (data.containsKey('empresa_id')) {
      context.handle(
        _empresaIdMeta,
        empresaId.isAcceptableOrUnknown(data['empresa_id']!, _empresaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_empresaIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_pending')) {
      context.handle(
        _syncPendingMeta,
        syncPending.isAcceptableOrUnknown(
          data['sync_pending']!,
          _syncPendingMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sku: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sku'],
      ),
      codigoBarras: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codigo_barras'],
      ),
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
      precioVenta: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precio_venta'],
      )!,
      precioCompra: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precio_compra'],
      )!,
      satClave: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sat_clave'],
      ),
      satUnidad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sat_unidad'],
      ),
      categoriaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categoria_id'],
      ),
      ivaIncluido: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}iva_incluido'],
      )!,
      activo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}activo'],
      )!,
      empresaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}empresa_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncPending: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sync_pending'],
      )!,
    );
  }

  @override
  $ProductsTableTable createAlias(String alias) {
    return $ProductsTableTable(attachedDatabase, alias);
  }
}

class ProductsTableData extends DataClass
    implements Insertable<ProductsTableData> {
  final String id;
  final String? sku;
  final String? codigoBarras;
  final String nombre;
  final String? descripcion;
  final double precioVenta;
  final double precioCompra;
  final String? satClave;
  final String? satUnidad;
  final String? categoriaId;
  final bool ivaIncluido;
  final bool activo;
  final String empresaId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool syncPending;
  const ProductsTableData({
    required this.id,
    this.sku,
    this.codigoBarras,
    required this.nombre,
    this.descripcion,
    required this.precioVenta,
    required this.precioCompra,
    this.satClave,
    this.satUnidad,
    this.categoriaId,
    required this.ivaIncluido,
    required this.activo,
    required this.empresaId,
    required this.createdAt,
    required this.updatedAt,
    required this.syncPending,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || sku != null) {
      map['sku'] = Variable<String>(sku);
    }
    if (!nullToAbsent || codigoBarras != null) {
      map['codigo_barras'] = Variable<String>(codigoBarras);
    }
    map['nombre'] = Variable<String>(nombre);
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    map['precio_venta'] = Variable<double>(precioVenta);
    map['precio_compra'] = Variable<double>(precioCompra);
    if (!nullToAbsent || satClave != null) {
      map['sat_clave'] = Variable<String>(satClave);
    }
    if (!nullToAbsent || satUnidad != null) {
      map['sat_unidad'] = Variable<String>(satUnidad);
    }
    if (!nullToAbsent || categoriaId != null) {
      map['categoria_id'] = Variable<String>(categoriaId);
    }
    map['iva_incluido'] = Variable<bool>(ivaIncluido);
    map['activo'] = Variable<bool>(activo);
    map['empresa_id'] = Variable<String>(empresaId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_pending'] = Variable<bool>(syncPending);
    return map;
  }

  ProductsTableCompanion toCompanion(bool nullToAbsent) {
    return ProductsTableCompanion(
      id: Value(id),
      sku: sku == null && nullToAbsent ? const Value.absent() : Value(sku),
      codigoBarras: codigoBarras == null && nullToAbsent
          ? const Value.absent()
          : Value(codigoBarras),
      nombre: Value(nombre),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      precioVenta: Value(precioVenta),
      precioCompra: Value(precioCompra),
      satClave: satClave == null && nullToAbsent
          ? const Value.absent()
          : Value(satClave),
      satUnidad: satUnidad == null && nullToAbsent
          ? const Value.absent()
          : Value(satUnidad),
      categoriaId: categoriaId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoriaId),
      ivaIncluido: Value(ivaIncluido),
      activo: Value(activo),
      empresaId: Value(empresaId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncPending: Value(syncPending),
    );
  }

  factory ProductsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductsTableData(
      id: serializer.fromJson<String>(json['id']),
      sku: serializer.fromJson<String?>(json['sku']),
      codigoBarras: serializer.fromJson<String?>(json['codigoBarras']),
      nombre: serializer.fromJson<String>(json['nombre']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
      precioVenta: serializer.fromJson<double>(json['precioVenta']),
      precioCompra: serializer.fromJson<double>(json['precioCompra']),
      satClave: serializer.fromJson<String?>(json['satClave']),
      satUnidad: serializer.fromJson<String?>(json['satUnidad']),
      categoriaId: serializer.fromJson<String?>(json['categoriaId']),
      ivaIncluido: serializer.fromJson<bool>(json['ivaIncluido']),
      activo: serializer.fromJson<bool>(json['activo']),
      empresaId: serializer.fromJson<String>(json['empresaId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncPending: serializer.fromJson<bool>(json['syncPending']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sku': serializer.toJson<String?>(sku),
      'codigoBarras': serializer.toJson<String?>(codigoBarras),
      'nombre': serializer.toJson<String>(nombre),
      'descripcion': serializer.toJson<String?>(descripcion),
      'precioVenta': serializer.toJson<double>(precioVenta),
      'precioCompra': serializer.toJson<double>(precioCompra),
      'satClave': serializer.toJson<String?>(satClave),
      'satUnidad': serializer.toJson<String?>(satUnidad),
      'categoriaId': serializer.toJson<String?>(categoriaId),
      'ivaIncluido': serializer.toJson<bool>(ivaIncluido),
      'activo': serializer.toJson<bool>(activo),
      'empresaId': serializer.toJson<String>(empresaId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncPending': serializer.toJson<bool>(syncPending),
    };
  }

  ProductsTableData copyWith({
    String? id,
    Value<String?> sku = const Value.absent(),
    Value<String?> codigoBarras = const Value.absent(),
    String? nombre,
    Value<String?> descripcion = const Value.absent(),
    double? precioVenta,
    double? precioCompra,
    Value<String?> satClave = const Value.absent(),
    Value<String?> satUnidad = const Value.absent(),
    Value<String?> categoriaId = const Value.absent(),
    bool? ivaIncluido,
    bool? activo,
    String? empresaId,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? syncPending,
  }) => ProductsTableData(
    id: id ?? this.id,
    sku: sku.present ? sku.value : this.sku,
    codigoBarras: codigoBarras.present ? codigoBarras.value : this.codigoBarras,
    nombre: nombre ?? this.nombre,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
    precioVenta: precioVenta ?? this.precioVenta,
    precioCompra: precioCompra ?? this.precioCompra,
    satClave: satClave.present ? satClave.value : this.satClave,
    satUnidad: satUnidad.present ? satUnidad.value : this.satUnidad,
    categoriaId: categoriaId.present ? categoriaId.value : this.categoriaId,
    ivaIncluido: ivaIncluido ?? this.ivaIncluido,
    activo: activo ?? this.activo,
    empresaId: empresaId ?? this.empresaId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncPending: syncPending ?? this.syncPending,
  );
  ProductsTableData copyWithCompanion(ProductsTableCompanion data) {
    return ProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      sku: data.sku.present ? data.sku.value : this.sku,
      codigoBarras: data.codigoBarras.present
          ? data.codigoBarras.value
          : this.codigoBarras,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      precioVenta: data.precioVenta.present
          ? data.precioVenta.value
          : this.precioVenta,
      precioCompra: data.precioCompra.present
          ? data.precioCompra.value
          : this.precioCompra,
      satClave: data.satClave.present ? data.satClave.value : this.satClave,
      satUnidad: data.satUnidad.present ? data.satUnidad.value : this.satUnidad,
      categoriaId: data.categoriaId.present
          ? data.categoriaId.value
          : this.categoriaId,
      ivaIncluido: data.ivaIncluido.present
          ? data.ivaIncluido.value
          : this.ivaIncluido,
      activo: data.activo.present ? data.activo.value : this.activo,
      empresaId: data.empresaId.present ? data.empresaId.value : this.empresaId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncPending: data.syncPending.present
          ? data.syncPending.value
          : this.syncPending,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableData(')
          ..write('id: $id, ')
          ..write('sku: $sku, ')
          ..write('codigoBarras: $codigoBarras, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('precioVenta: $precioVenta, ')
          ..write('precioCompra: $precioCompra, ')
          ..write('satClave: $satClave, ')
          ..write('satUnidad: $satUnidad, ')
          ..write('categoriaId: $categoriaId, ')
          ..write('ivaIncluido: $ivaIncluido, ')
          ..write('activo: $activo, ')
          ..write('empresaId: $empresaId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncPending: $syncPending')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sku,
    codigoBarras,
    nombre,
    descripcion,
    precioVenta,
    precioCompra,
    satClave,
    satUnidad,
    categoriaId,
    ivaIncluido,
    activo,
    empresaId,
    createdAt,
    updatedAt,
    syncPending,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsTableData &&
          other.id == this.id &&
          other.sku == this.sku &&
          other.codigoBarras == this.codigoBarras &&
          other.nombre == this.nombre &&
          other.descripcion == this.descripcion &&
          other.precioVenta == this.precioVenta &&
          other.precioCompra == this.precioCompra &&
          other.satClave == this.satClave &&
          other.satUnidad == this.satUnidad &&
          other.categoriaId == this.categoriaId &&
          other.ivaIncluido == this.ivaIncluido &&
          other.activo == this.activo &&
          other.empresaId == this.empresaId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncPending == this.syncPending);
}

class ProductsTableCompanion extends UpdateCompanion<ProductsTableData> {
  final Value<String> id;
  final Value<String?> sku;
  final Value<String?> codigoBarras;
  final Value<String> nombre;
  final Value<String?> descripcion;
  final Value<double> precioVenta;
  final Value<double> precioCompra;
  final Value<String?> satClave;
  final Value<String?> satUnidad;
  final Value<String?> categoriaId;
  final Value<bool> ivaIncluido;
  final Value<bool> activo;
  final Value<String> empresaId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> syncPending;
  final Value<int> rowid;
  const ProductsTableCompanion({
    this.id = const Value.absent(),
    this.sku = const Value.absent(),
    this.codigoBarras = const Value.absent(),
    this.nombre = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.precioVenta = const Value.absent(),
    this.precioCompra = const Value.absent(),
    this.satClave = const Value.absent(),
    this.satUnidad = const Value.absent(),
    this.categoriaId = const Value.absent(),
    this.ivaIncluido = const Value.absent(),
    this.activo = const Value.absent(),
    this.empresaId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsTableCompanion.insert({
    required String id,
    this.sku = const Value.absent(),
    this.codigoBarras = const Value.absent(),
    required String nombre,
    this.descripcion = const Value.absent(),
    required double precioVenta,
    required double precioCompra,
    this.satClave = const Value.absent(),
    this.satUnidad = const Value.absent(),
    this.categoriaId = const Value.absent(),
    required bool ivaIncluido,
    required bool activo,
    required String empresaId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nombre = Value(nombre),
       precioVenta = Value(precioVenta),
       precioCompra = Value(precioCompra),
       ivaIncluido = Value(ivaIncluido),
       activo = Value(activo),
       empresaId = Value(empresaId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProductsTableData> custom({
    Expression<String>? id,
    Expression<String>? sku,
    Expression<String>? codigoBarras,
    Expression<String>? nombre,
    Expression<String>? descripcion,
    Expression<double>? precioVenta,
    Expression<double>? precioCompra,
    Expression<String>? satClave,
    Expression<String>? satUnidad,
    Expression<String>? categoriaId,
    Expression<bool>? ivaIncluido,
    Expression<bool>? activo,
    Expression<String>? empresaId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? syncPending,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sku != null) 'sku': sku,
      if (codigoBarras != null) 'codigo_barras': codigoBarras,
      if (nombre != null) 'nombre': nombre,
      if (descripcion != null) 'descripcion': descripcion,
      if (precioVenta != null) 'precio_venta': precioVenta,
      if (precioCompra != null) 'precio_compra': precioCompra,
      if (satClave != null) 'sat_clave': satClave,
      if (satUnidad != null) 'sat_unidad': satUnidad,
      if (categoriaId != null) 'categoria_id': categoriaId,
      if (ivaIncluido != null) 'iva_incluido': ivaIncluido,
      if (activo != null) 'activo': activo,
      if (empresaId != null) 'empresa_id': empresaId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncPending != null) 'sync_pending': syncPending,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsTableCompanion copyWith({
    Value<String>? id,
    Value<String?>? sku,
    Value<String?>? codigoBarras,
    Value<String>? nombre,
    Value<String?>? descripcion,
    Value<double>? precioVenta,
    Value<double>? precioCompra,
    Value<String?>? satClave,
    Value<String?>? satUnidad,
    Value<String?>? categoriaId,
    Value<bool>? ivaIncluido,
    Value<bool>? activo,
    Value<String>? empresaId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? syncPending,
    Value<int>? rowid,
  }) {
    return ProductsTableCompanion(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      codigoBarras: codigoBarras ?? this.codigoBarras,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      precioVenta: precioVenta ?? this.precioVenta,
      precioCompra: precioCompra ?? this.precioCompra,
      satClave: satClave ?? this.satClave,
      satUnidad: satUnidad ?? this.satUnidad,
      categoriaId: categoriaId ?? this.categoriaId,
      ivaIncluido: ivaIncluido ?? this.ivaIncluido,
      activo: activo ?? this.activo,
      empresaId: empresaId ?? this.empresaId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncPending: syncPending ?? this.syncPending,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (codigoBarras.present) {
      map['codigo_barras'] = Variable<String>(codigoBarras.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (precioVenta.present) {
      map['precio_venta'] = Variable<double>(precioVenta.value);
    }
    if (precioCompra.present) {
      map['precio_compra'] = Variable<double>(precioCompra.value);
    }
    if (satClave.present) {
      map['sat_clave'] = Variable<String>(satClave.value);
    }
    if (satUnidad.present) {
      map['sat_unidad'] = Variable<String>(satUnidad.value);
    }
    if (categoriaId.present) {
      map['categoria_id'] = Variable<String>(categoriaId.value);
    }
    if (ivaIncluido.present) {
      map['iva_incluido'] = Variable<bool>(ivaIncluido.value);
    }
    if (activo.present) {
      map['activo'] = Variable<bool>(activo.value);
    }
    if (empresaId.present) {
      map['empresa_id'] = Variable<String>(empresaId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncPending.present) {
      map['sync_pending'] = Variable<bool>(syncPending.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('sku: $sku, ')
          ..write('codigoBarras: $codigoBarras, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('precioVenta: $precioVenta, ')
          ..write('precioCompra: $precioCompra, ')
          ..write('satClave: $satClave, ')
          ..write('satUnidad: $satUnidad, ')
          ..write('categoriaId: $categoriaId, ')
          ..write('ivaIncluido: $ivaIncluido, ')
          ..write('activo: $activo, ')
          ..write('empresaId: $empresaId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncPending: $syncPending, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTableTable productsTable = $ProductsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productsTable];
}

typedef $$ProductsTableTableCreateCompanionBuilder =
    ProductsTableCompanion Function({
      required String id,
      Value<String?> sku,
      Value<String?> codigoBarras,
      required String nombre,
      Value<String?> descripcion,
      required double precioVenta,
      required double precioCompra,
      Value<String?> satClave,
      Value<String?> satUnidad,
      Value<String?> categoriaId,
      required bool ivaIncluido,
      required bool activo,
      required String empresaId,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> syncPending,
      Value<int> rowid,
    });
typedef $$ProductsTableTableUpdateCompanionBuilder =
    ProductsTableCompanion Function({
      Value<String> id,
      Value<String?> sku,
      Value<String?> codigoBarras,
      Value<String> nombre,
      Value<String?> descripcion,
      Value<double> precioVenta,
      Value<double> precioCompra,
      Value<String?> satClave,
      Value<String?> satUnidad,
      Value<String?> categoriaId,
      Value<bool> ivaIncluido,
      Value<bool> activo,
      Value<String> empresaId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> syncPending,
      Value<int> rowid,
    });

class $$ProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codigoBarras => $composableBuilder(
    column: $table.codigoBarras,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precioVenta => $composableBuilder(
    column: $table.precioVenta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precioCompra => $composableBuilder(
    column: $table.precioCompra,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get satClave => $composableBuilder(
    column: $table.satClave,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get satUnidad => $composableBuilder(
    column: $table.satUnidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoriaId => $composableBuilder(
    column: $table.categoriaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get ivaIncluido => $composableBuilder(
    column: $table.ivaIncluido,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get activo => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get empresaId => $composableBuilder(
    column: $table.empresaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get syncPending => $composableBuilder(
    column: $table.syncPending,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codigoBarras => $composableBuilder(
    column: $table.codigoBarras,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precioVenta => $composableBuilder(
    column: $table.precioVenta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precioCompra => $composableBuilder(
    column: $table.precioCompra,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get satClave => $composableBuilder(
    column: $table.satClave,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get satUnidad => $composableBuilder(
    column: $table.satUnidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoriaId => $composableBuilder(
    column: $table.categoriaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get ivaIncluido => $composableBuilder(
    column: $table.ivaIncluido,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get activo => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get empresaId => $composableBuilder(
    column: $table.empresaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get syncPending => $composableBuilder(
    column: $table.syncPending,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get codigoBarras => $composableBuilder(
    column: $table.codigoBarras,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<double> get precioVenta => $composableBuilder(
    column: $table.precioVenta,
    builder: (column) => column,
  );

  GeneratedColumn<double> get precioCompra => $composableBuilder(
    column: $table.precioCompra,
    builder: (column) => column,
  );

  GeneratedColumn<String> get satClave =>
      $composableBuilder(column: $table.satClave, builder: (column) => column);

  GeneratedColumn<String> get satUnidad =>
      $composableBuilder(column: $table.satUnidad, builder: (column) => column);

  GeneratedColumn<String> get categoriaId => $composableBuilder(
    column: $table.categoriaId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get ivaIncluido => $composableBuilder(
    column: $table.ivaIncluido,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get activo =>
      $composableBuilder(column: $table.activo, builder: (column) => column);

  GeneratedColumn<String> get empresaId =>
      $composableBuilder(column: $table.empresaId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get syncPending => $composableBuilder(
    column: $table.syncPending,
    builder: (column) => column,
  );
}

class $$ProductsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTableTable,
          ProductsTableData,
          $$ProductsTableTableFilterComposer,
          $$ProductsTableTableOrderingComposer,
          $$ProductsTableTableAnnotationComposer,
          $$ProductsTableTableCreateCompanionBuilder,
          $$ProductsTableTableUpdateCompanionBuilder,
          (
            ProductsTableData,
            BaseReferences<
              _$AppDatabase,
              $ProductsTableTable,
              ProductsTableData
            >,
          ),
          ProductsTableData,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableTableManager(_$AppDatabase db, $ProductsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> sku = const Value.absent(),
                Value<String?> codigoBarras = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<double> precioVenta = const Value.absent(),
                Value<double> precioCompra = const Value.absent(),
                Value<String?> satClave = const Value.absent(),
                Value<String?> satUnidad = const Value.absent(),
                Value<String?> categoriaId = const Value.absent(),
                Value<bool> ivaIncluido = const Value.absent(),
                Value<bool> activo = const Value.absent(),
                Value<String> empresaId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> syncPending = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsTableCompanion(
                id: id,
                sku: sku,
                codigoBarras: codigoBarras,
                nombre: nombre,
                descripcion: descripcion,
                precioVenta: precioVenta,
                precioCompra: precioCompra,
                satClave: satClave,
                satUnidad: satUnidad,
                categoriaId: categoriaId,
                ivaIncluido: ivaIncluido,
                activo: activo,
                empresaId: empresaId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncPending: syncPending,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> sku = const Value.absent(),
                Value<String?> codigoBarras = const Value.absent(),
                required String nombre,
                Value<String?> descripcion = const Value.absent(),
                required double precioVenta,
                required double precioCompra,
                Value<String?> satClave = const Value.absent(),
                Value<String?> satUnidad = const Value.absent(),
                Value<String?> categoriaId = const Value.absent(),
                required bool ivaIncluido,
                required bool activo,
                required String empresaId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> syncPending = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsTableCompanion.insert(
                id: id,
                sku: sku,
                codigoBarras: codigoBarras,
                nombre: nombre,
                descripcion: descripcion,
                precioVenta: precioVenta,
                precioCompra: precioCompra,
                satClave: satClave,
                satUnidad: satUnidad,
                categoriaId: categoriaId,
                ivaIncluido: ivaIncluido,
                activo: activo,
                empresaId: empresaId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncPending: syncPending,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTableTable,
      ProductsTableData,
      $$ProductsTableTableFilterComposer,
      $$ProductsTableTableOrderingComposer,
      $$ProductsTableTableAnnotationComposer,
      $$ProductsTableTableCreateCompanionBuilder,
      $$ProductsTableTableUpdateCompanionBuilder,
      (
        ProductsTableData,
        BaseReferences<_$AppDatabase, $ProductsTableTable, ProductsTableData>,
      ),
      ProductsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableTableManager get productsTable =>
      $$ProductsTableTableTableManager(_db, _db.productsTable);
}
