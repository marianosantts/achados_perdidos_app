// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemRequestModel {

/// Mínimo 3, máximo 100 caracteres.
 String get titulo;/// Máximo 1000 caracteres.
 String get descricao; TipoItem get tipo; CategoriaItem get categoria;/// Máximo 150 caracteres.
 String get local;/// Formato "YYYY-MM-DD".
 String get dataOcorrido;/// Máximo 100 caracteres.
 String get nomeContato;/// Máximo 20 caracteres.
 String get telefoneContato;/// URL da imagem — opcional, máximo 500 caracteres.
 String? get imagemUrl;/// Observação adicional — opcional, máximo 500 caracteres.
 String? get observacao;
/// Create a copy of ItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemRequestModelCopyWith<ItemRequestModel> get copyWith => _$ItemRequestModelCopyWithImpl<ItemRequestModel>(this as ItemRequestModel, _$identity);

  /// Serializes this ItemRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemRequestModel&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.categoria, categoria) || other.categoria == categoria)&&(identical(other.local, local) || other.local == local)&&(identical(other.dataOcorrido, dataOcorrido) || other.dataOcorrido == dataOcorrido)&&(identical(other.nomeContato, nomeContato) || other.nomeContato == nomeContato)&&(identical(other.telefoneContato, telefoneContato) || other.telefoneContato == telefoneContato)&&(identical(other.imagemUrl, imagemUrl) || other.imagemUrl == imagemUrl)&&(identical(other.observacao, observacao) || other.observacao == observacao));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,titulo,descricao,tipo,categoria,local,dataOcorrido,nomeContato,telefoneContato,imagemUrl,observacao);

@override
String toString() {
  return 'ItemRequestModel(titulo: $titulo, descricao: $descricao, tipo: $tipo, categoria: $categoria, local: $local, dataOcorrido: $dataOcorrido, nomeContato: $nomeContato, telefoneContato: $telefoneContato, imagemUrl: $imagemUrl, observacao: $observacao)';
}


}

