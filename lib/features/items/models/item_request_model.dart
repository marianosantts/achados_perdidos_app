import 'package:freezed_annotation/freezed_annotation.dart';
import 'item_enums.dart';

part 'item_request_model.freezed.dart';
part 'item_request_model.g.dart';

/// DTO de escrita enviado nas requisições POST e PUT da API.
///
/// Espelha o [ItemRequestDTO] do back-end Java.
/// Use [toJsonOmitNull] ao serializar para omitir campos opcionais
/// quando forem nulos (imagemUrl, observacao).
///
/// Após alterações, regenere com:
///   flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class ItemRequestModel with _$ItemRequestModel {
  const factory ItemRequestModel({
    /// Mínimo 3, máximo 100 caracteres.
    required String titulo,

    /// Máximo 1000 caracteres.
    required String descricao,

    required TipoItem tipo,
    required CategoriaItem categoria,

    /// Máximo 150 caracteres.
    required String local,

    /// Formato "YYYY-MM-DD".
    required String dataOcorrido,

    /// Máximo 100 caracteres.
    required String nomeContato,

    /// Máximo 20 caracteres.
    required String telefoneContato,

    /// URL da imagem — opcional, máximo 500 caracteres.
    String? imagemUrl,

    /// Observação adicional — opcional, máximo 500 caracteres.
    String? observacao,
  }) = _ItemRequestModel;

  factory ItemRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ItemRequestModelFromJson(json);
}

/// Extensão que serializa omitindo chaves com valor null.
///
/// Use no serviço: `request.toJsonOmitNull()`
extension ItemRequestModelX on ItemRequestModel {
  Map<String, dynamic> toJsonOmitNull() =>
      toJson()..removeWhere((_, v) => v == null);
}
