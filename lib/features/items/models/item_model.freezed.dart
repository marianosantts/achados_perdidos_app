// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemModel {

 int get id; String get titulo; String get descricao; TipoItem get tipo; CategoriaItem get categoria; String get local;/// Formato esperado da API: "YYYY-MM-DD"
 String get dataOcorrido; StatusItem get status; String get nomeContato; String get telefoneContato;/// URL da imagem (opcional).
 String? get imagemUrl;/// Observações adicionais (opcional).
 String? get observacao;/// Gerado automaticamente pela API (ISO-8601).
 String get createdAt;/// Gerado automaticamente pela API (ISO-8601).
 String get updatedAt;
/// Create a copy of ItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemModelCopyWith<ItemModel> get copyWith => _$ItemModelCopyWithImpl<ItemModel>(this as ItemModel, _$identity);

  /// Serializes this ItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.categoria, categoria) || other.categoria == categoria)&&(identical(other.local, local) || other.local == local)&&(identical(other.dataOcorrido, dataOcorrido) || other.dataOcorrido == dataOcorrido)&&(identical(other.status, status) || other.status == status)&&(identical(other.nomeContato, nomeContato) || other.nomeContato == nomeContato)&&(identical(other.telefoneContato, telefoneContato) || other.telefoneContato == telefoneContato)&&(identical(other.imagemUrl, imagemUrl) || other.imagemUrl == imagemUrl)&&(identical(other.observacao, observacao) || other.observacao == observacao)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titulo,descricao,tipo,categoria,local,dataOcorrido,status,nomeContato,telefoneContato,imagemUrl,observacao,createdAt,updatedAt);