/// @nodoc
abstract mixin class $ItemRequestModelCopyWith<$Res>  {
  factory $ItemRequestModelCopyWith(ItemRequestModel value, $Res Function(ItemRequestModel) _then) = _$ItemRequestModelCopyWithImpl;
@useResult
$Res call({
 String titulo, String descricao, TipoItem tipo, CategoriaItem categoria, String local, String dataOcorrido, String nomeContato, String telefoneContato, String? imagemUrl, String? observacao
});




}
/// @nodoc
class _$ItemRequestModelCopyWithImpl<$Res>
    implements $ItemRequestModelCopyWith<$Res> {
  _$ItemRequestModelCopyWithImpl(this._self, this._then);

  final ItemRequestModel _self;
  final $Res Function(ItemRequestModel) _then;

/// Create a copy of ItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? titulo = null,Object? descricao = null,Object? tipo = null,Object? categoria = null,Object? local = null,Object? dataOcorrido = null,Object? nomeContato = null,Object? telefoneContato = null,Object? imagemUrl = freezed,Object? observacao = freezed,}) {
  return _then(_self.copyWith(
titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as TipoItem,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as CategoriaItem,local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as String,dataOcorrido: null == dataOcorrido ? _self.dataOcorrido : dataOcorrido // ignore: cast_nullable_to_non_nullable
as String,nomeContato: null == nomeContato ? _self.nomeContato : nomeContato // ignore: cast_nullable_to_non_nullable
as String,telefoneContato: null == telefoneContato ? _self.telefoneContato : telefoneContato // ignore: cast_nullable_to_non_nullable
as String,imagemUrl: freezed == imagemUrl ? _self.imagemUrl : imagemUrl // ignore: cast_nullable_to_non_nullable
as String?,observacao: freezed == observacao ? _self.observacao : observacao // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemRequestModel].
extension ItemRequestModelPatterns on ItemRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ItemRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ItemRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String titulo,  String descricao,  TipoItem tipo,  CategoriaItem categoria,  String local,  String dataOcorrido,  String nomeContato,  String telefoneContato,  String? imagemUrl,  String? observacao)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemRequestModel() when $default != null:
return $default(_that.titulo,_that.descricao,_that.tipo,_that.categoria,_that.local,_that.dataOcorrido,_that.nomeContato,_that.telefoneContato,_that.imagemUrl,_that.observacao);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String titulo,  String descricao,  TipoItem tipo,  CategoriaItem categoria,  String local,  String dataOcorrido,  String nomeContato,  String telefoneContato,  String? imagemUrl,  String? observacao)  $default,) {final _that = this;
switch (_that) {
case _ItemRequestModel():
return $default(_that.titulo,_that.descricao,_that.tipo,_that.categoria,_that.local,_that.dataOcorrido,_that.nomeContato,_that.telefoneContato,_that.imagemUrl,_that.observacao);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String titulo,  String descricao,  TipoItem tipo,  CategoriaItem categoria,  String local,  String dataOcorrido,  String nomeContato,  String telefoneContato,  String? imagemUrl,  String? observacao)?  $default,) {final _that = this;
switch (_that) {
case _ItemRequestModel() when $default != null:
return $default(_that.titulo,_that.descricao,_that.tipo,_that.categoria,_that.local,_that.dataOcorrido,_that.nomeContato,_that.telefoneContato,_that.imagemUrl,_that.observacao);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemRequestModel implements ItemRequestModel {
  const _ItemRequestModel({required this.titulo, required this.descricao, required this.tipo, required this.categoria, required this.local, required this.dataOcorrido, required this.nomeContato, required this.telefoneContato, this.imagemUrl, this.observacao});
  factory _ItemRequestModel.fromJson(Map<String, dynamic> json) => _$ItemRequestModelFromJson(json);

/// Mínimo 3, máximo 100 caracteres.
@override final  String titulo;
/// Máximo 1000 caracteres.
@override final  String descricao;
@override final  TipoItem tipo;
@override final  CategoriaItem categoria;
/// Máximo 150 caracteres.
@override final  String local;
/// Formato "YYYY-MM-DD".
@override final  String dataOcorrido;
/// Máximo 100 caracteres.
@override final  String nomeContato;
/// Máximo 20 caracteres.
@override final  String telefoneContato;
/// URL da imagem — opcional, máximo 500 caracteres.
@override final  String? imagemUrl;
/// Observação adicional — opcional, máximo 500 caracteres.
@override final  String? observacao;

/// Create a copy of ItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemRequestModelCopyWith<_ItemRequestModel> get copyWith => __$ItemRequestModelCopyWithImpl<_ItemRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemRequestModel&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.categoria, categoria) || other.categoria == categoria)&&(identical(other.local, local) || other.local == local)&&(identical(other.dataOcorrido, dataOcorrido) || other.dataOcorrido == dataOcorrido)&&(identical(other.nomeContato, nomeContato) || other.nomeContato == nomeContato)&&(identical(other.telefoneContato, telefoneContato) || other.telefoneContato == telefoneContato)&&(identical(other.imagemUrl, imagemUrl) || other.imagemUrl == imagemUrl)&&(identical(other.observacao, observacao) || other.observacao == observacao));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,titulo,descricao,tipo,categoria,local,dataOcorrido,nomeContato,telefoneContato,imagemUrl,observacao);

@override
String toString() {
  return 'ItemRequestModel(titulo: $titulo, descricao: $descricao, tipo: $tipo, categoria: $categoria, local: $local, dataOcorrido: $dataOcorrido, nomeContato: $nomeContato, telefoneContato: $telefoneContato, imagemUrl: $imagemUrl, observacao: $observacao)';
}


}

/// @nodoc
abstract mixin class _$ItemRequestModelCopyWith<$Res> implements $ItemRequestModelCopyWith<$Res> {
  factory _$ItemRequestModelCopyWith(_ItemRequestModel value, $Res Function(_ItemRequestModel) _then) = __$ItemRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String titulo, String descricao, TipoItem tipo, CategoriaItem categoria, String local, String dataOcorrido, String nomeContato, String telefoneContato, String? imagemUrl, String? observacao
});




}
/// @nodoc
class __$ItemRequestModelCopyWithImpl<$Res>
    implements _$ItemRequestModelCopyWith<$Res> {
  __$ItemRequestModelCopyWithImpl(this._self, this._then);

  final _ItemRequestModel _self;
  final $Res Function(_ItemRequestModel) _then;

/// Create a copy of ItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? titulo = null,Object? descricao = null,Object? tipo = null,Object? categoria = null,Object? local = null,Object? dataOcorrido = null,Object? nomeContato = null,Object? telefoneContato = null,Object? imagemUrl = freezed,Object? observacao = freezed,}) {
  return _then(_ItemRequestModel(
titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as TipoItem,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as CategoriaItem,local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as String,dataOcorrido: null == dataOcorrido ? _self.dataOcorrido : dataOcorrido // ignore: cast_nullable_to_non_nullable
as String,nomeContato: null == nomeContato ? _self.nomeContato : nomeContato // ignore: cast_nullable_to_non_nullable
as String,telefoneContato: null == telefoneContato ? _self.telefoneContato : telefoneContato // ignore: cast_nullable_to_non_nullable
as String,imagemUrl: freezed == imagemUrl ? _self.imagemUrl : imagemUrl // ignore: cast_nullable_to_non_nullable
as String?,observacao: freezed == observacao ? _self.observacao : observacao // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
