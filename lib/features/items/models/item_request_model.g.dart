// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemRequestModel _$ItemRequestModelFromJson(Map<String, dynamic> json) =>
    _ItemRequestModel(
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
      tipo: $enumDecode(_$TipoItemEnumMap, json['tipo']),
      categoria: $enumDecode(_$CategoriaItemEnumMap, json['categoria']),
      local: json['local'] as String,
      dataOcorrido: json['dataOcorrido'] as String,
      nomeContato: json['nomeContato'] as String,
      telefoneContato: json['telefoneContato'] as String,
      imagemUrl: json['imagemUrl'] as String?,
      observacao: json['observacao'] as String?,
    );

Map<String, dynamic> _$ItemRequestModelToJson(_ItemRequestModel instance) =>
    <String, dynamic>{
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'tipo': _$TipoItemEnumMap[instance.tipo]!,
      'categoria': _$CategoriaItemEnumMap[instance.categoria]!,
      'local': instance.local,
      'dataOcorrido': instance.dataOcorrido,
      'nomeContato': instance.nomeContato,
      'telefoneContato': instance.telefoneContato,
      if (instance.imagemUrl case final value?) 'imagemUrl': value,
      if (instance.observacao case final value?) 'observacao': value,
    };

const _$TipoItemEnumMap = {
  TipoItem.ACHADO: 'ACHADO',
  TipoItem.PERDIDO: 'PERDIDO',
};

const _$CategoriaItemEnumMap = {
  CategoriaItem.DOCUMENTOS: 'DOCUMENTOS',
  CategoriaItem.ELETRONICOS: 'ELETRONICOS',
  CategoriaItem.ROUPAS: 'ROUPAS',
  CategoriaItem.MATERIAL_ESCOLAR: 'MATERIAL_ESCOLAR',
  CategoriaItem.CHAVES: 'CHAVES',
  CategoriaItem.ACESSORIOS: 'ACESSORIOS',
  CategoriaItem.OUTROS: 'OUTROS',
};