@override
String toString() {
  return 'ItemModel(id: $id, titulo: $titulo, descricao: $descricao, tipo: $tipo, categoria: $categoria, local: $local, dataOcorrido: $dataOcorrido, status: $status, nomeContato: $nomeContato, telefoneContato: $telefoneContato, imagemUrl: $imagemUrl, observacao: $observacao, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ItemModelCopyWith<$Res>  {
  factory $ItemModelCopyWith(ItemModel value, $Res Function(ItemModel) _then) = _$ItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String titulo, String descricao, TipoItem tipo, CategoriaItem categoria, String local, String dataOcorrido, StatusItem status, String nomeContato, String telefoneContato, String? imagemUrl, String? observacao, String createdAt, String updatedAt
});




}
/// @nodoc
class _$ItemModelCopyWithImpl<$Res>
    implements $ItemModelCopyWith<$Res> {
  _$ItemModelCopyWithImpl(this._self, this._then);

  final ItemModel _self;
  final $Res Function(ItemModel) _then;

/// Create a copy of ItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titulo = null,Object? descricao = null,Object? tipo = null,Object? categoria = null,Object? local = null,Object? dataOcorrido = null,Object? status = null,Object? nomeContato = null,Object? telefoneContato = null,Object? imagemUrl = freezed,Object? observacao = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as TipoItem,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as CategoriaItem,local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as String,dataOcorrido: null == dataOcorrido ? _self.dataOcorrido : dataOcorrido // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusItem,nomeContato: null == nomeContato ? _self.nomeContato : nomeContato // ignore: cast_nullable_to_non_nullable
as String,telefoneContato: null == telefoneContato ? _self.telefoneContato : telefoneContato // ignore: cast_nullable_to_non_nullable
as String,imagemUrl: freezed == imagemUrl ? _self.imagemUrl : imagemUrl // ignore: cast_nullable_to_non_nullable
as String?,observacao: freezed == observacao ? _self.observacao : observacao // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemModel].
extension ItemModelPatterns on ItemModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ItemModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ItemModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String titulo,  String descricao,  TipoItem tipo,  CategoriaItem categoria,  String local,  String dataOcorrido,  StatusItem status,  String nomeContato,  String telefoneContato,  String? imagemUrl,  String? observacao,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemModel() when $default != null:
return $default(_that.id,_that.titulo,_that.descricao,_that.tipo,_that.categoria,_that.local,_that.dataOcorrido,_that.status,_that.nomeContato,_that.telefoneContato,_that.imagemUrl,_that.observacao,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String titulo,  String descricao,  TipoItem tipo,  CategoriaItem categoria,  String local,  String dataOcorrido,  StatusItem status,  String nomeContato,  String telefoneContato,  String? imagemUrl,  String? observacao,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ItemModel():
return $default(_that.id,_that.titulo,_that.descricao,_that.tipo,_that.categoria,_that.local,_that.dataOcorrido,_that.status,_that.nomeContato,_that.telefoneContato,_that.imagemUrl,_that.observacao,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String titulo,  String descricao,  TipoItem tipo,  CategoriaItem categoria,  String local,  String dataOcorrido,  StatusItem status,  String nomeContato,  String telefoneContato,  String? imagemUrl,  String? observacao,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ItemModel() when $default != null:
return $default(_that.id,_that.titulo,_that.descricao,_that.tipo,_that.categoria,_that.local,_that.dataOcorrido,_that.status,_that.nomeContato,_that.telefoneContato,_that.imagemUrl,_that.observacao,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemModel implements ItemModel {
  const _ItemModel({required this.id, required this.titulo, required this.descricao, required this.tipo, required this.categoria, required this.local, required this.dataOcorrido, required this.status, required this.nomeContato, required this.telefoneContato, this.imagemUrl, this.observacao, required this.createdAt, required this.updatedAt});
  factory _ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

@override final  int id;
@override final  String titulo;
@override final  String descricao;
@override final  TipoItem tipo;
@override final  CategoriaItem categoria;
@override final  String local;
/// Formato esperado da API: "YYYY-MM-DD"
@override final  String dataOcorrido;
@override final  StatusItem status;
@override final  String nomeContato;
@override final  String telefoneContato;
/// URL da imagem (opcional).
@override final  String? imagemUrl;
/// Observações adicionais (opcional).
@override final  String? observacao;
/// Gerado automaticamente pela API (ISO-8601).
@override final  String createdAt;
/// Gerado automaticamente pela API (ISO-8601).
@override final  String updatedAt;

/// Create a copy of ItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemModelCopyWith<_ItemModel> get copyWith => __$ItemModelCopyWithImpl<_ItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.categoria, categoria) || other.categoria == categoria)&&(identical(other.local, local) || other.local == local)&&(identical(other.dataOcorrido, dataOcorrido) || other.dataOcorrido == dataOcorrido)&&(identical(other.status, status) || other.status == status)&&(identical(other.nomeContato, nomeContato) || other.nomeContato == nomeContato)&&(identical(other.telefoneContato, telefoneContato) || other.telefoneContato == telefoneContato)&&(identical(other.imagemUrl, imagemUrl) || other.imagemUrl == imagemUrl)&&(identical(other.observacao, observacao) || other.observacao == observacao)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titulo,descricao,tipo,categoria,local,dataOcorrido,status,nomeContato,telefoneContato,imagemUrl,observacao,createdAt,updatedAt);

@override
String toString() {
  return 'ItemModel(id: $id, titulo: $titulo, descricao: $descricao, tipo: $tipo, categoria: $categoria, local: $local, dataOcorrido: $dataOcorrido, status: $status, nomeContato: $nomeContato, telefoneContato: $telefoneContato, imagemUrl: $imagemUrl, observacao: $observacao, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ItemModelCopyWith<$Res> implements $ItemModelCopyWith<$Res> {
  factory _$ItemModelCopyWith(_ItemModel value, $Res Function(_ItemModel) _then) = __$ItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String titulo, String descricao, TipoItem tipo, CategoriaItem categoria, String local, String dataOcorrido, StatusItem status, String nomeContato, String telefoneContato, String? imagemUrl, String? observacao, String createdAt, String updatedAt
});




}
/// @nodoc
class __$ItemModelCopyWithImpl<$Res>
    implements _$ItemModelCopyWith<$Res> {
  __$ItemModelCopyWithImpl(this._self, this._then);

  final _ItemModel _self;
  final $Res Function(_ItemModel) _then;

/// Create a copy of ItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titulo = null,Object? descricao = null,Object? tipo = null,Object? categoria = null,Object? local = null,Object? dataOcorrido = null,Object? status = null,Object? nomeContato = null,Object? telefoneContato = null,Object? imagemUrl = freezed,Object? observacao = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as TipoItem,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as CategoriaItem,local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as String,dataOcorrido: null == dataOcorrido ? _self.dataOcorrido : dataOcorrido // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusItem,nomeContato: null == nomeContato ? _self.nomeContato : nomeContato // ignore: cast_nullable_to_non_nullable
as String,telefoneContato: null == telefoneContato ? _self.telefoneContato : telefoneContato // ignore: cast_nullable_to_non_nullable
as String,imagemUrl: freezed == imagemUrl ? _self.imagemUrl : imagemUrl // ignore: cast_nullable_to_non_nullable
as String?,observacao: freezed == observacao ? _self.observacao : observacao // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
