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

class $SATCatalogItemTableTable extends SATCatalogItemTable
    with TableInfo<$SATCatalogItemTableTable, SATCatalogItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SATCatalogItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
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
  static const VerificationMeta _extraJsonMeta = const VerificationMeta(
    'extraJson',
  );
  @override
  late final GeneratedColumn<String> extraJson = GeneratedColumn<String>(
    'extra_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
    'synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    code,
    description,
    extraJson,
    updatedAt,
    deletedAt,
    synced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 's_a_t_catalog_item_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SATCatalogItemTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
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
    if (data.containsKey('extra_json')) {
      context.handle(
        _extraJsonMeta,
        extraJson.isAcceptableOrUnknown(data['extra_json']!, _extraJsonMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('synced')) {
      context.handle(
        _syncedMeta,
        synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SATCatalogItemTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SATCatalogItemTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      extraJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extra_json'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      synced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}synced'],
      )!,
    );
  }

  @override
  $SATCatalogItemTableTable createAlias(String alias) {
    return $SATCatalogItemTableTable(attachedDatabase, alias);
  }
}

class SATCatalogItemTableData extends DataClass
    implements Insertable<SATCatalogItemTableData> {
  final String id;
  final String type;
  final String code;
  final String description;
  final String? extraJson;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool synced;
  const SATCatalogItemTableData({
    required this.id,
    required this.type,
    required this.code,
    required this.description,
    this.extraJson,
    required this.updatedAt,
    this.deletedAt,
    required this.synced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['code'] = Variable<String>(code);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || extraJson != null) {
      map['extra_json'] = Variable<String>(extraJson);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  SATCatalogItemTableCompanion toCompanion(bool nullToAbsent) {
    return SATCatalogItemTableCompanion(
      id: Value(id),
      type: Value(type),
      code: Value(code),
      description: Value(description),
      extraJson: extraJson == null && nullToAbsent
          ? const Value.absent()
          : Value(extraJson),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      synced: Value(synced),
    );
  }

  factory SATCatalogItemTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SATCatalogItemTableData(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      code: serializer.fromJson<String>(json['code']),
      description: serializer.fromJson<String>(json['description']),
      extraJson: serializer.fromJson<String?>(json['extraJson']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'code': serializer.toJson<String>(code),
      'description': serializer.toJson<String>(description),
      'extraJson': serializer.toJson<String?>(extraJson),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  SATCatalogItemTableData copyWith({
    String? id,
    String? type,
    String? code,
    String? description,
    Value<String?> extraJson = const Value.absent(),
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    bool? synced,
  }) => SATCatalogItemTableData(
    id: id ?? this.id,
    type: type ?? this.type,
    code: code ?? this.code,
    description: description ?? this.description,
    extraJson: extraJson.present ? extraJson.value : this.extraJson,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    synced: synced ?? this.synced,
  );
  SATCatalogItemTableData copyWithCompanion(SATCatalogItemTableCompanion data) {
    return SATCatalogItemTableData(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      code: data.code.present ? data.code.value : this.code,
      description: data.description.present
          ? data.description.value
          : this.description,
      extraJson: data.extraJson.present ? data.extraJson.value : this.extraJson,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      synced: data.synced.present ? data.synced.value : this.synced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SATCatalogItemTableData(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('extraJson: $extraJson, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    type,
    code,
    description,
    extraJson,
    updatedAt,
    deletedAt,
    synced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SATCatalogItemTableData &&
          other.id == this.id &&
          other.type == this.type &&
          other.code == this.code &&
          other.description == this.description &&
          other.extraJson == this.extraJson &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.synced == this.synced);
}

class SATCatalogItemTableCompanion
    extends UpdateCompanion<SATCatalogItemTableData> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> code;
  final Value<String> description;
  final Value<String?> extraJson;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> synced;
  final Value<int> rowid;
  const SATCatalogItemTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.code = const Value.absent(),
    this.description = const Value.absent(),
    this.extraJson = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.synced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SATCatalogItemTableCompanion.insert({
    required String id,
    required String type,
    required String code,
    required String description,
    this.extraJson = const Value.absent(),
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.synced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       code = Value(code),
       description = Value(description),
       updatedAt = Value(updatedAt);
  static Insertable<SATCatalogItemTableData> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? code,
    Expression<String>? description,
    Expression<String>? extraJson,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? synced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (code != null) 'code': code,
      if (description != null) 'description': description,
      if (extraJson != null) 'extra_json': extraJson,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (synced != null) 'synced': synced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SATCatalogItemTableCompanion copyWith({
    Value<String>? id,
    Value<String>? type,
    Value<String>? code,
    Value<String>? description,
    Value<String?>? extraJson,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<bool>? synced,
    Value<int>? rowid,
  }) {
    return SATCatalogItemTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      code: code ?? this.code,
      description: description ?? this.description,
      extraJson: extraJson ?? this.extraJson,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      synced: synced ?? this.synced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (extraJson.present) {
      map['extra_json'] = Variable<String>(extraJson.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SATCatalogItemTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('extraJson: $extraJson, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('synced: $synced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VentasLocalTableTable extends VentasLocalTable
    with TableInfo<$VentasLocalTableTable, VentasLocalTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VentasLocalTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<String> usuarioId = GeneratedColumn<String>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sucursalIdMeta = const VerificationMeta(
    'sucursalId',
  );
  @override
  late final GeneratedColumn<String> sucursalId = GeneratedColumn<String>(
    'sucursal_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _formaPagoMeta = const VerificationMeta(
    'formaPago',
  );
  @override
  late final GeneratedColumn<String> formaPago = GeneratedColumn<String>(
    'forma_pago',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _metodoPagoMeta = const VerificationMeta(
    'metodoPago',
  );
  @override
  late final GeneratedColumn<String> metodoPago = GeneratedColumn<String>(
    'metodo_pago',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usoCfdiMeta = const VerificationMeta(
    'usoCfdi',
  );
  @override
  late final GeneratedColumn<String> usoCfdi = GeneratedColumn<String>(
    'uso_cfdi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ivaMeta = const VerificationMeta('iva');
  @override
  late final GeneratedColumn<double> iva = GeneratedColumn<double>(
    'iva',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
    'estado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _backendIdMeta = const VerificationMeta(
    'backendId',
  );
  @override
  late final GeneratedColumn<String> backendId = GeneratedColumn<String>(
    'backend_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    empresaId,
    usuarioId,
    sucursalId,
    formaPago,
    metodoPago,
    usoCfdi,
    subtotal,
    iva,
    total,
    estado,
    backendId,
    payloadJson,
    errorMessage,
    createdAt,
    updatedAt,
    syncPending,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ventas_local_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<VentasLocalTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('empresa_id')) {
      context.handle(
        _empresaIdMeta,
        empresaId.isAcceptableOrUnknown(data['empresa_id']!, _empresaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_empresaIdMeta);
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (data.containsKey('sucursal_id')) {
      context.handle(
        _sucursalIdMeta,
        sucursalId.isAcceptableOrUnknown(data['sucursal_id']!, _sucursalIdMeta),
      );
    }
    if (data.containsKey('forma_pago')) {
      context.handle(
        _formaPagoMeta,
        formaPago.isAcceptableOrUnknown(data['forma_pago']!, _formaPagoMeta),
      );
    } else if (isInserting) {
      context.missing(_formaPagoMeta);
    }
    if (data.containsKey('metodo_pago')) {
      context.handle(
        _metodoPagoMeta,
        metodoPago.isAcceptableOrUnknown(data['metodo_pago']!, _metodoPagoMeta),
      );
    } else if (isInserting) {
      context.missing(_metodoPagoMeta);
    }
    if (data.containsKey('uso_cfdi')) {
      context.handle(
        _usoCfdiMeta,
        usoCfdi.isAcceptableOrUnknown(data['uso_cfdi']!, _usoCfdiMeta),
      );
    } else if (isInserting) {
      context.missing(_usoCfdiMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('iva')) {
      context.handle(
        _ivaMeta,
        iva.isAcceptableOrUnknown(data['iva']!, _ivaMeta),
      );
    } else if (isInserting) {
      context.missing(_ivaMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(
        _estadoMeta,
        estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta),
      );
    }
    if (data.containsKey('backend_id')) {
      context.handle(
        _backendIdMeta,
        backendId.isAcceptableOrUnknown(data['backend_id']!, _backendIdMeta),
      );
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
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
  VentasLocalTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VentasLocalTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      empresaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}empresa_id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usuario_id'],
      )!,
      sucursalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sucursal_id'],
      ),
      formaPago: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}forma_pago'],
      )!,
      metodoPago: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metodo_pago'],
      )!,
      usoCfdi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uso_cfdi'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
      iva: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}iva'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total'],
      )!,
      estado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado'],
      )!,
      backendId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backend_id'],
      ),
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      )!,
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
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
  $VentasLocalTableTable createAlias(String alias) {
    return $VentasLocalTableTable(attachedDatabase, alias);
  }
}

class VentasLocalTableData extends DataClass
    implements Insertable<VentasLocalTableData> {
  final String id;
  final String empresaId;
  final String usuarioId;
  final String? sucursalId;
  final String formaPago;
  final String metodoPago;
  final String usoCfdi;
  final double subtotal;
  final double iva;
  final double total;
  final String estado;
  final String? backendId;
  final String payloadJson;
  final String? errorMessage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool syncPending;
  const VentasLocalTableData({
    required this.id,
    required this.empresaId,
    required this.usuarioId,
    this.sucursalId,
    required this.formaPago,
    required this.metodoPago,
    required this.usoCfdi,
    required this.subtotal,
    required this.iva,
    required this.total,
    required this.estado,
    this.backendId,
    required this.payloadJson,
    this.errorMessage,
    required this.createdAt,
    required this.updatedAt,
    required this.syncPending,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['empresa_id'] = Variable<String>(empresaId);
    map['usuario_id'] = Variable<String>(usuarioId);
    if (!nullToAbsent || sucursalId != null) {
      map['sucursal_id'] = Variable<String>(sucursalId);
    }
    map['forma_pago'] = Variable<String>(formaPago);
    map['metodo_pago'] = Variable<String>(metodoPago);
    map['uso_cfdi'] = Variable<String>(usoCfdi);
    map['subtotal'] = Variable<double>(subtotal);
    map['iva'] = Variable<double>(iva);
    map['total'] = Variable<double>(total);
    map['estado'] = Variable<String>(estado);
    if (!nullToAbsent || backendId != null) {
      map['backend_id'] = Variable<String>(backendId);
    }
    map['payload_json'] = Variable<String>(payloadJson);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_pending'] = Variable<bool>(syncPending);
    return map;
  }

  VentasLocalTableCompanion toCompanion(bool nullToAbsent) {
    return VentasLocalTableCompanion(
      id: Value(id),
      empresaId: Value(empresaId),
      usuarioId: Value(usuarioId),
      sucursalId: sucursalId == null && nullToAbsent
          ? const Value.absent()
          : Value(sucursalId),
      formaPago: Value(formaPago),
      metodoPago: Value(metodoPago),
      usoCfdi: Value(usoCfdi),
      subtotal: Value(subtotal),
      iva: Value(iva),
      total: Value(total),
      estado: Value(estado),
      backendId: backendId == null && nullToAbsent
          ? const Value.absent()
          : Value(backendId),
      payloadJson: Value(payloadJson),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncPending: Value(syncPending),
    );
  }

  factory VentasLocalTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VentasLocalTableData(
      id: serializer.fromJson<String>(json['id']),
      empresaId: serializer.fromJson<String>(json['empresaId']),
      usuarioId: serializer.fromJson<String>(json['usuarioId']),
      sucursalId: serializer.fromJson<String?>(json['sucursalId']),
      formaPago: serializer.fromJson<String>(json['formaPago']),
      metodoPago: serializer.fromJson<String>(json['metodoPago']),
      usoCfdi: serializer.fromJson<String>(json['usoCfdi']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      iva: serializer.fromJson<double>(json['iva']),
      total: serializer.fromJson<double>(json['total']),
      estado: serializer.fromJson<String>(json['estado']),
      backendId: serializer.fromJson<String?>(json['backendId']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
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
      'empresaId': serializer.toJson<String>(empresaId),
      'usuarioId': serializer.toJson<String>(usuarioId),
      'sucursalId': serializer.toJson<String?>(sucursalId),
      'formaPago': serializer.toJson<String>(formaPago),
      'metodoPago': serializer.toJson<String>(metodoPago),
      'usoCfdi': serializer.toJson<String>(usoCfdi),
      'subtotal': serializer.toJson<double>(subtotal),
      'iva': serializer.toJson<double>(iva),
      'total': serializer.toJson<double>(total),
      'estado': serializer.toJson<String>(estado),
      'backendId': serializer.toJson<String?>(backendId),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncPending': serializer.toJson<bool>(syncPending),
    };
  }

  VentasLocalTableData copyWith({
    String? id,
    String? empresaId,
    String? usuarioId,
    Value<String?> sucursalId = const Value.absent(),
    String? formaPago,
    String? metodoPago,
    String? usoCfdi,
    double? subtotal,
    double? iva,
    double? total,
    String? estado,
    Value<String?> backendId = const Value.absent(),
    String? payloadJson,
    Value<String?> errorMessage = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? syncPending,
  }) => VentasLocalTableData(
    id: id ?? this.id,
    empresaId: empresaId ?? this.empresaId,
    usuarioId: usuarioId ?? this.usuarioId,
    sucursalId: sucursalId.present ? sucursalId.value : this.sucursalId,
    formaPago: formaPago ?? this.formaPago,
    metodoPago: metodoPago ?? this.metodoPago,
    usoCfdi: usoCfdi ?? this.usoCfdi,
    subtotal: subtotal ?? this.subtotal,
    iva: iva ?? this.iva,
    total: total ?? this.total,
    estado: estado ?? this.estado,
    backendId: backendId.present ? backendId.value : this.backendId,
    payloadJson: payloadJson ?? this.payloadJson,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncPending: syncPending ?? this.syncPending,
  );
  VentasLocalTableData copyWithCompanion(VentasLocalTableCompanion data) {
    return VentasLocalTableData(
      id: data.id.present ? data.id.value : this.id,
      empresaId: data.empresaId.present ? data.empresaId.value : this.empresaId,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      sucursalId: data.sucursalId.present
          ? data.sucursalId.value
          : this.sucursalId,
      formaPago: data.formaPago.present ? data.formaPago.value : this.formaPago,
      metodoPago: data.metodoPago.present
          ? data.metodoPago.value
          : this.metodoPago,
      usoCfdi: data.usoCfdi.present ? data.usoCfdi.value : this.usoCfdi,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      iva: data.iva.present ? data.iva.value : this.iva,
      total: data.total.present ? data.total.value : this.total,
      estado: data.estado.present ? data.estado.value : this.estado,
      backendId: data.backendId.present ? data.backendId.value : this.backendId,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncPending: data.syncPending.present
          ? data.syncPending.value
          : this.syncPending,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VentasLocalTableData(')
          ..write('id: $id, ')
          ..write('empresaId: $empresaId, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('sucursalId: $sucursalId, ')
          ..write('formaPago: $formaPago, ')
          ..write('metodoPago: $metodoPago, ')
          ..write('usoCfdi: $usoCfdi, ')
          ..write('subtotal: $subtotal, ')
          ..write('iva: $iva, ')
          ..write('total: $total, ')
          ..write('estado: $estado, ')
          ..write('backendId: $backendId, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncPending: $syncPending')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    empresaId,
    usuarioId,
    sucursalId,
    formaPago,
    metodoPago,
    usoCfdi,
    subtotal,
    iva,
    total,
    estado,
    backendId,
    payloadJson,
    errorMessage,
    createdAt,
    updatedAt,
    syncPending,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VentasLocalTableData &&
          other.id == this.id &&
          other.empresaId == this.empresaId &&
          other.usuarioId == this.usuarioId &&
          other.sucursalId == this.sucursalId &&
          other.formaPago == this.formaPago &&
          other.metodoPago == this.metodoPago &&
          other.usoCfdi == this.usoCfdi &&
          other.subtotal == this.subtotal &&
          other.iva == this.iva &&
          other.total == this.total &&
          other.estado == this.estado &&
          other.backendId == this.backendId &&
          other.payloadJson == this.payloadJson &&
          other.errorMessage == this.errorMessage &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncPending == this.syncPending);
}

class VentasLocalTableCompanion extends UpdateCompanion<VentasLocalTableData> {
  final Value<String> id;
  final Value<String> empresaId;
  final Value<String> usuarioId;
  final Value<String?> sucursalId;
  final Value<String> formaPago;
  final Value<String> metodoPago;
  final Value<String> usoCfdi;
  final Value<double> subtotal;
  final Value<double> iva;
  final Value<double> total;
  final Value<String> estado;
  final Value<String?> backendId;
  final Value<String> payloadJson;
  final Value<String?> errorMessage;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> syncPending;
  final Value<int> rowid;
  const VentasLocalTableCompanion({
    this.id = const Value.absent(),
    this.empresaId = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.sucursalId = const Value.absent(),
    this.formaPago = const Value.absent(),
    this.metodoPago = const Value.absent(),
    this.usoCfdi = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.iva = const Value.absent(),
    this.total = const Value.absent(),
    this.estado = const Value.absent(),
    this.backendId = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VentasLocalTableCompanion.insert({
    required String id,
    required String empresaId,
    required String usuarioId,
    this.sucursalId = const Value.absent(),
    required String formaPago,
    required String metodoPago,
    required String usoCfdi,
    required double subtotal,
    required double iva,
    required double total,
    this.estado = const Value.absent(),
    this.backendId = const Value.absent(),
    required String payloadJson,
    this.errorMessage = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       empresaId = Value(empresaId),
       usuarioId = Value(usuarioId),
       formaPago = Value(formaPago),
       metodoPago = Value(metodoPago),
       usoCfdi = Value(usoCfdi),
       subtotal = Value(subtotal),
       iva = Value(iva),
       total = Value(total),
       payloadJson = Value(payloadJson),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<VentasLocalTableData> custom({
    Expression<String>? id,
    Expression<String>? empresaId,
    Expression<String>? usuarioId,
    Expression<String>? sucursalId,
    Expression<String>? formaPago,
    Expression<String>? metodoPago,
    Expression<String>? usoCfdi,
    Expression<double>? subtotal,
    Expression<double>? iva,
    Expression<double>? total,
    Expression<String>? estado,
    Expression<String>? backendId,
    Expression<String>? payloadJson,
    Expression<String>? errorMessage,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? syncPending,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (empresaId != null) 'empresa_id': empresaId,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (sucursalId != null) 'sucursal_id': sucursalId,
      if (formaPago != null) 'forma_pago': formaPago,
      if (metodoPago != null) 'metodo_pago': metodoPago,
      if (usoCfdi != null) 'uso_cfdi': usoCfdi,
      if (subtotal != null) 'subtotal': subtotal,
      if (iva != null) 'iva': iva,
      if (total != null) 'total': total,
      if (estado != null) 'estado': estado,
      if (backendId != null) 'backend_id': backendId,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (errorMessage != null) 'error_message': errorMessage,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncPending != null) 'sync_pending': syncPending,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VentasLocalTableCompanion copyWith({
    Value<String>? id,
    Value<String>? empresaId,
    Value<String>? usuarioId,
    Value<String?>? sucursalId,
    Value<String>? formaPago,
    Value<String>? metodoPago,
    Value<String>? usoCfdi,
    Value<double>? subtotal,
    Value<double>? iva,
    Value<double>? total,
    Value<String>? estado,
    Value<String?>? backendId,
    Value<String>? payloadJson,
    Value<String?>? errorMessage,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? syncPending,
    Value<int>? rowid,
  }) {
    return VentasLocalTableCompanion(
      id: id ?? this.id,
      empresaId: empresaId ?? this.empresaId,
      usuarioId: usuarioId ?? this.usuarioId,
      sucursalId: sucursalId ?? this.sucursalId,
      formaPago: formaPago ?? this.formaPago,
      metodoPago: metodoPago ?? this.metodoPago,
      usoCfdi: usoCfdi ?? this.usoCfdi,
      subtotal: subtotal ?? this.subtotal,
      iva: iva ?? this.iva,
      total: total ?? this.total,
      estado: estado ?? this.estado,
      backendId: backendId ?? this.backendId,
      payloadJson: payloadJson ?? this.payloadJson,
      errorMessage: errorMessage ?? this.errorMessage,
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
    if (empresaId.present) {
      map['empresa_id'] = Variable<String>(empresaId.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<String>(usuarioId.value);
    }
    if (sucursalId.present) {
      map['sucursal_id'] = Variable<String>(sucursalId.value);
    }
    if (formaPago.present) {
      map['forma_pago'] = Variable<String>(formaPago.value);
    }
    if (metodoPago.present) {
      map['metodo_pago'] = Variable<String>(metodoPago.value);
    }
    if (usoCfdi.present) {
      map['uso_cfdi'] = Variable<String>(usoCfdi.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (iva.present) {
      map['iva'] = Variable<double>(iva.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (backendId.present) {
      map['backend_id'] = Variable<String>(backendId.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
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
    return (StringBuffer('VentasLocalTableCompanion(')
          ..write('id: $id, ')
          ..write('empresaId: $empresaId, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('sucursalId: $sucursalId, ')
          ..write('formaPago: $formaPago, ')
          ..write('metodoPago: $metodoPago, ')
          ..write('usoCfdi: $usoCfdi, ')
          ..write('subtotal: $subtotal, ')
          ..write('iva: $iva, ')
          ..write('total: $total, ')
          ..write('estado: $estado, ')
          ..write('backendId: $backendId, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncPending: $syncPending, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VentaItemsLocalTableTable extends VentaItemsLocalTable
    with TableInfo<$VentaItemsLocalTableTable, VentaItemsLocalTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VentaItemsLocalTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ventaIdMeta = const VerificationMeta(
    'ventaId',
  );
  @override
  late final GeneratedColumn<String> ventaId = GeneratedColumn<String>(
    'venta_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productoIdMeta = const VerificationMeta(
    'productoId',
  );
  @override
  late final GeneratedColumn<String> productoId = GeneratedColumn<String>(
    'producto_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productoNombreMeta = const VerificationMeta(
    'productoNombre',
  );
  @override
  late final GeneratedColumn<String> productoNombre = GeneratedColumn<String>(
    'producto_nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cantidadMeta = const VerificationMeta(
    'cantidad',
  );
  @override
  late final GeneratedColumn<int> cantidad = GeneratedColumn<int>(
    'cantidad',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precioUnitarioMeta = const VerificationMeta(
    'precioUnitario',
  );
  @override
  late final GeneratedColumn<double> precioUnitario = GeneratedColumn<double>(
    'precio_unitario',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ventaId,
    productoId,
    productoNombre,
    cantidad,
    precioUnitario,
    subtotal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'venta_items_local_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<VentaItemsLocalTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('venta_id')) {
      context.handle(
        _ventaIdMeta,
        ventaId.isAcceptableOrUnknown(data['venta_id']!, _ventaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ventaIdMeta);
    }
    if (data.containsKey('producto_id')) {
      context.handle(
        _productoIdMeta,
        productoId.isAcceptableOrUnknown(data['producto_id']!, _productoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productoIdMeta);
    }
    if (data.containsKey('producto_nombre')) {
      context.handle(
        _productoNombreMeta,
        productoNombre.isAcceptableOrUnknown(
          data['producto_nombre']!,
          _productoNombreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productoNombreMeta);
    }
    if (data.containsKey('cantidad')) {
      context.handle(
        _cantidadMeta,
        cantidad.isAcceptableOrUnknown(data['cantidad']!, _cantidadMeta),
      );
    } else if (isInserting) {
      context.missing(_cantidadMeta);
    }
    if (data.containsKey('precio_unitario')) {
      context.handle(
        _precioUnitarioMeta,
        precioUnitario.isAcceptableOrUnknown(
          data['precio_unitario']!,
          _precioUnitarioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precioUnitarioMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VentaItemsLocalTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VentaItemsLocalTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ventaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}venta_id'],
      )!,
      productoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}producto_id'],
      )!,
      productoNombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}producto_nombre'],
      )!,
      cantidad: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cantidad'],
      )!,
      precioUnitario: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precio_unitario'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
    );
  }

  @override
  $VentaItemsLocalTableTable createAlias(String alias) {
    return $VentaItemsLocalTableTable(attachedDatabase, alias);
  }
}

class VentaItemsLocalTableData extends DataClass
    implements Insertable<VentaItemsLocalTableData> {
  final String id;
  final String ventaId;
  final String productoId;
  final String productoNombre;
  final int cantidad;
  final double precioUnitario;
  final double subtotal;
  const VentaItemsLocalTableData({
    required this.id,
    required this.ventaId,
    required this.productoId,
    required this.productoNombre,
    required this.cantidad,
    required this.precioUnitario,
    required this.subtotal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['venta_id'] = Variable<String>(ventaId);
    map['producto_id'] = Variable<String>(productoId);
    map['producto_nombre'] = Variable<String>(productoNombre);
    map['cantidad'] = Variable<int>(cantidad);
    map['precio_unitario'] = Variable<double>(precioUnitario);
    map['subtotal'] = Variable<double>(subtotal);
    return map;
  }

  VentaItemsLocalTableCompanion toCompanion(bool nullToAbsent) {
    return VentaItemsLocalTableCompanion(
      id: Value(id),
      ventaId: Value(ventaId),
      productoId: Value(productoId),
      productoNombre: Value(productoNombre),
      cantidad: Value(cantidad),
      precioUnitario: Value(precioUnitario),
      subtotal: Value(subtotal),
    );
  }

  factory VentaItemsLocalTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VentaItemsLocalTableData(
      id: serializer.fromJson<String>(json['id']),
      ventaId: serializer.fromJson<String>(json['ventaId']),
      productoId: serializer.fromJson<String>(json['productoId']),
      productoNombre: serializer.fromJson<String>(json['productoNombre']),
      cantidad: serializer.fromJson<int>(json['cantidad']),
      precioUnitario: serializer.fromJson<double>(json['precioUnitario']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ventaId': serializer.toJson<String>(ventaId),
      'productoId': serializer.toJson<String>(productoId),
      'productoNombre': serializer.toJson<String>(productoNombre),
      'cantidad': serializer.toJson<int>(cantidad),
      'precioUnitario': serializer.toJson<double>(precioUnitario),
      'subtotal': serializer.toJson<double>(subtotal),
    };
  }

  VentaItemsLocalTableData copyWith({
    String? id,
    String? ventaId,
    String? productoId,
    String? productoNombre,
    int? cantidad,
    double? precioUnitario,
    double? subtotal,
  }) => VentaItemsLocalTableData(
    id: id ?? this.id,
    ventaId: ventaId ?? this.ventaId,
    productoId: productoId ?? this.productoId,
    productoNombre: productoNombre ?? this.productoNombre,
    cantidad: cantidad ?? this.cantidad,
    precioUnitario: precioUnitario ?? this.precioUnitario,
    subtotal: subtotal ?? this.subtotal,
  );
  VentaItemsLocalTableData copyWithCompanion(
    VentaItemsLocalTableCompanion data,
  ) {
    return VentaItemsLocalTableData(
      id: data.id.present ? data.id.value : this.id,
      ventaId: data.ventaId.present ? data.ventaId.value : this.ventaId,
      productoId: data.productoId.present
          ? data.productoId.value
          : this.productoId,
      productoNombre: data.productoNombre.present
          ? data.productoNombre.value
          : this.productoNombre,
      cantidad: data.cantidad.present ? data.cantidad.value : this.cantidad,
      precioUnitario: data.precioUnitario.present
          ? data.precioUnitario.value
          : this.precioUnitario,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VentaItemsLocalTableData(')
          ..write('id: $id, ')
          ..write('ventaId: $ventaId, ')
          ..write('productoId: $productoId, ')
          ..write('productoNombre: $productoNombre, ')
          ..write('cantidad: $cantidad, ')
          ..write('precioUnitario: $precioUnitario, ')
          ..write('subtotal: $subtotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ventaId,
    productoId,
    productoNombre,
    cantidad,
    precioUnitario,
    subtotal,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VentaItemsLocalTableData &&
          other.id == this.id &&
          other.ventaId == this.ventaId &&
          other.productoId == this.productoId &&
          other.productoNombre == this.productoNombre &&
          other.cantidad == this.cantidad &&
          other.precioUnitario == this.precioUnitario &&
          other.subtotal == this.subtotal);
}

class VentaItemsLocalTableCompanion
    extends UpdateCompanion<VentaItemsLocalTableData> {
  final Value<String> id;
  final Value<String> ventaId;
  final Value<String> productoId;
  final Value<String> productoNombre;
  final Value<int> cantidad;
  final Value<double> precioUnitario;
  final Value<double> subtotal;
  final Value<int> rowid;
  const VentaItemsLocalTableCompanion({
    this.id = const Value.absent(),
    this.ventaId = const Value.absent(),
    this.productoId = const Value.absent(),
    this.productoNombre = const Value.absent(),
    this.cantidad = const Value.absent(),
    this.precioUnitario = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VentaItemsLocalTableCompanion.insert({
    required String id,
    required String ventaId,
    required String productoId,
    required String productoNombre,
    required int cantidad,
    required double precioUnitario,
    required double subtotal,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ventaId = Value(ventaId),
       productoId = Value(productoId),
       productoNombre = Value(productoNombre),
       cantidad = Value(cantidad),
       precioUnitario = Value(precioUnitario),
       subtotal = Value(subtotal);
  static Insertable<VentaItemsLocalTableData> custom({
    Expression<String>? id,
    Expression<String>? ventaId,
    Expression<String>? productoId,
    Expression<String>? productoNombre,
    Expression<int>? cantidad,
    Expression<double>? precioUnitario,
    Expression<double>? subtotal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ventaId != null) 'venta_id': ventaId,
      if (productoId != null) 'producto_id': productoId,
      if (productoNombre != null) 'producto_nombre': productoNombre,
      if (cantidad != null) 'cantidad': cantidad,
      if (precioUnitario != null) 'precio_unitario': precioUnitario,
      if (subtotal != null) 'subtotal': subtotal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VentaItemsLocalTableCompanion copyWith({
    Value<String>? id,
    Value<String>? ventaId,
    Value<String>? productoId,
    Value<String>? productoNombre,
    Value<int>? cantidad,
    Value<double>? precioUnitario,
    Value<double>? subtotal,
    Value<int>? rowid,
  }) {
    return VentaItemsLocalTableCompanion(
      id: id ?? this.id,
      ventaId: ventaId ?? this.ventaId,
      productoId: productoId ?? this.productoId,
      productoNombre: productoNombre ?? this.productoNombre,
      cantidad: cantidad ?? this.cantidad,
      precioUnitario: precioUnitario ?? this.precioUnitario,
      subtotal: subtotal ?? this.subtotal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ventaId.present) {
      map['venta_id'] = Variable<String>(ventaId.value);
    }
    if (productoId.present) {
      map['producto_id'] = Variable<String>(productoId.value);
    }
    if (productoNombre.present) {
      map['producto_nombre'] = Variable<String>(productoNombre.value);
    }
    if (cantidad.present) {
      map['cantidad'] = Variable<int>(cantidad.value);
    }
    if (precioUnitario.present) {
      map['precio_unitario'] = Variable<double>(precioUnitario.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VentaItemsLocalTableCompanion(')
          ..write('id: $id, ')
          ..write('ventaId: $ventaId, ')
          ..write('productoId: $productoId, ')
          ..write('productoNombre: $productoNombre, ')
          ..write('cantidad: $cantidad, ')
          ..write('precioUnitario: $precioUnitario, ')
          ..write('subtotal: $subtotal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTableTable extends SyncQueueTable
    with TableInfo<$SyncQueueTableTable, SyncQueueTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entidadMeta = const VerificationMeta(
    'entidad',
  );
  @override
  late final GeneratedColumn<String> entidad = GeneratedColumn<String>(
    'entidad',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _errorCodeMeta = const VerificationMeta(
    'errorCode',
  );
  @override
  late final GeneratedColumn<String> errorCode = GeneratedColumn<String>(
    'error_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _conflictResolutionMeta =
      const VerificationMeta('conflictResolution');
  @override
  late final GeneratedColumn<String> conflictResolution =
      GeneratedColumn<String>(
        'conflict_resolution',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _serverSnapshotMeta = const VerificationMeta(
    'serverSnapshot',
  );
  @override
  late final GeneratedColumn<String> serverSnapshot = GeneratedColumn<String>(
    'server_snapshot',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entidad,
    tipo,
    payloadJson,
    status,
    retryCount,
    createdAt,
    updatedAt,
    lastError,
    errorCode,
    conflictResolution,
    serverSnapshot,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entidad')) {
      context.handle(
        _entidadMeta,
        entidad.isAcceptableOrUnknown(data['entidad']!, _entidadMeta),
      );
    } else if (isInserting) {
      context.missing(_entidadMeta);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _tipoMeta,
        tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
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
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    if (data.containsKey('error_code')) {
      context.handle(
        _errorCodeMeta,
        errorCode.isAcceptableOrUnknown(data['error_code']!, _errorCodeMeta),
      );
    }
    if (data.containsKey('conflict_resolution')) {
      context.handle(
        _conflictResolutionMeta,
        conflictResolution.isAcceptableOrUnknown(
          data['conflict_resolution']!,
          _conflictResolutionMeta,
        ),
      );
    }
    if (data.containsKey('server_snapshot')) {
      context.handle(
        _serverSnapshotMeta,
        serverSnapshot.isAcceptableOrUnknown(
          data['server_snapshot']!,
          _serverSnapshotMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      entidad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entidad'],
      )!,
      tipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      errorCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_code'],
      ),
      conflictResolution: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_resolution'],
      ),
      serverSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_snapshot'],
      ),
    );
  }

  @override
  $SyncQueueTableTable createAlias(String alias) {
    return $SyncQueueTableTable(attachedDatabase, alias);
  }
}

class SyncQueueTableData extends DataClass
    implements Insertable<SyncQueueTableData> {
  final String id;
  final String entidad;
  final String tipo;
  final String payloadJson;
  final String status;
  final int retryCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? lastError;
  final String? errorCode;
  final String? conflictResolution;
  final String? serverSnapshot;
  const SyncQueueTableData({
    required this.id,
    required this.entidad,
    required this.tipo,
    required this.payloadJson,
    required this.status,
    required this.retryCount,
    required this.createdAt,
    required this.updatedAt,
    this.lastError,
    this.errorCode,
    this.conflictResolution,
    this.serverSnapshot,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entidad'] = Variable<String>(entidad);
    map['tipo'] = Variable<String>(tipo);
    map['payload_json'] = Variable<String>(payloadJson);
    map['status'] = Variable<String>(status);
    map['retry_count'] = Variable<int>(retryCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    if (!nullToAbsent || errorCode != null) {
      map['error_code'] = Variable<String>(errorCode);
    }
    if (!nullToAbsent || conflictResolution != null) {
      map['conflict_resolution'] = Variable<String>(conflictResolution);
    }
    if (!nullToAbsent || serverSnapshot != null) {
      map['server_snapshot'] = Variable<String>(serverSnapshot);
    }
    return map;
  }

  SyncQueueTableCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueTableCompanion(
      id: Value(id),
      entidad: Value(entidad),
      tipo: Value(tipo),
      payloadJson: Value(payloadJson),
      status: Value(status),
      retryCount: Value(retryCount),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      errorCode: errorCode == null && nullToAbsent
          ? const Value.absent()
          : Value(errorCode),
      conflictResolution: conflictResolution == null && nullToAbsent
          ? const Value.absent()
          : Value(conflictResolution),
      serverSnapshot: serverSnapshot == null && nullToAbsent
          ? const Value.absent()
          : Value(serverSnapshot),
    );
  }

  factory SyncQueueTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueTableData(
      id: serializer.fromJson<String>(json['id']),
      entidad: serializer.fromJson<String>(json['entidad']),
      tipo: serializer.fromJson<String>(json['tipo']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      status: serializer.fromJson<String>(json['status']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      errorCode: serializer.fromJson<String?>(json['errorCode']),
      conflictResolution: serializer.fromJson<String?>(
        json['conflictResolution'],
      ),
      serverSnapshot: serializer.fromJson<String?>(json['serverSnapshot']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entidad': serializer.toJson<String>(entidad),
      'tipo': serializer.toJson<String>(tipo),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'status': serializer.toJson<String>(status),
      'retryCount': serializer.toJson<int>(retryCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'lastError': serializer.toJson<String?>(lastError),
      'errorCode': serializer.toJson<String?>(errorCode),
      'conflictResolution': serializer.toJson<String?>(conflictResolution),
      'serverSnapshot': serializer.toJson<String?>(serverSnapshot),
    };
  }

  SyncQueueTableData copyWith({
    String? id,
    String? entidad,
    String? tipo,
    String? payloadJson,
    String? status,
    int? retryCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<String?> lastError = const Value.absent(),
    Value<String?> errorCode = const Value.absent(),
    Value<String?> conflictResolution = const Value.absent(),
    Value<String?> serverSnapshot = const Value.absent(),
  }) => SyncQueueTableData(
    id: id ?? this.id,
    entidad: entidad ?? this.entidad,
    tipo: tipo ?? this.tipo,
    payloadJson: payloadJson ?? this.payloadJson,
    status: status ?? this.status,
    retryCount: retryCount ?? this.retryCount,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    lastError: lastError.present ? lastError.value : this.lastError,
    errorCode: errorCode.present ? errorCode.value : this.errorCode,
    conflictResolution: conflictResolution.present
        ? conflictResolution.value
        : this.conflictResolution,
    serverSnapshot: serverSnapshot.present
        ? serverSnapshot.value
        : this.serverSnapshot,
  );
  SyncQueueTableData copyWithCompanion(SyncQueueTableCompanion data) {
    return SyncQueueTableData(
      id: data.id.present ? data.id.value : this.id,
      entidad: data.entidad.present ? data.entidad.value : this.entidad,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
      status: data.status.present ? data.status.value : this.status,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      errorCode: data.errorCode.present ? data.errorCode.value : this.errorCode,
      conflictResolution: data.conflictResolution.present
          ? data.conflictResolution.value
          : this.conflictResolution,
      serverSnapshot: data.serverSnapshot.present
          ? data.serverSnapshot.value
          : this.serverSnapshot,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableData(')
          ..write('id: $id, ')
          ..write('entidad: $entidad, ')
          ..write('tipo: $tipo, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastError: $lastError, ')
          ..write('errorCode: $errorCode, ')
          ..write('conflictResolution: $conflictResolution, ')
          ..write('serverSnapshot: $serverSnapshot')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entidad,
    tipo,
    payloadJson,
    status,
    retryCount,
    createdAt,
    updatedAt,
    lastError,
    errorCode,
    conflictResolution,
    serverSnapshot,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueTableData &&
          other.id == this.id &&
          other.entidad == this.entidad &&
          other.tipo == this.tipo &&
          other.payloadJson == this.payloadJson &&
          other.status == this.status &&
          other.retryCount == this.retryCount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.lastError == this.lastError &&
          other.errorCode == this.errorCode &&
          other.conflictResolution == this.conflictResolution &&
          other.serverSnapshot == this.serverSnapshot);
}

class SyncQueueTableCompanion extends UpdateCompanion<SyncQueueTableData> {
  final Value<String> id;
  final Value<String> entidad;
  final Value<String> tipo;
  final Value<String> payloadJson;
  final Value<String> status;
  final Value<int> retryCount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String?> lastError;
  final Value<String?> errorCode;
  final Value<String?> conflictResolution;
  final Value<String?> serverSnapshot;
  final Value<int> rowid;
  const SyncQueueTableCompanion({
    this.id = const Value.absent(),
    this.entidad = const Value.absent(),
    this.tipo = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastError = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.conflictResolution = const Value.absent(),
    this.serverSnapshot = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncQueueTableCompanion.insert({
    required String id,
    required String entidad,
    required String tipo,
    required String payloadJson,
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.lastError = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.conflictResolution = const Value.absent(),
    this.serverSnapshot = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       entidad = Value(entidad),
       tipo = Value(tipo),
       payloadJson = Value(payloadJson),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SyncQueueTableData> custom({
    Expression<String>? id,
    Expression<String>? entidad,
    Expression<String>? tipo,
    Expression<String>? payloadJson,
    Expression<String>? status,
    Expression<int>? retryCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? lastError,
    Expression<String>? errorCode,
    Expression<String>? conflictResolution,
    Expression<String>? serverSnapshot,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entidad != null) 'entidad': entidad,
      if (tipo != null) 'tipo': tipo,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (status != null) 'status': status,
      if (retryCount != null) 'retry_count': retryCount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (lastError != null) 'last_error': lastError,
      if (errorCode != null) 'error_code': errorCode,
      if (conflictResolution != null) 'conflict_resolution': conflictResolution,
      if (serverSnapshot != null) 'server_snapshot': serverSnapshot,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncQueueTableCompanion copyWith({
    Value<String>? id,
    Value<String>? entidad,
    Value<String>? tipo,
    Value<String>? payloadJson,
    Value<String>? status,
    Value<int>? retryCount,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String?>? lastError,
    Value<String?>? errorCode,
    Value<String?>? conflictResolution,
    Value<String?>? serverSnapshot,
    Value<int>? rowid,
  }) {
    return SyncQueueTableCompanion(
      id: id ?? this.id,
      entidad: entidad ?? this.entidad,
      tipo: tipo ?? this.tipo,
      payloadJson: payloadJson ?? this.payloadJson,
      status: status ?? this.status,
      retryCount: retryCount ?? this.retryCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastError: lastError ?? this.lastError,
      errorCode: errorCode ?? this.errorCode,
      conflictResolution: conflictResolution ?? this.conflictResolution,
      serverSnapshot: serverSnapshot ?? this.serverSnapshot,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entidad.present) {
      map['entidad'] = Variable<String>(entidad.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (errorCode.present) {
      map['error_code'] = Variable<String>(errorCode.value);
    }
    if (conflictResolution.present) {
      map['conflict_resolution'] = Variable<String>(conflictResolution.value);
    }
    if (serverSnapshot.present) {
      map['server_snapshot'] = Variable<String>(serverSnapshot.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableCompanion(')
          ..write('id: $id, ')
          ..write('entidad: $entidad, ')
          ..write('tipo: $tipo, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastError: $lastError, ')
          ..write('errorCode: $errorCode, ')
          ..write('conflictResolution: $conflictResolution, ')
          ..write('serverSnapshot: $serverSnapshot, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTableTable productsTable = $ProductsTableTable(this);
  late final $SATCatalogItemTableTable sATCatalogItemTable =
      $SATCatalogItemTableTable(this);
  late final $VentasLocalTableTable ventasLocalTable = $VentasLocalTableTable(
    this,
  );
  late final $VentaItemsLocalTableTable ventaItemsLocalTable =
      $VentaItemsLocalTableTable(this);
  late final $SyncQueueTableTable syncQueueTable = $SyncQueueTableTable(this);
  late final Index productsNombre = Index(
    'products_nombre',
    'CREATE INDEX products_nombre ON products_table (nombre)',
  );
  late final Index productsCodigoBarras = Index(
    'products_codigo_barras',
    'CREATE INDEX products_codigo_barras ON products_table (codigo_barras)',
  );
  late final Index satCatalogItemTypeDesc = Index(
    'sat_catalog_item_type_desc',
    'CREATE INDEX sat_catalog_item_type_desc ON s_a_t_catalog_item_table (type, description)',
  );
  late final Index syncQueueStatus = Index(
    'sync_queue_status',
    'CREATE INDEX sync_queue_status ON sync_queue_table (status)',
  );
  late final Index syncQueueEntidadStatus = Index(
    'sync_queue_entidad_status',
    'CREATE INDEX sync_queue_entidad_status ON sync_queue_table (entidad, status)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    productsTable,
    sATCatalogItemTable,
    ventasLocalTable,
    ventaItemsLocalTable,
    syncQueueTable,
    productsNombre,
    productsCodigoBarras,
    satCatalogItemTypeDesc,
    syncQueueStatus,
    syncQueueEntidadStatus,
  ];
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
typedef $$SATCatalogItemTableTableCreateCompanionBuilder =
    SATCatalogItemTableCompanion Function({
      required String id,
      required String type,
      required String code,
      required String description,
      Value<String?> extraJson,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool> synced,
      Value<int> rowid,
    });
typedef $$SATCatalogItemTableTableUpdateCompanionBuilder =
    SATCatalogItemTableCompanion Function({
      Value<String> id,
      Value<String> type,
      Value<String> code,
      Value<String> description,
      Value<String?> extraJson,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool> synced,
      Value<int> rowid,
    });

class $$SATCatalogItemTableTableFilterComposer
    extends Composer<_$AppDatabase, $SATCatalogItemTableTable> {
  $$SATCatalogItemTableTableFilterComposer({
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

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extraJson => $composableBuilder(
    column: $table.extraJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get synced => $composableBuilder(
    column: $table.synced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SATCatalogItemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SATCatalogItemTableTable> {
  $$SATCatalogItemTableTableOrderingComposer({
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

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extraJson => $composableBuilder(
    column: $table.extraJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get synced => $composableBuilder(
    column: $table.synced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SATCatalogItemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SATCatalogItemTableTable> {
  $$SATCatalogItemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get extraJson =>
      $composableBuilder(column: $table.extraJson, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);
}

class $$SATCatalogItemTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SATCatalogItemTableTable,
          SATCatalogItemTableData,
          $$SATCatalogItemTableTableFilterComposer,
          $$SATCatalogItemTableTableOrderingComposer,
          $$SATCatalogItemTableTableAnnotationComposer,
          $$SATCatalogItemTableTableCreateCompanionBuilder,
          $$SATCatalogItemTableTableUpdateCompanionBuilder,
          (
            SATCatalogItemTableData,
            BaseReferences<
              _$AppDatabase,
              $SATCatalogItemTableTable,
              SATCatalogItemTableData
            >,
          ),
          SATCatalogItemTableData,
          PrefetchHooks Function()
        > {
  $$SATCatalogItemTableTableTableManager(
    _$AppDatabase db,
    $SATCatalogItemTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SATCatalogItemTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SATCatalogItemTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SATCatalogItemTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> extraJson = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool> synced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SATCatalogItemTableCompanion(
                id: id,
                type: type,
                code: code,
                description: description,
                extraJson: extraJson,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                synced: synced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String type,
                required String code,
                required String description,
                Value<String?> extraJson = const Value.absent(),
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool> synced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SATCatalogItemTableCompanion.insert(
                id: id,
                type: type,
                code: code,
                description: description,
                extraJson: extraJson,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                synced: synced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SATCatalogItemTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SATCatalogItemTableTable,
      SATCatalogItemTableData,
      $$SATCatalogItemTableTableFilterComposer,
      $$SATCatalogItemTableTableOrderingComposer,
      $$SATCatalogItemTableTableAnnotationComposer,
      $$SATCatalogItemTableTableCreateCompanionBuilder,
      $$SATCatalogItemTableTableUpdateCompanionBuilder,
      (
        SATCatalogItemTableData,
        BaseReferences<
          _$AppDatabase,
          $SATCatalogItemTableTable,
          SATCatalogItemTableData
        >,
      ),
      SATCatalogItemTableData,
      PrefetchHooks Function()
    >;
typedef $$VentasLocalTableTableCreateCompanionBuilder =
    VentasLocalTableCompanion Function({
      required String id,
      required String empresaId,
      required String usuarioId,
      Value<String?> sucursalId,
      required String formaPago,
      required String metodoPago,
      required String usoCfdi,
      required double subtotal,
      required double iva,
      required double total,
      Value<String> estado,
      Value<String?> backendId,
      required String payloadJson,
      Value<String?> errorMessage,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> syncPending,
      Value<int> rowid,
    });
typedef $$VentasLocalTableTableUpdateCompanionBuilder =
    VentasLocalTableCompanion Function({
      Value<String> id,
      Value<String> empresaId,
      Value<String> usuarioId,
      Value<String?> sucursalId,
      Value<String> formaPago,
      Value<String> metodoPago,
      Value<String> usoCfdi,
      Value<double> subtotal,
      Value<double> iva,
      Value<double> total,
      Value<String> estado,
      Value<String?> backendId,
      Value<String> payloadJson,
      Value<String?> errorMessage,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> syncPending,
      Value<int> rowid,
    });

class $$VentasLocalTableTableFilterComposer
    extends Composer<_$AppDatabase, $VentasLocalTableTable> {
  $$VentasLocalTableTableFilterComposer({
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

  ColumnFilters<String> get empresaId => $composableBuilder(
    column: $table.empresaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usuarioId => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sucursalId => $composableBuilder(
    column: $table.sucursalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get formaPago => $composableBuilder(
    column: $table.formaPago,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metodoPago => $composableBuilder(
    column: $table.metodoPago,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usoCfdi => $composableBuilder(
    column: $table.usoCfdi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get iva => $composableBuilder(
    column: $table.iva,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backendId => $composableBuilder(
    column: $table.backendId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
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

class $$VentasLocalTableTableOrderingComposer
    extends Composer<_$AppDatabase, $VentasLocalTableTable> {
  $$VentasLocalTableTableOrderingComposer({
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

  ColumnOrderings<String> get empresaId => $composableBuilder(
    column: $table.empresaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usuarioId => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sucursalId => $composableBuilder(
    column: $table.sucursalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get formaPago => $composableBuilder(
    column: $table.formaPago,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metodoPago => $composableBuilder(
    column: $table.metodoPago,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usoCfdi => $composableBuilder(
    column: $table.usoCfdi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get iva => $composableBuilder(
    column: $table.iva,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backendId => $composableBuilder(
    column: $table.backendId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
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

class $$VentasLocalTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $VentasLocalTableTable> {
  $$VentasLocalTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get empresaId =>
      $composableBuilder(column: $table.empresaId, builder: (column) => column);

  GeneratedColumn<String> get usuarioId =>
      $composableBuilder(column: $table.usuarioId, builder: (column) => column);

  GeneratedColumn<String> get sucursalId => $composableBuilder(
    column: $table.sucursalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get formaPago =>
      $composableBuilder(column: $table.formaPago, builder: (column) => column);

  GeneratedColumn<String> get metodoPago => $composableBuilder(
    column: $table.metodoPago,
    builder: (column) => column,
  );

  GeneratedColumn<String> get usoCfdi =>
      $composableBuilder(column: $table.usoCfdi, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<double> get iva =>
      $composableBuilder(column: $table.iva, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<String> get estado =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<String> get backendId =>
      $composableBuilder(column: $table.backendId, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get syncPending => $composableBuilder(
    column: $table.syncPending,
    builder: (column) => column,
  );
}

class $$VentasLocalTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VentasLocalTableTable,
          VentasLocalTableData,
          $$VentasLocalTableTableFilterComposer,
          $$VentasLocalTableTableOrderingComposer,
          $$VentasLocalTableTableAnnotationComposer,
          $$VentasLocalTableTableCreateCompanionBuilder,
          $$VentasLocalTableTableUpdateCompanionBuilder,
          (
            VentasLocalTableData,
            BaseReferences<
              _$AppDatabase,
              $VentasLocalTableTable,
              VentasLocalTableData
            >,
          ),
          VentasLocalTableData,
          PrefetchHooks Function()
        > {
  $$VentasLocalTableTableTableManager(
    _$AppDatabase db,
    $VentasLocalTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VentasLocalTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VentasLocalTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VentasLocalTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> empresaId = const Value.absent(),
                Value<String> usuarioId = const Value.absent(),
                Value<String?> sucursalId = const Value.absent(),
                Value<String> formaPago = const Value.absent(),
                Value<String> metodoPago = const Value.absent(),
                Value<String> usoCfdi = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> iva = const Value.absent(),
                Value<double> total = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<String?> backendId = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> syncPending = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VentasLocalTableCompanion(
                id: id,
                empresaId: empresaId,
                usuarioId: usuarioId,
                sucursalId: sucursalId,
                formaPago: formaPago,
                metodoPago: metodoPago,
                usoCfdi: usoCfdi,
                subtotal: subtotal,
                iva: iva,
                total: total,
                estado: estado,
                backendId: backendId,
                payloadJson: payloadJson,
                errorMessage: errorMessage,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncPending: syncPending,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String empresaId,
                required String usuarioId,
                Value<String?> sucursalId = const Value.absent(),
                required String formaPago,
                required String metodoPago,
                required String usoCfdi,
                required double subtotal,
                required double iva,
                required double total,
                Value<String> estado = const Value.absent(),
                Value<String?> backendId = const Value.absent(),
                required String payloadJson,
                Value<String?> errorMessage = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> syncPending = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VentasLocalTableCompanion.insert(
                id: id,
                empresaId: empresaId,
                usuarioId: usuarioId,
                sucursalId: sucursalId,
                formaPago: formaPago,
                metodoPago: metodoPago,
                usoCfdi: usoCfdi,
                subtotal: subtotal,
                iva: iva,
                total: total,
                estado: estado,
                backendId: backendId,
                payloadJson: payloadJson,
                errorMessage: errorMessage,
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

typedef $$VentasLocalTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VentasLocalTableTable,
      VentasLocalTableData,
      $$VentasLocalTableTableFilterComposer,
      $$VentasLocalTableTableOrderingComposer,
      $$VentasLocalTableTableAnnotationComposer,
      $$VentasLocalTableTableCreateCompanionBuilder,
      $$VentasLocalTableTableUpdateCompanionBuilder,
      (
        VentasLocalTableData,
        BaseReferences<
          _$AppDatabase,
          $VentasLocalTableTable,
          VentasLocalTableData
        >,
      ),
      VentasLocalTableData,
      PrefetchHooks Function()
    >;
typedef $$VentaItemsLocalTableTableCreateCompanionBuilder =
    VentaItemsLocalTableCompanion Function({
      required String id,
      required String ventaId,
      required String productoId,
      required String productoNombre,
      required int cantidad,
      required double precioUnitario,
      required double subtotal,
      Value<int> rowid,
    });
typedef $$VentaItemsLocalTableTableUpdateCompanionBuilder =
    VentaItemsLocalTableCompanion Function({
      Value<String> id,
      Value<String> ventaId,
      Value<String> productoId,
      Value<String> productoNombre,
      Value<int> cantidad,
      Value<double> precioUnitario,
      Value<double> subtotal,
      Value<int> rowid,
    });

class $$VentaItemsLocalTableTableFilterComposer
    extends Composer<_$AppDatabase, $VentaItemsLocalTableTable> {
  $$VentaItemsLocalTableTableFilterComposer({
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

  ColumnFilters<String> get ventaId => $composableBuilder(
    column: $table.ventaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productoId => $composableBuilder(
    column: $table.productoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productoNombre => $composableBuilder(
    column: $table.productoNombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cantidad => $composableBuilder(
    column: $table.cantidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precioUnitario => $composableBuilder(
    column: $table.precioUnitario,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VentaItemsLocalTableTableOrderingComposer
    extends Composer<_$AppDatabase, $VentaItemsLocalTableTable> {
  $$VentaItemsLocalTableTableOrderingComposer({
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

  ColumnOrderings<String> get ventaId => $composableBuilder(
    column: $table.ventaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productoId => $composableBuilder(
    column: $table.productoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productoNombre => $composableBuilder(
    column: $table.productoNombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cantidad => $composableBuilder(
    column: $table.cantidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precioUnitario => $composableBuilder(
    column: $table.precioUnitario,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VentaItemsLocalTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $VentaItemsLocalTableTable> {
  $$VentaItemsLocalTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ventaId =>
      $composableBuilder(column: $table.ventaId, builder: (column) => column);

  GeneratedColumn<String> get productoId => $composableBuilder(
    column: $table.productoId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productoNombre => $composableBuilder(
    column: $table.productoNombre,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cantidad =>
      $composableBuilder(column: $table.cantidad, builder: (column) => column);

  GeneratedColumn<double> get precioUnitario => $composableBuilder(
    column: $table.precioUnitario,
    builder: (column) => column,
  );

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);
}

class $$VentaItemsLocalTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VentaItemsLocalTableTable,
          VentaItemsLocalTableData,
          $$VentaItemsLocalTableTableFilterComposer,
          $$VentaItemsLocalTableTableOrderingComposer,
          $$VentaItemsLocalTableTableAnnotationComposer,
          $$VentaItemsLocalTableTableCreateCompanionBuilder,
          $$VentaItemsLocalTableTableUpdateCompanionBuilder,
          (
            VentaItemsLocalTableData,
            BaseReferences<
              _$AppDatabase,
              $VentaItemsLocalTableTable,
              VentaItemsLocalTableData
            >,
          ),
          VentaItemsLocalTableData,
          PrefetchHooks Function()
        > {
  $$VentaItemsLocalTableTableTableManager(
    _$AppDatabase db,
    $VentaItemsLocalTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VentaItemsLocalTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VentaItemsLocalTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$VentaItemsLocalTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ventaId = const Value.absent(),
                Value<String> productoId = const Value.absent(),
                Value<String> productoNombre = const Value.absent(),
                Value<int> cantidad = const Value.absent(),
                Value<double> precioUnitario = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VentaItemsLocalTableCompanion(
                id: id,
                ventaId: ventaId,
                productoId: productoId,
                productoNombre: productoNombre,
                cantidad: cantidad,
                precioUnitario: precioUnitario,
                subtotal: subtotal,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ventaId,
                required String productoId,
                required String productoNombre,
                required int cantidad,
                required double precioUnitario,
                required double subtotal,
                Value<int> rowid = const Value.absent(),
              }) => VentaItemsLocalTableCompanion.insert(
                id: id,
                ventaId: ventaId,
                productoId: productoId,
                productoNombre: productoNombre,
                cantidad: cantidad,
                precioUnitario: precioUnitario,
                subtotal: subtotal,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VentaItemsLocalTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VentaItemsLocalTableTable,
      VentaItemsLocalTableData,
      $$VentaItemsLocalTableTableFilterComposer,
      $$VentaItemsLocalTableTableOrderingComposer,
      $$VentaItemsLocalTableTableAnnotationComposer,
      $$VentaItemsLocalTableTableCreateCompanionBuilder,
      $$VentaItemsLocalTableTableUpdateCompanionBuilder,
      (
        VentaItemsLocalTableData,
        BaseReferences<
          _$AppDatabase,
          $VentaItemsLocalTableTable,
          VentaItemsLocalTableData
        >,
      ),
      VentaItemsLocalTableData,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableTableCreateCompanionBuilder =
    SyncQueueTableCompanion Function({
      required String id,
      required String entidad,
      required String tipo,
      required String payloadJson,
      Value<String> status,
      Value<int> retryCount,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<String?> lastError,
      Value<String?> errorCode,
      Value<String?> conflictResolution,
      Value<String?> serverSnapshot,
      Value<int> rowid,
    });
typedef $$SyncQueueTableTableUpdateCompanionBuilder =
    SyncQueueTableCompanion Function({
      Value<String> id,
      Value<String> entidad,
      Value<String> tipo,
      Value<String> payloadJson,
      Value<String> status,
      Value<int> retryCount,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String?> lastError,
      Value<String?> errorCode,
      Value<String?> conflictResolution,
      Value<String?> serverSnapshot,
      Value<int> rowid,
    });

class $$SyncQueueTableTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableFilterComposer({
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

  ColumnFilters<String> get entidad => $composableBuilder(
    column: $table.entidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
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

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictResolution => $composableBuilder(
    column: $table.conflictResolution,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverSnapshot => $composableBuilder(
    column: $table.serverSnapshot,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableOrderingComposer({
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

  ColumnOrderings<String> get entidad => $composableBuilder(
    column: $table.entidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
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

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictResolution => $composableBuilder(
    column: $table.conflictResolution,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverSnapshot => $composableBuilder(
    column: $table.serverSnapshot,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entidad =>
      $composableBuilder(column: $table.entidad, builder: (column) => column);

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<String> get errorCode =>
      $composableBuilder(column: $table.errorCode, builder: (column) => column);

  GeneratedColumn<String> get conflictResolution => $composableBuilder(
    column: $table.conflictResolution,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serverSnapshot => $composableBuilder(
    column: $table.serverSnapshot,
    builder: (column) => column,
  );
}

class $$SyncQueueTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTableTable,
          SyncQueueTableData,
          $$SyncQueueTableTableFilterComposer,
          $$SyncQueueTableTableOrderingComposer,
          $$SyncQueueTableTableAnnotationComposer,
          $$SyncQueueTableTableCreateCompanionBuilder,
          $$SyncQueueTableTableUpdateCompanionBuilder,
          (
            SyncQueueTableData,
            BaseReferences<
              _$AppDatabase,
              $SyncQueueTableTable,
              SyncQueueTableData
            >,
          ),
          SyncQueueTableData,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableTableManager(
    _$AppDatabase db,
    $SyncQueueTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> entidad = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<String?> errorCode = const Value.absent(),
                Value<String?> conflictResolution = const Value.absent(),
                Value<String?> serverSnapshot = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncQueueTableCompanion(
                id: id,
                entidad: entidad,
                tipo: tipo,
                payloadJson: payloadJson,
                status: status,
                retryCount: retryCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                lastError: lastError,
                errorCode: errorCode,
                conflictResolution: conflictResolution,
                serverSnapshot: serverSnapshot,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String entidad,
                required String tipo,
                required String payloadJson,
                Value<String> status = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<String?> lastError = const Value.absent(),
                Value<String?> errorCode = const Value.absent(),
                Value<String?> conflictResolution = const Value.absent(),
                Value<String?> serverSnapshot = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncQueueTableCompanion.insert(
                id: id,
                entidad: entidad,
                tipo: tipo,
                payloadJson: payloadJson,
                status: status,
                retryCount: retryCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                lastError: lastError,
                errorCode: errorCode,
                conflictResolution: conflictResolution,
                serverSnapshot: serverSnapshot,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTableTable,
      SyncQueueTableData,
      $$SyncQueueTableTableFilterComposer,
      $$SyncQueueTableTableOrderingComposer,
      $$SyncQueueTableTableAnnotationComposer,
      $$SyncQueueTableTableCreateCompanionBuilder,
      $$SyncQueueTableTableUpdateCompanionBuilder,
      (
        SyncQueueTableData,
        BaseReferences<_$AppDatabase, $SyncQueueTableTable, SyncQueueTableData>,
      ),
      SyncQueueTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableTableManager get productsTable =>
      $$ProductsTableTableTableManager(_db, _db.productsTable);
  $$SATCatalogItemTableTableTableManager get sATCatalogItemTable =>
      $$SATCatalogItemTableTableTableManager(_db, _db.sATCatalogItemTable);
  $$VentasLocalTableTableTableManager get ventasLocalTable =>
      $$VentasLocalTableTableTableManager(_db, _db.ventasLocalTable);
  $$VentaItemsLocalTableTableTableManager get ventaItemsLocalTable =>
      $$VentaItemsLocalTableTableTableManager(_db, _db.ventaItemsLocalTable);
  $$SyncQueueTableTableTableManager get syncQueueTable =>
      $$SyncQueueTableTableTableManager(_db, _db.syncQueueTable);
}
