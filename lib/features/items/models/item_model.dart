import 'package:freezed_annotation/freezed_annotation.dart';
import 'item_enums.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

/// Modelo principal de um item de Achados e Perdidos.
///
/// Gerado com Freezed para imutabilidade + copyWith + equality.
/// Após qualquer alteração rode:
///   flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class ItemModel with _$ItemModel {
  const factory ItemModel({
    required int id,
    required String titulo,
    required String descricao,
    required TipoItem tipo,
    required CategoriaItem categoria,
    required String local,

    /// Formato esperado da API: "YYYY-MM-DD"
    required String dataOcorrido,
    required StatusItem status,
    required String nomeContato,
    required String telefoneContato,

    /// URL da imagem (opcional).
    String? imagemUrl,

    /// Observações adicionais (opcional).
    String? observacao,

    /// Gerado automaticamente pela API (ISO-8601).
    required String createdAt,

    /// Gerado automaticamente pela API (ISO-8601).
    required String updatedAt,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}
