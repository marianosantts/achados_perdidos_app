// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => _ItemModel(
  id: (json['id'] as num).toInt(),
  titulo: json['titulo'] as String,
  descricao: json['descricao'] as String,
  tipo: $enumDecode(_$TipoItemEnumMap, json['tipo']),
  categoria: $enumDecode(_$CategoriaItemEnumMap, json['categoria']),
  local: json['local'] as String,
  dataOcorrido: json['dataOcorrido'] as String,
  status: $enumDecode(_$StatusItemEnumMap, json['status']),
  nomeContato: json['nomeContato'] as String,
  telefoneContato: json['telefoneContato'] as String,
  imagemUrl: json['imagemUrl'] as String?,
  observacao: json['observacao'] as String?,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$ItemModelToJson(_ItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'tipo': _$TipoItemEnumMap[instance.tipo]!,
      'categoria': _$CategoriaItemEnumMap[instance.categoria]!,
      'local': instance.local,
      'dataOcorrido': instance.dataOcorrido,
      'status': _$StatusItemEnumMap[instance.status]!,
      'nomeContato': instance.nomeContato,
      'telefoneContato': instance.telefoneContato,
      'imagemUrl': instance.imagemUrl,
      'observacao': instance.observacao,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
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

const _$StatusItemEnumMap = {
  StatusItem.ABERTO: 'ABERTO',
  StatusItem.RESOLVIDO: 'RESOLVIDO',
};
